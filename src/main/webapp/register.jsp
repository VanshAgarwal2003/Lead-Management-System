<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Autour+One&family=Poppins:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css files/style.css">
</head>
<body>

     <input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
    <input type="hidden" id="dialogBox" value="<%= request.getAttribute("mail-box")%>">
    <input type="hidden" id="passBox" value="<%= request.getAttribute("pass-box")%>"> 
    <section>
        <div class="container2">
            <div class="form-section">
                <h2>Registration</h2>
                <form action="register" method="post" autocomplete="off">

                    <div class="inputbox">
                        <ion-icon name="person-outline"></ion-icon>
                        <input type="text" name="fname" id="u-fname" required>
                        <label for="u-fname">First Name</label>
                    </div>

                    <div class="inputbox"> 
                        <ion-icon name="person-outline"></ion-icon>   
                        <input type="text" name="lname" id="u-lname" required>
                        <label for="u-lname">Last Name</label>
                    </div>

                    <div class="inputbox">
                        <ion-icon name="mail-outline"></ion-icon>
                        <input type="email" name="mail" id="u-mail" required>
                        <label for="u-mail">E-mail</label>
                    </div>

                    <div class="inputbox">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                        <input type="password" name="pass" id="u-pass" required>
                        <label for="u-pass">Password</label>
                    </div>

                    <div class="btn">
                        <button>Register</button>
                    </div>

                </form>
                <div class="backToLogin">
                    <a href="index.jsp"><ion-icon name="arrow-back-outline"></ion-icon>back to login</a>
                </div>
            </div>
            <div class="userlogin2">
                <img src="myImages/register.jpg" alt="">
            </div>
        </div>
        
    </section>
      

      <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
      <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
	    <script type="text/javascript">
	         let alert=document.getElementById("status").value;
	         if(alert==="success")
	          {
	        	 Swal.fire(
	        			  'Done!',
	        			  'Register Succesfully!',
	        			  'success'
	        			)
	          }
	         let dialogBox1=document.getElementById("dialogBox").value;
	         if(dialogBox1==="true")
	         {
	        	 Swal.fire('Email already exists!')	 
	         }
	         
	         let passBox=document.getElementById("passBox").value;
	         if(passBox=="true")
		     {
	        	Swal.fire('Password already exists!')		 
		   	 }
	      </script>

    </body>
</html>