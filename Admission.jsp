<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Admission Form</title>
   <link rel="stylesheet" href="Admission.css">
  </head>
  <body>
 
    <div class="top-bar">
      <a href="index.jsp">Home</a>
    </div>

    <h1>ADMISSION DETAILS</h1>

<p>The school admits students in June every year. There are three steps:</p>

<ol style="max-width: 800px; text-align: left; margin-bottom: 30px; color: #555; font-size: 18px;">
  <li>The appropriate application form must be accompanied by the following:
    <ul>
      <li>Copies of TC.</li>
      <li>Copy of birth certificate.</li>
      <li>Passport size photograph – 1 [recent]</li>
      <li>Community certificate</li>
      <li>Two self-addressed </li>
    </ul>
  </li>
</ol>
<h1>PRE-BOOKING FORM</h1>

    <form id="admissionForm" action="admissionServlet" method="post" enctype="multipart/form-data">
      <label>Student Name</label>
      <input type="text" id="studentName" name="studentName" required />

      <label>Father Name</label>
      <input type="text" id="fatherName" name="fatherName" required />

      <label>Mother Name</label>
      <input type="text" id="motherName" name="motherName" required />

      <label>Phone Number</label>
      <input
        type="tel"
        id="phoneNumber"
        name="phoneNumber"
        pattern="[0-9]{10}"
        required
        placeholder="10 digit number"
      />

      <label>Student Age</label>
      <input type="number" id="studentAge" name="studentAge" required min="3" max="25" />

      <label>Gender</label>
      <select id="gender" name="gender" required>
        <option value="">Select Gender</option>
        <option value="male">Male</option>
        <option value="female">Female</option>
        <option value="others">Others</option>
      </select>
      <label>Admission for--</label>
      <select id="year" name="year" required>
         <option value="">Select Year</option>
        <option value="Pre KG">Pre KG</option>
        <option value="LKG">LKG</option>
        <option value="UKG">UKG</option>
        <option value="1st">1st</option>
        <option value="2nd">2nd</option>
        <option value="3nd">3nd</option>
        <option value="4th">4th</option>
        <option value="5th">5th</option>
        <option value="6th">6th</option>
        <option value="7th">7th</option>
        <option value="8th">8th</option>
        <option value="9th">9th</option>
        <option value="10th">10th</option>
        <option value="11th">11th</option>
        <option value="12th">12th</option>
      </select>
      <label>Address</label>
     <textarea id="address" name="address" required></textarea>

      <label>Pin Code</label>
      <input
        type="text"
        id="pincode"
        name="pincode"
        pattern="[0-9]{6}"
        required
        placeholder="6 digit PIN"
      />
      <label>Transfer Certificate</label>
      <input type="file" id="tc" name="tc" placeholder="Choose file" required/>
      <label>Student Photo</label>
      <input type="file" id="photo" name="photo" placeholder="Choose file" required/>
      <label>Birth Certificate</label>
      <input type="file" id="BC" name="BC" placeholder="Choose file" required/>
      <label>Community Certificate</label>
      <input type="file" id="CC" name="CC" placeholder="Choose file" required/>
      <label>Message</label>
      <textarea id="message" name="message" required></textarea>

      <button type="submit">Submit</button>
    </form>

   
  </body>
</html>
    