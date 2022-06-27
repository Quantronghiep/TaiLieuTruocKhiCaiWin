function dangnhap(){
	var check_email = /^[a-zA-Z0-9_ ]+@[a-zA-Z0-9]{2,}(.[a-zA-Z]{2,4}){1,}$/;
	var email = document.getElementById("email").value ;
	if(email==""){
		document.getElementById("inEmail").innerHTML="Khong duoc bo trong ";
	}
	else{
		if(check_email.test(email))
			document.getElementById("inEmail").innerHTML="";
		else
			document.getElementById("inEmail").innerHTML="Sai";
	}

	var check_rate = /^[0-9]+$/;
	var rate = document.getElementById("rate").value;
	if(rate==""){
		document.getElementById("inRate").innerHTML="Khong duoc bo trong ";
	}
	else{
		if(check_rate.test(rate))
			document.getElementById("inRate").innerHTML="";
		else
		document.getElementById("inRate").innerHTML="Sai";
	}
	
	
}