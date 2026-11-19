<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Contact & Enquiry Page</title>
    <link rel="stylesheet" href="contact.css">
  </head>
  <body>
    <h2>Contact Information</h2>
    <div class="container">
      <div class="left-section">
        <iframe
          src="https://maps.google.com/maps?q=Kolathur%20Mettur&t=&z=13&ie=UTF8&iwloc=&output=embed"
        ></iframe>
        <div class="contact-detail">
          <strong>Contact Person:</strong>
          <p>Principal</p>
        </div>
        <div class="contact-detail">
          <strong>Address:</strong>
          <p>
            J.B. Matric. Hr. Sec. School, Kolathur - 636303, Mettur (Tk), Salem
            District
          </p>
        </div>
        <div class="contact-detail">
          <strong>Phone No:</strong>
          <p>+91 04298-251998, 98658-82049, 39</p>
        </div>
        <div class="contact-detail">
          <strong>Email ID:</strong>
          <p>jb.mskolathur@gmail.com</p>
        </div>
      </div>

      <div class="right-section">
        <h2>Enquiry</h2>
        <form action="sendMail.jsp" method="post">
          <div class="form-group">
            <label>Your Name</label>
            <input type="text" id="name" name="name" required />
          </div>
          <div class="form-group">
            <label>Your Mail</label>
            <input type="email" id="email" name="email" required />
          </div>
          <div class="form-group">
            <label>Address</label>
            <textarea id="address" name="address"></textarea>
          </div>
          <div class="form-group">
            <label>Mobile Number</label>
            <input
              type="tel"
              id="phno"
              name="phno"
              pattern="[0-9]{10}"
              placeholder="10 digit number"
              required
            />
          </div>
          <div class="form-group">
            <label>Queries</label>
            <textarea id="queries" name="queries" required></textarea>
          </div>
          
          <button type="submit">Send Enquiry</button>
        </form>
      </div>
    </div>
  </body>
</html>
