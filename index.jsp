<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>J.B.Matric Hr.Sec.School</title>
    <link rel="stylesheet" href="index.css">
  </head>

  <body>
    <header>
      <div class="school-name">J.B.Matric Hr.Sec.School</div>
    </header>

    <div class="main-content">
      <div class="left-menu">
        <a href="#">Home</a>
        <a href="about.jsp">About</a>
        <a href="academic.jsp">Academic</a>
        <a href="facilities.jsp">Facility</a>
        <a href="gallery.jsp">Gallery</a>
        <a href="Admission.jsp">Admission</a>
        <a href="contact.jsp">Contact Us</a>
      </div>

      <div class="slider">
        <img src="Pictures/9.jpg" class="active" alt="Image 1" />
        <img src="Pictures/jj 4.jpg" alt="Image 2" />
        <img src="Pictures/jb 14.jpg" alt="Image 3" />
        <img src="Pictures/jb6.jpg" alt="Image 4" />
        <img src="Pictures/jb 16.jpg" alt="Image 5" />

        <div class="buttons">
          <button onclick="prevSlide()">❮</button>
          <button onclick="nextSlide()">❯</button>
        </div>
      </div>
    </div>

    <div class="paragraph-container"></div>

    <div class="paragraph">
      <h5>
        J.B. Matric. Hr. Sec. School, Kolathur is run by J.B. Educational trust,
        Kolathur.
      </h5>
      It was started in 1988. Around 1000 students are studying here. 40
      teaching staff and 26 non-teaching staff are working under the able
      guidance of the founder Mr. Jayaraman, an excellent teacher awardee and
      the correspondent Mr. J. Thangavelan B.E., MBA. The school offers
      well-equipped science labs, smart classes and kids park. We offer special
      care to every student, motivating them to express their thoughts clearly.
      Extra-curricular activities like Sports, Yoga, Karate, and dance are given
      importance. We conduct exhibitions, essay, drawing, and elocution
      competitions, as well as industrial visits. Parent-teacher meetings are
      conducted regularly to interact and track student progress. Our motto is
      to bring out every child as a successful personality.
    </div>

    <footer>
      <div class="footer-content">
        <div class="footer-details">
          <p>📞 +91 98765 43210</p>
          <p>📧 jbm.school@gmail.com</p>
          <p>📘 Facebook: fb.com/jbm.school</p>
        </div>
        <div class="footer-logo">
          <img src="Pictures/google.jpg" alt="School Logo" />
        </div>
      </div>
    </footer>

    <script>
      let slideIndex = 0;
      const slides = document.querySelectorAll(".slider img");

      function showSlide(index) {
        slides.forEach((img, i) => {
          img.classList.remove("active");
          if (i === index) {
            img.classList.add("active");
          }
        });
      }

      function nextSlide() {
        slideIndex = (slideIndex + 1) % slides.length;
        showSlide(slideIndex);
      }

      function prevSlide() {
        slideIndex = (slideIndex - 1 + slides.length) % slides.length;
        showSlide(slideIndex);
      }

      setInterval(nextSlide, 4000);
    </script>
  </body>
</html>
