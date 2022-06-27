function formValidation (){
    var fullName = document.getElementById('fullName').value;
    var phone = document.getElementById('phone').value;
    var email = document.getElementById('email').value;
    var province = document.getElementById('province').value;
    var district = document.getElementById('district').value;
    var wards = document.getElementById('wards').value;
    var address = document.getElementById('address').value;
    var about = document.getElementById('about').value;
    var checkName = /^(a|b|B|A)[a-zA-Z ]{0,31}$/
    var checkPhone = /^\d+$/
    var checkEmail = /^[a|A|b|B]{1}[a-zA-Z0-9]{0,31}(@){1}[a-zA-Z0-9]+\.{1}([a-zA-Z0-9]+){1}(\.{1}[a-zA-Z0-9]+\.{1}[a-zA-Z0-9]+)*$/i
    var checkAddress = /^[a-z0-9A-Z()_\-]+$/
    if(fullName==""){
        document.getElementsByClassName('alert-form')[0].innerHTML ="Bạn chưa nhập mục này"
    }
     else {
        if (checkName.test(fullName))
            document.getElementsByClassName('alert-form')[0].innerHTML =""
        else 
            document.getElementsByClassName('alert-form')[0].innerHTML ="Vui lòng nhập tên người dùng va khong co ki tu dac biet " 
    }
    if(phone==""){
        document.getElementsByClassName('alert-form')[1].innerHTML ="Bạn chưa nhập mục này"
    }
     else {
        if (checkPhone.test(phone))
            document.getElementsByClassName('alert-form')[1].innerHTML =""
        else 
            document.getElementsByClassName('alert-form')[1].innerHTML ="Vui lòng nhập số điện thoại liên hệ" 
    }
    if(email==""){
        document.getElementsByClassName('alert-form')[2].innerHTML ="Bạn chưa nhập mục này"
    }
     else {
        if (checkEmail.test(email))
            document.getElementsByClassName('alert-form')[2].innerHTML =""
        else 
            document.getElementsByClassName('alert-form')[2].innerHTML ="Vui lòng nhập email người dùng " 
    }
    if(province === '-- Tỉnh thành --'){
        document.getElementsByClassName('alert-form')[3].innerHTML ="Bạn chưa nhập mục này"
    }
     else {
        document.getElementsByClassName('alert-form')[3].innerHTML ="" 
    }
    if(district === '-- Quận huyện --'){
        document.getElementsByClassName('alert-form')[4].innerHTML ="Bạn chưa nhập mục này"
    }
     else {
        document.getElementsByClassName('alert-form')[4].innerHTML ="" 
    }
    if(wards === '-- Phường xã --'){
        document.getElementsByClassName('alert-form')[5].innerHTML ="Bạn chưa nhập mục này"
    }
     else {
        document.getElementsByClassName('alert-form')[5].innerHTML ="" 
    }
    if(address==""){
        document.getElementsByClassName('alert-form')[6].innerHTML ="Bạn chưa nhập mục này"
    }
     else {
        if (checkAddress.test(address))
            document.getElementsByClassName('alert-form')[6].innerHTML =""
        else 
            document.getElementsByClassName('alert-form')[6].innerHTML ="Vui lòng nhập địa chỉ người dùng " 
    }
    if(about==""){
        document.getElementsByClassName('alert-form')[7].innerHTML ="Mục này bạn có thể bỏ qua"
    }
     else {
            document.getElementsByClassName('alert-form')[7].innerHTML =""
    }
}
function formLogin(){
    var account = document.getElementById('account').value;
    var password = document.getElementById('password').value;
    if(account ==""){
        document.getElementsByClassName('alert-form-login')[0].innerHTML = "Vui lòng nhập tài khoản"
    } else if(account!= "trungduccode"){
        document.getElementsByClassName('alert-form-login')[0].innerHTML = "Tài khoản không tồn tại"

    }
    if(password == "")
        document.getElementsByClassName('alert-form-login')[1].innerHTML = "Vui lòng nhập mật khẩu"
    else if(password !="123456")
         document.getElementsByClassName('alert-form-login')[1].innerHTML = "Sai mật khẩu"
    if(account == "trungduccode" && password == "123456"){
        newDoc();
    }
}
function newDoc() {
    window.location.assign("vanphongpham.html")
  }