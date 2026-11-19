<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*" %>
<%
    // 1. Retrieve form parameters
    String senderName = request.getParameter("name");
    String senderEmail = request.getParameter("email");
    String address = request.getParameter("address");
    String phone = request.getParameter("phno");
    String queries = request.getParameter("queries");

    // 2. Email configuration (Using Gmail SMTP)
    final String toEmail = "sandysenthil23825@gmail.com"; // Recipient email
    final String fromEmail = "sandysenthil23825@gmail.com"; // Your Gmail used to authenticate
    final String appPassword = "gwuj covi merz kbmh"; // Replace with your 16-digit Google App Password

    Properties props = new Properties();
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");

    // 3. Authenticate session
    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(fromEmail, appPassword);
        }
    });

    try {
        // 4. Compose the message
        MimeMessage message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(fromEmail));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
        message.setSubject("New Website Enquiry from " + senderName);

        String emailBody = "You have received a new enquiry:\n\n"
                         + "Name: " + senderName + "\n"
                         + "Email: " + senderEmail + "\n"
                         + "Mobile: " + phone + "\n"
                         + "Address: " + address + "\n\n"
                         + "Query:\n" + queries;

        message.setText(emailBody);

        // 5. Send the email
        Transport.send(message);

        // Redirect back with a success alert
        out.println("<script>alert('Enquiry sent successfully!'); window.location='contact.jsp';</script>");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Failed to send enquiry. Error: " + e.getMessage() + "'); window.location='contact.jsp';</script>");
    }
%>
