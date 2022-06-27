
function checkForm(){
	var name = document.getElementById("name").value;
	var phone = document.getElementById("phone").value;
	var email= document.getElementById("email").value;

	// var check_name = /^[a-zA-Z ]+$/;
	// var check_email = /^[a-zA-Z0-9_ ]+@[a-zA-Z0-9]+(\.[a-zA-Z]{2,4}){1,4}$/;
	// if(name=="")
	// 	alert("Khong duoc bo trong ten");
	// else{
	// 	if(!check_name.test(name))
	// 		alert("Ten sai");
	// }
	// if(email=="")
	// 	alert("Khong duoc bo trong email");
	// else{
	// 	if(!check_email.test(email))
	// 		alert("email sai");
	// }
	var check_phone = /^([+84]){0,}[ ]{0,}[(]{0,}[0-9]{3}[)]{0,}[\.\- ]{1}[0-9]{3}[\.\- ]{1}[0-9]{3}$/
	if(phone=="")
		alert("Khong duoc bo trong phone");
	else{
		if(!check_phone.test(phone))
			alert("phone sai");
	}
}