function dangNhap(){
	var check_name = /[A-Za-z ]+/;
	var name = document.getElementById("name").value;
	if(name == ""){
		document.getElementById("NAME").innerHTML = "Khong duoc bo trong";
	}
	else{
		if(check_name.test(name)) {
		document.getElementById("NAME").innerHTML = "";
	}
		else
		document.getElementById("NAME").innerHTML = "sai";	
	}
	// var check_email = /[A-Za-z0-9]+@[A-Za-z0-9]+.[A-Za-z0-9]+/;
	// var check_email=/^\w+@\w+.\w+/;
	var check_email = /^[a-z][a-z0-9_ ]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){2}$/;
	var email = document.getElementById("email").value;
	if(email == ""){
		document.getElementById("EMAIL").innerHTML = "Khong duoc bo trong";
	}
	else{
		if(check_email.test(email)) {
		document.getElementById("EMAIL").innerHTML = "";
	}
		else
		document.getElementById("EMAIL").innerHTML = "sai";	
	}

	// var check_sdt = /[0-9]+/;
	// var check_sdt1 = /[0-9]{3}[-]{1}[0-9]{3}[-]{1}[0-9]{3}/;
	var check_sdt2 = /\d{3}(\s|,|-)\d{3}(\s|,|-)\d{3}/ 
	var check_sdt3 = /\(\d{3}\)\s\d{3}\-\d{3}/ 
	var sdt = document.getElementById("phone").value;
	if(sdt == ""){
		document.getElementById("SDT").innerHTML = "Khong duoc bo trong";
	}
	else{
		if(check_sdt2.test(sdt) ||check_sdt3.test(sdt)) {
		document.getElementById("SDT").innerHTML = "";
	}
		else
		document.getElementById("SDT").innerHTML = "sai";	
	}
}