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
                
                <div class="button_container">
                    <div class="searchbar">
                        <input type="text" name="search" placeholder="Search.." id="search">
                    </div>
                    <a href="register.jsp"><button class="button">Register a User</button></a>
                    <a href="login.jsp"><button class="button">Log In</button></a>
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
	});
</script>

    </body>
</html>