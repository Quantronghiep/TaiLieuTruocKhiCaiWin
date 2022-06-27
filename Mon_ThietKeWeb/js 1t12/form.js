function validateData(){
	var ck_id = /^[A-Za-z0-9]{5,12}$/;
	var id = document.getElementById("user").value;
	if(!ck_id.test(id)){
		alert("user id is not valid");
	}

	// // var ck_pass = /[A-Za-z0-9]{7,12}$/;
	// // var pass = document.getElementById("pass").value;
	// // if(!ck_pass.test(pass)){
	// // 	alert("pass is not valid");
	// // }

	// var ck_name= /[a-zA-Z ]+/;
	// var name = document.getElementById("name").value;
	// if (name =="") {
	// 	alert("Chon 1 nuoc di");
	// }	
	// if(!ck_name.test(name)){
	// 	alert("name is not valid");
	// }

	
	// // var country = document.getElementById("country").value;
	// // if (country =="") {
	// // 	alert("Chon 1 nuoc di");
	// // }

	// // var check_zip = /\d+/;
	// // var zip= document.getElementById("zip").value;
	// // if(!check_zip.test(zip)){
	// // 	alert("Zip code nhap so thoi");
	// // }

	// var check_male = document.getElementById("male").value;
	// var check_female = document.getElementById("female").value;
	// if(!check_female||!check_male)
	// 	alert("Chon gioi tinh");
}