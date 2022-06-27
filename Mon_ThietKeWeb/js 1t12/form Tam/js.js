function checkabout(){

var user=document.getElementById('user').value;
var pass=document.getElementById('pass').value;
var address=document.getElementById('adress');
var country=document.getElementById('country').value;
var name=document.getElementById('name').value;
var zip=document.getElementById('zip').value;
var email=document.getElementById('email').value;
var male=document.getElementById('MALE').checked;
var female=document.getElementById('FEMALE').checked;
var Languge1=document.getElementById('check1').checked;
var Languge2=document.getElementById('check2').checked;


var U=/\w{5,12}$/;
// alert(U.test(user));
var P=/\w{7,12}/;
// alert(P.test(pass));
var N=/\w||\s/;
var Z=/\d+/;
var E=/\w+@[a-zA-z]+(.[a-z]{2,})+$/;
if(user==="")
	document.getElementById("USER").innerHTML="User Id khong duoc bo trong";
else 
{
	if(U.test(user))  document.getElementById("USER").innerHTML="";
	else  document.getElementById("USER").innerHTML="Chiều dài từ 5-12 kí tự và không có kí tự đặc biệt";
}
if(pass=="")
	document.getElementById("PASS").innerHTML="Pass khong duoc bo trong";
else 
{
	if(P.test(pass))  document.getElementById('PASS').innerHTML="";
	else document.getElementById('PASS').innerHTML="Chiều dài từ 7-12 kí tự và không có kí tự đặc biệt";
}
if(country=="")
	document.getElementById("COUNTRY").innerHTML="Vui long chon mot trong so nuoc";
else 
	 document.getElementById('COUNTRY').innerHTML="";
if(name=="")
	document.getElementById("NAME").innerHTML="ten khong duoc bo trong";
else 
{
	if(N.test(name))  document.getElementById('NAME').innerHTML="";
	else document.getElementById('NAME').innerHTML="Không có kí tự đặc biệt và phải toàn chữ";
}	

if(zip=="")
	document.getElementById("ZIP").innerHTML="Zip code khong duoc trong";
else 
{

	if(Z.test(zip)) document.getElementById('ZIP').innerHTML="";
	else document.getElementById('ZIP').innerHTML="Ban phai nhap toan so";
	
}
if(male||female)
	document.getElementById("GENDER").innerHTML="";
else 
	 document.getElementById('GENDER').innerHTML="Ban phai chon 1 trong 2";
if(Languge1||Languge2)
	document.getElementById("LANGUGE").innerHTML="";
else 
 document.getElementById('LANGUGE').innerHTML="Ban phai chon it nhat 1";
if(email=="")
	document.getElementById("EMAIL").innerHTML="Email khong duoc bo trong";
else 
{
	if(E.test(email))  document.getElementById('EMAIL').innerHTML="";
	else document.getElementById('EMAIL').innerHTML="Email không hợp lệ. Vui lòng nhập lại!";
}
}