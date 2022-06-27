 function dangNhap(){
    var obj_form = document.getElementById('form-id');
    // obj_form.addEventListener('submit',function(){
    // tên 
    let check_name =/^[a-zA-Z ]+$/;
    let name = document.getElementById("name").value;
    var error = '';
        if(name==""){
            error = "Khong duoc bo trong";	
        }
        else{
            if(!check_name.test(name))
                error = "Sai";
            else
                error = "";
        }
    document.getElementById('inName').innerHTML= error;
    // gioi tinh 
    var gender1 = document.getElementById('man').checked; 
    var gender2 = document.getElementById('girl').checked; 
    if(gender1 || gender2){
         error="";
    }
    else 
	    error="Ban phai chon 1 trong 2";
    document.getElementById("inGioiTinh").innerHTML = error;
    // email 
    let check_email =/^[a-zA-Z0-9_ ]+@[a-zA-Z0-9]{2,}(.[a-zA-Z0-9]{2,4}){1,2}$/;
	// let check_email = /^[a-z][a-z0-9_ ]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$/;

	let email = document.getElementById("email").value;
	if(email==""){
		error = "Khong duoc bo trong";	}
	else{
		if(!check_email.test(email))
			error = "Sai";
		else
			error= "";
	}
    document.getElementById("inEmail").innerHTML = error ;
    //Tour
    var haLong = document.getElementById('HL').checked;
    var saPa = document.getElementById('SP').checked;
    var daLat = document.getElementById('DL').checked;
    if(haLong || saPa || daLat){
        error = '';
    }
    else{
        error = 'Chọn 1 địa điểm';
    }
    document.getElementById('inTour').innerHTML = error;
     // xe
     var xe = document.getElementById('xe').value;
     if(xe=="")
         error="Vui long chon mot xe";
     else 
         error="";
    document.getElementById("inXe").innerHTML = error;
    // Caau7 
    if((haLong || saPa ) && xe == 3 ){
        error = 'Không có máy bay cho tour này'
    }
    document.getElementById("inXe").innerHTML = error;

    // đúng tất chuyển trang
    if(error == ''){
        window.location = 'https://google.com';
    }


    event.preventDefault();
    console.log(event);
    // })


    
} 

function resetForm() {
    document.getElementById('inGioiTinh').innerHTML = ''

    document.getElementById('inName').innerHTML = ''

    document.getElementById('inEmail').innerHTML = ''

    document.getElementById('inTour').innerHTML = ''

    document.getElementById("inXe").innerHTML = ''    
}
