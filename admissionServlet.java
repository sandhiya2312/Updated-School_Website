import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/admissionServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 5 * 1024 * 1024,
    maxRequestSize = 20 * 1024 * 1024
)
public class admissionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String URL =
        "jdbc:mysql://localhost:3306/admission";

    private static final String USER = "root";

    private static final String PASSWORD = "sandy";

    // Database connection method
    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver not found", e);
        }

        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // File upload method
    private String uploadFile(Part part, String uploadPath)
            throws IOException {

        String originalName = Paths.get(
            part.getSubmittedFileName()
        ).getFileName().toString();

        String extension = "";

        int dot = originalName.lastIndexOf(".");

        if (dot >= 0) {
            extension = originalName.substring(dot);
        }

        // Generate a unique filename
        String fileName = UUID.randomUUID().toString() + extension;

        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Save file to uploads folder
        part.write(uploadPath + File.separator + fileName);

        return "uploads/" + fileName;
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        try {

            // 1. Receive form data

            String studentName = request.getParameter("studentName");
            String fatherName = request.getParameter("fatherName");
            String motherName = request.getParameter("motherName");

            String phoneNumber = request.getParameter("phoneNumber");

            int studentAge = Integer.parseInt(
                request.getParameter("studentAge")
            );

            String gender = request.getParameter("gender");

            String admissionFor = request.getParameter("year");

            String address = request.getParameter("address");

            String pincode = request.getParameter("pincode");

            String message = request.getParameter("message");

            // 2. Get uploaded files

            Part tcPart = request.getPart("tc");
            Part photoPart = request.getPart("photo");
            Part bcPart = request.getPart("BC");
            Part ccPart = request.getPart("CC");

            // 3. Create uploads folder inside web application

            String uploadPath = getServletContext().getRealPath("")
                    + File.separator + "uploads";

            // 4. Upload all four files

            String tcPath = uploadFile(tcPart, uploadPath);

            String photoPath = uploadFile(photoPart, uploadPath);

            String birthPath = uploadFile(bcPart, uploadPath);

            String communityPath = uploadFile(ccPart, uploadPath);

            // 5. Insert details into MySQL

            String sql = "INSERT INTO admission_details "
                    + "(student_name, father_name, mother_name, "
                    + "phone_number, student_age, gender, "
                    + "admission_for, address, pincode, "
                    + "tc, student_photo, birth_certificate, "
                    + "community_certificate, message) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            try (Connection con = getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setString(1, studentName);
                ps.setString(2, fatherName);
                ps.setString(3, motherName);
                ps.setString(4, phoneNumber);
                ps.setInt(5, studentAge);
                ps.setString(6, gender);
                ps.setString(7, admissionFor);
                ps.setString(8, address);
                ps.setString(9, pincode);
                ps.setString(10, tcPath);
                ps.setString(11, photoPath);
                ps.setString(12, birthPath);
                ps.setString(13, communityPath);
                ps.setString(14, message);

                int result = ps.executeUpdate();

                if (result > 0) {
                    response.getWriter().println(
                        "<h2>Admission Form Submitted Successfully!</h2>"
                    );

                    response.getWriter().println(
                        "<a href='index.html'>Go to Home</a>"
                    );
                } else {
                    response.getWriter().println(
                        "<h2>Admission submission failed!</h2>"
                    );
                }
            }

        } catch (SQLException e) {

            e.printStackTrace();

            response.getWriter().println(
                "<h2>Database Error! Please try again.</h2>"
            );

        } catch (NumberFormatException e) {

            response.getWriter().println(
                "<h2>Invalid student age!</h2>"
            );

        } catch (IllegalStateException e) {

            response.getWriter().println(
                "<h2>File size limit exceeded!</h2>"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "<h2>Something went wrong. Please try again.</h2>"
            );
        }
    }
}


	
	


