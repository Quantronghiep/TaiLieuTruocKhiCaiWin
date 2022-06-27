function dangnhap(){

	var check_name = /[A-Za-z]+[ ]+![0-9]/;
	// var check_name = /^[A-Za-z ]+$/;
	var name = document.getElementById("name").value;
	if(name==""){
		document.getElementById("NAME").innerHTML = "Khong duoc bo trong";
	}
	else{
		if(check_name.test(name))
			document.getElementById("NAME").innerHTML="";
		else
			document.getElementById("NAME").innerHTML="Loi ten";
	}
	// var check_email = /^[A-Za-z0-9]+@[A-Za-z0-9]+.[A-Za-z0-9]+$/;
		var check_email=/^\w+@\w+.\w+/;
	var email= document.getElementById("email").value;
	if(email==""){
		document.getElementById("EMAIL").innerHTML = "Khong duoc bo trong";
	}
	else{
		if(check_name.test(email)) {
			document.getElementById("EMAIL").innerHTML="";
			document.getElementById("email").value = "";
		}	else
			document.getElementById("EMAIL").innerHTML="Loi email";
	}

}
