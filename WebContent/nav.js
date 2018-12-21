function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
    document.body.style.backgroundColor = "white";
}
function validation()
{
var a = document.form.name.value;
if(a=="")
{
/*alert("Please Enter Your Name");*/
document.getElementById("Nmes").style.display = "block";
document.form.name.focus();
return false;
}
else{
document.getElementById("Nmes").style.display = "none";
}
var matches = a.match(/\d+/g);
if (matches != null) {
document.getElementById("Nmes").style.display = "block";
document.form.name.focus();
return false;
}
else{
document.getElementById("Nmes").style.display = "none";
}
var a = document.form.lastname.value;
if(a=="")
{
document.getElementById("Lmes").style.display = "block";
document.form.lastname.focus();
return false;
}
else{
document.getElementById("Lmes").style.display = "none";
}
var matches = a.match(/\d+/g);
if (matches != null) {
document.getElementById("Lmes").style.display = "block";
document.form.lastname.focus();
return false;
}
else{
document.getElementById("Lmes").style.display = "none";
}
   var x = document.form.email.value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
      document.getElementById("Emes").style.display = "block";
document.form.email.focus();
return false;;
    }
else{
document.getElementById("Emes").style.display = "none";
}
if(form.pwd1.value.length < 6) {
        alert("Error: Password must contain at least six characters!");
        form.pwd1.focus();
        return false;
      }
    var re = /[0-9]/;
      if(!re.test(form.pwd1.value)) {
        alert("Error: password must contain at least one number (0-9)!");
        form.pwd1.focus();
        return false;
      }
      re = /[a-z]/;
      if(!re.test(form.pwd1.value)) {
        alert("Error: password must contain at least one lowercase letter (a-z)!");
        form.pwd1.focus();
        return false;
      }
      re = /[A-Z]/;
      if(!re.test(form.pwd1.value)) {
        alert("Error: password must contain at least one uppercase letter (A-Z)!");
        form.pwd1.focus();
        return false;
      }

}