<html>
    <head>
        <title>
            Photo Feed
        </title>  
        
        <link rel="stylesheet" type ="text/css" href="feed.css">
    </head>
    
    <body>
        <div id="main">
            <div class="nav">
            	<!-- for testing of cookie -->
            	Hello, ${sessionScope.username}!
                <div class="button_container">
                    <div class="searchbar">
                        <input type="text" name="search" placeholder="Search.." id="search">
                    </div>
                	<a href="photo_feed.jsp"><button class="button">Home</button></a>
                	<a href="profile.jsp"><button class="button">Profile</button></a>
                    <a href="upload.html"><button class="button">Upload Photo</button></a>
                    <a href="logout"><button class="button">Log Out</button></a>
                </div>
            </div>
            <div id="photos">
                <div class="row">
                    <div class="column demo">
                        <img src="pic.png" style="width:100%" onclick="openModal();currentSlide(1)" class="hover-shadow cursor">
                    </div>
                    <div class="column demo">
                        <img src="pic2.jpg" style="width:100%" onclick="openModal();currentSlide(2)" class="hover-shadow cursor">
                    </div>
                    <div class="column demo">
                        <img src="pic3.jpg" style="width:100%" onclick="openModal();currentSlide(3)" class="hover-shadow cursor">
                    </div>
                    <div class="column demo">
                        <img src="pic4.jpg" style="width:100%" onclick="openModal();currentSlide(4)" class="hover-shadow cursor">
                    </div>
                    <div class="column demo">
                        <img src="pic5.jpg" style="width:100%" onclick="openModal();currentSlide(5)" class="hover-shadow cursor">
                    </div>
                    <div class="column demo">
                        <img src="pic6.jpg" style="width:100%" onclick="openModal();currentSlide(6)" class="hover-shadow cursor">
                    </div>
                    <div class="column demo">
                        <img src="pic7.jpg" style="width:100%" onclick="openModal();currentSlide(7)" class="hover-shadow cursor">
                    </div>
                    <div class="column demo">
                        <img src="pic8.jpg" style="width:100%" onclick="openModal();currentSlide(8)" class="hover-shadow cursor">
                    </div>
                </div>
                
                <div id="myModal" class="modal">
                    <span class="close cursor" onclick="closeModal()">&times;</span>
                    <div class="modal-content">
                        <div class="mySlides">
                            <img src="pic.png" style="width:100%">
                        </div>

                        <div class="mySlides">
                            <img src="pic2.jpg" style="width:100%">
                        </div>

                        <div class="mySlides">
                            <img src="pic3.jpg" style="width:100%">
                        </div>

                        <div class="mySlides">
                            <img src="pic4.jpg" style="width:100%">
                        </div>
                        
                        <div class="mySlides">
                            <img src="pic5.jpg" style="width:100%">
                        </div>
                        
                        <div class="mySlides">
                            <img src="pic6.jpg" style="width:100%">
                        </div>
                        
                        <div class="mySlides">
                            <img src="pic7.jpg" style="width:100%">
                        </div>
                        
                        <div class="mySlides">
                            <img src="pic8.jpg" style="width:100%">
                        </div>

                        <div class="caption-container">
                            <p id="caption"></p>
                        </div>


                        
                    </div>
                </div>
            </div>
        </div>

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
	  //captionText.innerHTML = dots[slideIndex-1].alt;
	  captionText.innerHTML = "INSERT TITLE AND DESCRIPTION HERE <br> #SAMPLE #TAGS";
	}
	
	$('document').ready(function(){
		$('#search').keypress(function(e){
	        if(e.which == 13){
		        window.location.replace('search.jsp');
	        }
	    });
		/*
		$(document).keyup(function(e) {
	    	console.log('asfsdg');
		  if (e.keyCode === 27) {
	        	closeModal();
		  };
		})*/
	});
</script>

    </body>
</html>