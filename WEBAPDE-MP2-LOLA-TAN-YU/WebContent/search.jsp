<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Search Results</title>
    <link rel="stylesheet" type ="text/css" href="feed.css">
</head>
<body>
	<div id="main">
        <div class="nav">
            <div class="button_container">
                <div class="searchbar">
                    <input type="text" name="search" placeholder="Search.." value="NETWORK" id="search">
                </div>
            	<a href="home"><button class="button">Home</button></a>
            	<a href="profile.jsp"><button class="button">Profile</button></a>
                <a href="upload.html"><button class="button">Upload Photo</button></a>
                <a href="logout"><button class="button">Log Out</button></a>
            </div>
        </div>
        <div id="searchresults">
        	<br>
        	1 search result
        	<br>
        </div>
        <div id="photos">
                <div class="row">
                    <div class="column demo">
                        <img src="pic2.jpg" style="width:100%" onclick="openModal();currentSlide(2)" class="hover-shadow cursor">
                    </div>
                </div>
                
                <div id="myModal" class="modal">
                    <span class="close cursor" onclick="closeModal()">&times;</span>
                    <div class="modal-content">

                        <div class="mySlides">
                            <img src="pic2.jpg" style="width:100%">
                        </div>

                        <div class="caption-container">
                            <p id="caption"></p>
                        </div>


                        
                    </div>
                </div>
            </div>
    </div>
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
	  if (n > slides.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";
	  dots[slideIndex-1].className += " active";
	  captionText.innerHTML = dots[slideIndex-1].alt;
	}
	
	$('document').ready(function(){
		$('#search').keypress(function(e){
	        if(e.which == 13){
		        window.location.replace('search.jsp');
	        }
	    });
	});
</script>
</html>