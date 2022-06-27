function dangnhap(){
	// N = document.getElementById("inName").innerHTML ;
	// P = document.getElementById("inPhone").innerHTML ;
	// E = document.getElementById("inEmail").innerHTML ;
	
	let check_name =/^[a-zA-Z ]+$/;
	let name = document.getElementById("name").value;
	if(name==""){
		document.getElementById("inName").innerHTML = "Khong duoc bo trong";	}
	else{
		if(!check_name.test(name))
			document.getElementById("inName").innerHTML = "Sai";
		else
			document.getElementById("inName").innerHTML = "";
	}

	let check_email =/^[a-zA-Z0-9_ ]+@[a-zA-Z0-9]{2,}(.[a-zA-Z0-9]{2,4}){1,2}$/;
	// let check_email = /^[a-z][a-z0-9_ ]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$/;

	let email = document.getElementById("email").value;
	if(email==""){
		document.getElementById("inEmail").innerHTML = "Khong duoc bo trong";	}
	else{
		if(!check_email.test(email))
			document.getElementById("inEmail").innerHTML = "Sai";
		else
			document.getElementById("inEmail").innerHTML = "";
	}
	let check_phone1 = /[0-9]{3}(\s|\,|\-)[0-9]{3}(\s|\,|\-)[0-9]{3}/;
	let check_phone2 = /\([0-9]{3}\)\s[0-9]{3}\-[0-9]{3}/;
	let phone = document.getElementById("phone").value;
	if(phone==""){
		document.getElementById("inPhone").innerHTML = "Khong duoc bo trong";	}
	else{
		if(check_phone1.test(phone) || check_phone2.test(phone))
			document.getElementById("inPhone").innerHTML = "";
		else
			document.getElementById("inPhone").innerHTML = "Sai";
	}

}