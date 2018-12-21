<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="signup.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="applicationFormCSS/style.css">
<title>Insert title here</title>
</head>
<body>

<%
	Signupdata data = (Signupdata)session.getAttribute("user");
	if(data==null)
	{
		response.sendRedirect("login.jsp");
	}
	else{
		String applicationId = String.valueOf(Signup.getRandomInteger(10000,1000000));
%>
 <div class="flexbox" style="height: 100%;">
  <div class="content" style="width: 600px;;">
    <div id="login" class="box show" style="height:auto;">
      <div class="field">
        <div class="sign-in">Application Form For Document Retrieval<br></div>
      </div>
      
      <form action="addapplication" method="post" enctype="multipart/form-data">
      <div class="field" style="width: 37%;margin-left: 5%;">
        <label>Application Id</label>
        <input type="text" value="<%= applicationId%>" name="application_id"readonly style="opacity: 0.6;">
      </div>
      
      <div class="field" style="width: 37%;margin-left: 55%;margin-top: -13.5%;">
        <label>Aadhar Number</label>
        <input type="text" value="<%= data.getAadhar() %>" name="aadhar" readonly style="opacity: 0.6;">
      </div>
      
      <div class="field" style="width: 37%;margin-left: 5%;">
        <label>Name</label>
        <input type="text" value="<%= data.getName() %>" name="name" readonly style="opacity: 0.6;">
      </div>
      
      <div class="field" style="width: 37%;margin-left: 55%;margin-top: -13.5%;">
        <label>Mobile No</label>
        <input type="text" value="<%= data.getCon_no() %>" name="con_no" readonly style="opacity: 0.6;">
      </div> 
        <div class="field" style="width: 87%;margin-left: 5%;">
        <label>Discription</label>
        <input type="text"  name="desc" style="opacity: 0.8;">
      </div>
        
        <div class="field" style="width: 87%;margin-left: 5%;">
        <select id="dd" name="typeOfDoc" style="width: 100%;height: 30px;border-radius: 5px;background-color:#DCDCDC;" onchange="func(this.value)">
          <option value="0"> --Select Option--</option>
          <option value="Clearance">Clearance Certificate</option>
          <option value="PG">PG</option>
          <option value="Employement">Employement Certificate</option>
          <option value="Passport">Passport Certificate</option>
        </select>
        </div>
        <!--Clearance-->
       <div id="d1" style="display: none;">
          <br>
          <p>Documents needs to be uploaded</p>
          <br>
           <p>1.Living Certificate</p>
           <div style="width: 30%;float: right;height: 30px;margin-top: -40px;">
           <img src="upload.png" style="width: 100px;position: absolute;" id="i11">
            <input id="file-input" type="file" name="clear-lc" style="display: block;z-index: 2;position: relative;opacity: 0;"  onchange="return validate_fileupload(this.value,this.id,'i11');"/>

            </div>
            <br>
            <br>
            <p>2.Aadhaar Card</p>
           <div style="width: 30%;float: right;height: 30px;margin-top: -40px;">
           <img src="upload.png" style="width: 100px;position: absolute;" id="i12">
            <input id="file-input" type="file" name="clear-aadhar-card"  style="display: block;z-index: 2;position: relative;opacity: 0;" onchange="return validate_fileupload(this.value,this.id,'i12');"/>

            </div>
            <br>
            <br>
            <p>3.SSC Marksheet</p>
           <div style="width: 30%;float: right;height: 30px;margin-top: -40px;">
            <img src="upload.png" style="width: 100px;position: absolute;" id="i13">
            <input id="file-input" type="file" name="clear-ssc"  style="display: block;z-index: 2;position: relative;opacity: 0;" onchange="return validate_fileupload(this.value,this.id,'i13');"/>
            </div>
            <br>
            <br>
            <p>4.HSC Marksheet</p>
           <div style="width: 30%;float: right;height: 30px;margin-top: -40px;">
            <img src="upload.png" style="width: 100px;position: absolute;" id="i14">
            <input id="file-input" type="file" name="clear-hsc"  style="display: block;z-index: 2;position: relative;opacity: 0;" onchange="return validate_fileupload(this.value,this.id,'i14');"/>
            </div>
            <br>
            <br>
            <br>
       </div>
        <!--PG-->       
       <div id="d2" style="display: none;">
            <br>
            <p>Documents needs to be uploaded</p>
            <br>
           <p>1.Agreement Certificate</p>
           <div style="width: 30%;float: right;height: 30px;margin-top: -40px;">
           <img src="upload.png" style="width: 100px;position: absolute;" id="i21">
            <input id="file-input" type="file" name="pg-agreement"   style="display: block;z-index: 2;position: relative;opacity: 0;" onchange="return validate_fileupload(this.value,this.id,'i21');"/>
            </div>
            <br>
            <br>
            <p>2.Aadhaar Card</p>
           <div style="width: 30%;float: right;height: 30px;margin-top: -40px;">
           <img src="upload.png" style="width: 100px;position: absolute;" id="i22">
            <input id="file-input" type="file" name="pg-aadhar-card"   style="display: block;z-index: 2;position: relative;opacity: 0;" onchange="return validate_fileupload(this.value,this.id,'i22');"/>
            </div>
            <br>
            <br>
            <p>3.SSC Marksheet</p>
           <div style="width: 30%;float: right;height: 30px;margin-top: -40px;">
           <img src="upload.png" style="width: 100px;position: absolute;" id="i23">
            <input id="file-input" type="file" name="pg-ssc" style="display: block;z-index: 2;position: relative;opacity: 0;" onchange="return validate_fileupload(this.value,this.id,'i23');"/>
            </div>
            <br>
            <br>
            <p>4.HSC Marksheet</p>
           <div style="width: 30%;float: right;height: 30px;margin-top: -40px;">
           <img src="upload.png" style="width: 100px;position: absolute;" id="i24">
            <input id="file-input" type="file" name="pg-hsc"   style="display: block;z-index: 2;position: relative;opacity: 0;" onchange="return validate_fileupload(this.value,this.id,'i24');"/>
            </div>
             <br>
            <br>
            <p>5.Light Bill</p>
           <div style="width: 30%;float: right;height: 30px;margin-top: -40px;">
           <img src="upload.png" style="width: 100px;position: absolute;" id="i25">
            <input id="file-input" type="file" name="pg-light-bill"   style="display: block;z-index: 2;position: relative;opacity: 0;" onchange="return validate_fileupload(this.value,this.id,'i25');"/>
            </div>
            <br>
            <br>
            <br>
       </div>
       <!-- Employement -->
       <div id="d3" style="display: none;">
           <br>
            <p>Documents needs to be uploaded</p>
            <br>
           <p>1.Salary Certificate</p>
           <div style="width: 30%;float: right;height: 30px;margin-top: -40px;">
           <img src="upload.png" style="width: 100px;position: absolute;" id="i31">
            <input id="file-input" type="file" name="emp-salary-cert" style="display: block;z-index: 2;position: relative;opacity: 0;" onchange="return validate_fileupload(this.value,this.id,'i31');"/>
            </div>
            <br>
            <br>
            <p>2.ID Card Copy</p>
           <div style="width: 30%;float: right;height: 30px;margin-top: -40px;">
           <img src="upload.png" style="width: 100px;position: absolute;" id="i32">
            <input id="file-input" type="file" name="emp-id-card"  style="display: block;z-index: 2;position: relative;opacity: 0;" onchange="return validate_fileupload(this.value,this.id,'i32');"/>
            </div>
            <br>
            <br>
            <p>3.Birth Certificate</p>
           <div style="width: 30%;float: right;height: 30px;margin-top: -40px;">
           <img src="upload.png" style="width: 100px;position: absolute;" id="i33">
            <input id="file-input" type="file" name="emp-birth-cert"  style="display: block;z-index: 2;position: relative;opacity: 0;" onchange="return validate_fileupload(this.value,this.id,'i33');"/>
            </div>
            <br>
            <br>
            <br>
       </div>
       <!--Password-->	
       <div id="d4" style="display: none;">
           <br>
          <p>Documents needs to be uploaded</p>
          <br>
           <p>1.Birth Certificate</p>
           <div style="width: 30%;float: right;height: 30px;margin-top: -40px;">
           <img src="upload.png" style="width: 100px;position: absolute;" id="i41">
            <input id="file-input" type="file" name="pass-birth-cert"  style="display: block;z-index: 2;position: relative;opacity: 0;" onchange="return validate_fileupload(this.value,this.id,'i41');"/>
            </div>
            <br>
            <br>
            <p>2.Aadhaar Card</p>
           <div style="width: 30%;float: right;height: 30px;margin-top: -40px;">
           <img src="upload.png" style="width: 100px;position: absolute;" id="i42">
            <input id="file-input" type="file" name="pass-aadhar"style="display: block;z-index: 2;position: relative;opacity: 0;" onchange="return validate_fileupload(this.value,this.id,'i42');"/>
            </div>
            <br>
            <br>
            <p>3.Living Certificate</p>
           <div style="width: 30%;float: right;height: 30px;margin-top: -40px;">
           <img src="upload.png" style="width: 100px;position: absolute;" id="i43">
            <input id="file-input" type="file" name="pass-lc"  style="display: block;z-index: 2;position: relative;opacity: 0;" onchange="return validate_fileupload(this.value,this.id,'i43');"/>
            </div>
            <br>
            <br>
            <p>4.Residencial Certificate/Agreement Certificate</p>
           <div style="width: 30%;float: right;height: 30px;margin-top: -40px;">
           <img src="upload.png" style="width: 100px;position: absolute;" id="i44">
            <input id="file-input" type="file" name="pass-agreement"  style="display: block;z-index: 2;position: relative;opacity: 0;" onchange="return validate_fileupload(this.value,this.id,'i44');"/>
            </div>
            <br>
            <br>
            <p>5.Clearance Certificate</p>
           <div style="width: 30%;float: right;height: 30px;margin-top: -40px;">
           <img src="upload.png" style="width: 100px;position: absolute;" id="i45">
            <input id="file-input" type="file" name="clearance-cert"  style="display: block;z-index: 2;position: relative;opacity: 0;" onchange="return validate_fileupload(this.value,this.id,'i45');"/>
            </div>
            <br>
            <br>
            <br>
       </div>
        
      <div class="field" style="width: 88%;margin-left: 5%;">
        <input type="submit" class="btn-sign-in" value="submit" style="background-color:blue;">
      </div>
        </form>
      
<p id="demo"></p>
    </div>
  </div>
</div>


<script>
function func(x) {
   /* var x = document.getElementById("dd").value;
    if(x!="")
        document.getElementById("demo").innerHTML = x;
    else
        document.getElementById("demo").innerHTML = "None selected";*/
    
    if(x=="Clearance"){
        document.getElementById("d1").style.display="block";
        document.getElementById("d2").style.display="none";
        document.getElementById("d3").style.display="none";
        document.getElementById("d4").style.display="none";
    }
    else if(x=="PG"){
         document.getElementById("d2").style.display="block";
         document.getElementById("d1").style.display="none";
        document.getElementById("d3").style.display="none";
        document.getElementById("d4").style.display="none";
    }
    else if(x=="Employement"){
         document.getElementById("d3").style.display="block";
        document.getElementById("d1").style.display="none";
        document.getElementById("d2").style.display="none";
        document.getElementById("d4").style.display="none";
    }
    else if(x=="Passport"){
         document.getElementById("d4").style.display="block";
        document.getElementById("d1").style.display="none";
        document.getElementById("d2").style.display="none";
        document.getElementById("d3").style.display="none";
    }
    else if(x==0){
         document.getElementById("d4").style.display="none";
        document.getElementById("d1").style.display="none";
        document.getElementById("d2").style.display="none";
        document.getElementById("d3").style.display="none";
    }
}

</script>
<script type="text/javascript">
function validate_fileupload(fileName,valid,imid)
{
    
    var allowed_extensions = new Array("pdf");
    var file_extension = fileName.split('.').pop().toLowerCase(); 
    var j=0;
    for(var i = 0; i <= allowed_extensions.length; i++)
        if(allowed_extensions[i]==file_extension)
            j=1;
    
    if(j==0)
        {
            alert("You can only upload pdf files ");
            document.getElementById(valid).value="";
            return false;
        }
    document.getElementById(imid).src='check.jpg';  
   
}

</script>
      
</body>
<%
}%>
</html>