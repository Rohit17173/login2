import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login2", "root", "redhat123");
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM user WHERE email=? AND password=?");
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                // Valid login credentials
                String name = rs.getString("name");
                int age = rs.getInt("age");
                String contact = rs.getString("contact");

                // Create a session and store user data in it
                HttpSession session = request.getSession();
                session.setAttribute("name", name);
                session.setAttribute("age", age);
                session.setAttribute("contact", contact);

                // Redirect to the home page or any other secured page
                response.sendRedirect("home/home.jsp"); // Replace "home.jsp" with the actual home page URL
            } else {
                // Invalid login credentials
                 request.setAttribute("errorMessage", "Invalid email or password.");
                 request.getRequestDispatcher("login.jsp").forward(request, response); // Redirect back to the login page
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.html"); // Redirect to an error page if there's an issue with the login process
        }
    }
}
