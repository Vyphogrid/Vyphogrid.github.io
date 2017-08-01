<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>
<link rel="stylesheet" type="text/css" href="feed.css">
<link rel="stylesheet" type="text/css" href="profile.css">
</head>
<body>
	<!--
		<%int x = 0;%>
		
		<%for (int i = 1; i <= 6; i++) {%>
			<h<%=i%>>Hello!</h<%=i%>>
		<%}%>
		
		Your name is ${user.username} 
-->

	<div id="main">
		<div class="nav">
			<div class="button_container">
				<div class="searchbar">
					<input type="text" name="search" placeholder="Search.." id="search">
				</div>
				<a href="home"><button class="button">Home</button></a> <a
					href="profile.jsp"><button class="button">Profile</button></a> <a
					href="upload.html"><button class="button">Upload Photo</button></a>
				<a href="logout"><button class="button">Log Out</button></a>
			</div>
		</div>
		<div class="profpic">
			<img class="dp" src="profile2.JPG" style="width: 25%">
		</div>
		<div class="description">
			<h1>Julius Lola</h1>
			<br> Chicken nuggets is lyf
		</div>

		<div id="photos">
			<div class="row">
				<div class="column demo">
					<img src="pic.png" style="width: 100%"
						onclick="openModal();currentSlide(1)" class="hover-shadow cursor">
				</div>
				<div class="column demo">
					<img src="pic2.jpg" style="width: 100%"
						onclick="openModal();currentSlide(2)" class="hover-shadow cursor">
				</div>
				<div class="column demo">
					<img src="pic3.jpg" style="width: 100%"
						onclick="openModal();currentSlide(3)" class="hover-shadow cursor">
				</div>
				<div class="column demo">
					<img src="pic4.jpg" style="width: 100%"
						onclick="openModal();currentSlide(4)" class="hover-shadow cursor">
				</div>
				<div class="column demo">
					<img src="pic5.jpg" style="width: 100%"
						onclick="openModal();currentSlide(5)" class="hover-shadow cursor">
				</div>
				<div class="column demo">
					<img src="pic6.jpg" style="width: 100%"
						onclick="openModal();currentSlide(6)" class="hover-shadow cursor">
				</div>
				<div class="column demo">
					<img src="pic7.jpg" style="width: 100%"
						onclick="openModal();currentSlide(7)" class="hover-shadow cursor">
				</div>
				<div class="column demo">
					<img src="pic8.jpg" style="width: 100%"
						onclick="openModal();currentSlide(8)" class="hover-shadow cursor">
				</div>
				<div class="column demo">
					<img src="pic9.jpg" style="width: 100%"
						onclick="openModal();currentSlide(9)" class="hover-shadow cursor">
				</div>
				<div class="column demo">
					<img src="pic10.jpg" style="width: 100%"
						onclick="openModal();currentSlide(10)" class="hover-shadow cursor">
				</div>
				<div class="column demo">
					<img src="pic11.jpg" style="width: 100%"
						onclick="openModal();currentSlide(11)" class="hover-shadow cursor">
				</div>
				<div class="column demo">
					<img src="pic12.jpg" style="width: 100%"
						onclick="openModal();currentSlide(12)" class="hover-shadow cursor">
				</div>
			</div>

			<div id="myModal" class="modal">
				<span class="close cursor" onclick="closeModal()">&times;</span>
				<div class="modal-content">
					<div class= "edit">
						<div class="transbox">
							<a href="edit.html"><p> Edit Photo Details </p></a>
						</div>
					</div>
					<div class="mySlides">
						<img src="pic.png" style="width: 100%">
					</div>

					<div class="mySlides">
						<img src="pic2.jpg" style="width: 100%">
					</div>

					<div class="mySlides">
						<img src="pic3.jpg" style="width: 100%">
					</div>

					<div class="mySlides">
						<img src="pic4.jpg" style="width: 100%">
					</div>

					<div class="mySlides">
						<img src="pic5.jpg" style="width: 100%">
					</div>

					<div class="mySlides">
						<img src="pic6.jpg" style="width: 100%">
					</div>

					<div class="mySlides">
						<img src="pic7.jpg" style="width: 100%">
					</div>

					<div class="mySlides">
						<img src="pic8.jpg" style="width: 100%">
					</div>

					<div class="mySlides">
						<img src="pic9.jpg" style="width: 100%">
					</div>

					<div class="mySlides">
						<img src="pic10.jpg" style="width: 100%">
					</div>

					<div class="mySlides">
						<img src="pic11.jpg" style="width: 100%">
					</div>

					<div class="mySlides">
						<img src="pic12.jpg" style="width: 100%">
					</div>

					<div class="caption-container">
						<p id="caption"></p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--         
    Username is ${sessionScope.username}!
	<br><br>
	Description is ${sessionScope.description}!
	<br><br>
	<a href="logout">Log out</a>
       -->

</body>

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<script>
	function openModal() {
		document.getElementById('myModal').style.display = "block";
	}

	function closeModal() {
		document.getElementById('myModal').style.display = "none";
	}

	var slideIndex = 1;
	showSlides(slideIndex);

	function plusSlides(n) {
		showSlides(slideIndex += n);
	}

	function currentSlide(n) {
		showSlides(slideIndex = n);
	}

	function showSlides(n) {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("demo");
		var captionText = document.getElementById("caption");
		if (n > slides.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
		//captionText.innerHTML = dots[slideIndex-1].alt;
		captionText.innerHTML = "INSERT TITLE AND DESCRIPTION HERE <br> #SAMPLE #TAGS";
	}
	$('document').ready(function() {
		$('#search').keypress(function(e) {
			if (e.which == 13) {
				window.location.replace('search.jsp');
			}
		});
	});
</script>
</html>