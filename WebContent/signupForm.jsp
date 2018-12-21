<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="signup.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>SignUp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="signupCSS/style.css">

</head>
<body>
<%
	Signupdata data = (Signupdata)session.getAttribute("signupData");
%>
 
  <form action="SignupInsert" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
 <div class="flexbox" style="height: 100%;">
  <div class="content" style="width: 600px;;">
    <div id="login" class="box show">
      <div class="field">
        <div class="sign-in">Sign-up Form<br></div>
      </div>
      
      
      <div class="field" style="width: 37%;margin-left: 5%;">
        <label>Aadhar No</label>
        <input type="text" value="<%=data.getAadhar() %>" name="aadhar" readonly style="opacity: 0.6;">
      </div>
      
      <div class="field" style="width: 37%;margin-left: 55%;margin-top: -13.5%;">
        <label>Mobile No</label>
        <input type="text" value="<%=data.getCon_no()%>" name="con_no" readonly style="opacity: 0.6;">
      </div>
        
        
      <div class="field" style="width: 25%;margin-left: 5%">
        <label>First Name</label>
        <input type="text" name="fname" id="name">
      </div>
      
      <div class="field" style="width: 25%;margin-left: 36%;margin-top: -13.5%;">
        <label>Middle Name</label>
        <input type="text" name="mname" id="middlename">
      </div>
        
        <div class="field" style="width: 25%;margin-left: 67%;margin-top: -13.5%;">
        <label>Last Name</label>
        <input type="text" name="lname" id="lastname">
      </div>
      
      
     <div class="field" style="width: 87%;margin-left: 5%;">
      <label>Address</label>
        <input type="text" name="address" id="addr">
      </div>
      
      
      
      <div class="field" style="width: 87%;margin-left: 5%;">
        <label>Email Id</label>
        <input type="text" name="email" id="email">
      </div>
      
      
      <div class="field" style="width: 37%;margin-left: 5%;">
        <label>Password</label>
        <input type="password" name="password" id="pwd1">
      </div>
      
      <div class="field" style="width: 37%;margin-left: 55%;margin-top: -13.5%;">
        <label>Confirm Password</label>
        <input type="password" name="c_password" id="pwd2">
      </div>
      
      <div style="margin-left: 25px;">
      <label>Gender</label><br>
      <input type="radio" name="gender" id="ma" value="male"> Male<br>
      <input type="radio" name="gender" id="fe" value="female"> Female<br>
      <input type="radio" name="gender" id="pre" value="other"> Prefer Not to mention<br>
      </div>
      
      <div  style="width: 88%;margin-left: 5%;position: relative;">
          <p style="margin-top: 50px;float: bottom;">Upload Your Profile Picture</p>
      <img src="1.jpg" style="width: 100px;margin-left: 70%;margin-top: -34px;position: absolute;">
      <input  type="file" id="myfile" name="photo" style="display: block;margin-top: -34px;margin-left: 70%;z-index: 2;position: relative;opacity: 0;" onchange="return validate_fileupload(this.value,this.id);"/>
      <img id="blah" src="#" alt="your image" style="margin-left: 70%;margin-top: 20px;"/>
      </div>
      <br>
      <br>
       
      <div class="field" style="width: 88%;margin-left: 5%;">
        <button class="btn-sign-in">Sign In</button>
      </div>
    </div>
  </div>
</div>
</form>
<!--  
	Signup here
	<form action="SignupInsert" method="post" enctype="multipart/form-data">
	aadhar:<input type="text" name="aadhar"><br>
	name:<input type="text" name="name"><br>
	phone no:<input type="text" name="con_no"><br>
	email:<input type="text" name="email"><br>
	gender:<input type="text" name="gender"><br>
	address:<input type="text" name="address"><br>
	photo:<input type="file" name="photo">
	<input type="submit" name="aadhar" value="submit">
	</form>
	-->

</body>
<script>
    
function validateForm() {
    
	var msg="\tERROR!!!\nPassword should contain\n1.Atleast 8 Characters \n2.Atleast 1 Capital lette (A-Z)\n3.Atleast 1 special character\n4.Atleast 1 number(0-9)";
     var x = document.getElementById("name").value;
   
if (x =="") {
    alert("Name must be filled out");
    return false;
}
    
 var matches = x.match(/\d+/g);
        
if (matches != null) {
alert("Any name field cannot contain any number");
return false;
}
    
 var x = document.getElementById("middlename").value;
   
if (x =="") {
    alert("Name must be filled out");
    return false;
}
    
 var matches = x.match(/\d+/g);
        
if (matches != null) {
alert("Any name field cannot contain any number");
return false;
}
    
    var x = document.getElementById("lastname").value;
   
if (x =="") {
    alert("Name must be filled out");
    return false;
}
    
 var matches = x.match(/\d+/g);
        
if (matches != null) {
alert("Any name field cannot contain any number");
return false;
}
    
    var x = document.getElementById("email").value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        
     alert("Please Enter Valid email id");
        return false;
    }
       
    if(document.getElementById("addr").value=="")
        {
            alert("Please Enter your address");
            return false;
        }
    
    
if(document.getElementById("pwd1").value.length < 8) {
        alert(msg);
        return false;
      }
    var re = /[0-9]/;
      if(!re.test(document.getElementById("pwd1").value)) {
        alert(msg);
        return false;
      }
      re = /[a-z]/;
      if(!re.test(document.getElementById("pwd1").value)) {
        alert(msg);
        return false;
      }
      re = /[A-Z]/;
      if(!re.test(document.getElementById("pwd1").value)) {

        alert(msg);
        return false;
      }
      var iChars = "!`@#$%^&*()+=-[]\\\';,./{}|\":<>?~_";   

      var data = document.getElementById("pwd1").value;
      var flag=0;

      for (var i = 0; i < data.length; i++)
          if (iChars.indexOf(data.charAt(i)) != -1)
				flag=1;
      
      if(flag==0)
    	  {
    	  alert(msg);
    	  }
    var pass=document.getElementById("pwd1").value;
    var confi=document.getElementById("pwd2").value;
    
    if(pass!=confi){
        alert("Error:Password Doesnt match");
        return false;
    }
    if(document.getElementById("ma").checked==false&&document.getElementById("fe").checked==false&&document.getElementById("pre").checked==false)
        {
            alert("Please select your gender");
            return false;
        }
    
    
}
</script>
<script>
function validate_fileupload(fileName,valid)
{
    
    var allowed_extensions = new Array("jpg","png","gif");
    var file_extension = fileName.split('.').pop().toLowerCase(); 
    var j=0;
    for(var i = 0; i <= allowed_extensions.length; i++)
        if(allowed_extensions[i]==file_extension)
            j=1;
    
    if(j==0)
        {
            alert("Please select appropriate file type like\n1.jpg\n2.png\n3.gif");
            document.getElementById(valid).value="";
            return false;
        }
            
}

</script>
<script type="text/javascript"></script>
</html>