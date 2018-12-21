<%@page import="General.QueryLayer"%>
<%@page import="java.sql.* , signup.Signupdata" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Maharashtra Police FIR</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="signupCSS/style.css">
</head>
<body onload="func1()">
<%
QueryLayer q = new QueryLayer();
Signupdata s = q.getUserProfile("123456789123");
int count=q.firCount();
%>
<div class="flexbox" style="height: 100%;">
  <div class="content" style="width: 900px;height:190%;margin-top: 50%;">
    <div id="login" class="box show">
     <form name="myForm" action="Addfir" onsubmit="return validateForm()" method="post">
      <div class="field">
        <div class="sign-in">First Information Report     (FIR)<br></div>
      </div>
      
      
      <div class="field" style="width: 25%;margin-left: 5%;">
        <label>Area</label>
        <input type="text" name="dist" value="<%=s.getAddress()%>" disabled>
      </div>
      
      <div class="field" style="width: 25%;margin-left: 35%;margin-top: -8.5%;">
        <label>Police Station</label>
        <input type="text"  name="polstation" value="<%=s.getAddress()%> Police station" disabled>
      </div>
        
        
      <div class="field" style="width: 25%;margin-left: 67%;margin-top: -8.5%;">
        <label>Date</label>
        <input type="text" name="date" id="DATE" disabled>
      </div>
      
      <div class="field" style="width: 25%;margin-left: 5%;margin-top:5%;">
        <label>FIR No</label>
        <input type="number" name="firno" value="<%= count+1%>" disabled>
      </div>
        
        <div class="field" style="width: 25%;margin-left: 35%;margin-top: -8.5%;">
        <label>System Time</label>
        <input type="text" name="systime" id="stime" disabled >
        </div>
        
         <div class="field" style="width: 25%;margin-left: 67%;margin-top: -8.5%;">
        <label>Real Time</label>
        <input type="text" name="realtime" id="rtime" disabled>
        </div>
      
      
     <div class="field" style="width: 40%;margin-left: 5%;">
      <label>Section</label>
      <br>
       <select style="width:100%;height: 35px;border-radius: 3px;background-color:#DCDCDC;border:none;" onchange="func(this.value)">
       		<option value="0">--Select IPC--</option>
	  		<option value="1">301</option>
	  		<option value="2">320</option>
	  		<option value="3">312</option>
	  		<option value="4">340</option>
	   </select>
      </div>
      
      <div class="field" style="width: 40%;margin-left: 52%;margin-top: -8.5%;">
      <label>Acts</label>
        <input type="text" required name="acts" id="div1" value="none">
      </div>
      
       <div class="field">
        <div class="sign-in" style="margin-top: 6%;">Complainant Information<br></div>
      </div>
      
      <div class="field" style="width: 25%;margin-left: 5%;">
        <label>Name</label>
        <input type="text" id="name" name="comname" required>
      </div>
      
      <div class="field" style="width: 25%;margin-left: 35%;margin-top: -8.5%;">
        <label>Fathers Name</label>
        <input type="text"  id="fname" name="fatname" required>
      </div>
        
        
      <div class="field" style="width: 25%;margin-left: 67%;margin-top: -8.5%;">
        <label>Date of Birth</label>
        <input type="date" required name="dob" >
      </div>
      
      <div class="field" style="width: 25%;margin-left: 5%;margin-top:5%;">
        <label>UID no</label>
        <input type="number" required name="uidno">
      </div>
        
        <div class="field" style="width: 25%;margin-left: 35%;margin-top: -8.5%;">
        <label>Passport No</label>
        <input type="text" required name="passno">
        </div>
        
         <div class="field" style="width: 25%;margin-left: 67%;margin-top: -8.5%;">
        <label>Date of Issue</label>
        <input type="date" required name="doi">
        </div>
      
      
       <div class="field" style="width: 40%;margin-left: 5%;">
       <label>Current Address</label>
       <input type="text"  required name="curadd">
       </div>
      
       <div class="field" style="width: 40%;margin-left: 52%;margin-top: -8.5%;">
      <label>Permannent Address</label>
        <input type="text"  required name="peradd">
      </div>
      
      <div class="field">
        <div class="sign-in" style="margin-top: 6%;">Accussed Information<br></div>
      </div>
      
      <div class="field" style="width: 25%;margin-left: 5%;">
        <label>Name</label>
        <input type="text" id="Aname" required name="aname">
      </div>
      
      <div class="field" style="width: 25%;margin-left: 35%;margin-top: -8.5%;">
        <label>Alias</label>
        <input type="text" required name="alias" >
      </div>
        
        
      <div class="field" style="width: 25%;margin-left: 67%;margin-top: -8.5%;">
        <label>Relatives Names</label>
        <input type="text"  id="Rname" required name="rname">
      </div>
      
      
       <div class="field" style="width: 87%;margin-left: 5%;">
       <label>Current Address</label>
       <input type="text"  id="addr" required name="acuradd">
       </div>
       
       <div class="field" style="width: 87%;margin-left: 5%;margin-top: 5%;">
       <h2>First Information Containt</h2>
       <textarea rows="5" cols="50" style="background: #D3D3D3;border: none;border-radius: 5px;" required name="fir"></textarea>
       </div>
       
       <div class="field" style="width: 88%;margin-left: 5%;">
        <input type="submit" value="Submit" style="width: 50%;margin-left: 25%;margin-top: 3%;background-color: #0099FF">
      </div>
        </form>
        </div>
        </div>
        </div>
      
     
<script>
    
function validateForm() {
   
     var x = document.getElementById('name').value;
    var fx = document.getElementById('fname').value;
     var rx = document.getElementById('Rname').value;
    var ax = document.getElementById('Aname').value
   
if (x =="") {
    alert("Name must be filled out");
    return false;
}
    
 var matches = x.match(/\d+/g);
        
if (matches != null) {
alert("Any name field cannot contain any number");
return false;
}
    
 var matches = fx.match(/\d+/g);
        
if (matches != null) {
alert("Any name field cannot contain any number");
return false;
}
    
    var matches = rx.match(/\d+/g);
        
if (matches != null) {
alert("Any name field cannot contain any number");
return false;
}
    
    var matches = ax.match(/\d+/g);
        
if (matches != null) {
alert("Any name field cannot contain any number");
return false;
}
    
    
    
     
}
</script>
<script>
function func(x) {
	  
    if(x==1){
        document.getElementById("div1").value="Causing Death Of a Person";

    }
    else if(x==2){
         document.getElementById("div1").value="Grevious Hurt";
    }
    else if(x==3){
         document.getElementById("div1").value="Causing Miscarriage";
    }
    else if(x==4){
         document.getElementById("div1").value="Wrongful Confinement";
    }
    else if(x==0){
        document.getElementById("div1").value=" ";
   }
}
</script>
<script>
function func1(){
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!

var yyyy = today.getFullYear();
if(dd<10){
    dd='0'+dd;
} 
if(mm<10){
    mm='0'+mm;
} 
var today = dd+'/'+mm+'/'+yyyy;
document.getElementById("DATE").value = today;  

var d = new Date(),
h = (d.getHours()<10?'0':'') + d.getHours(),
m = (d.getMinutes()<10?'0':'') + d.getMinutes();
document.getElementById("stime").value =  h + ':' + m;
document.getElementById("rtime").value =  h + ':' + m;

}
</script>
</body>
</html>