const carts= {}
const addressBtn= document.getElementById('address-form');
const loginBtn = document.getElementById('login-form');
addressBtn.onclick = ()=>{
	document.getElementById('info-content').innerHTML= carts.address;
}
loginBtn.onclick = ()=>{
	document.getElementById('info-content').innerHTML = carts.login;
}
var btns = document.getElementsByClassName("active-info");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function() {
    var current = document.getElementsByClassName("active-delivery");
    current[0].className = current[0].className.replace(" active-delivery", "");
    this.className += " active-delivery";
  });
}
// render(cart.address);
// function render(page){
// 	document.getElementById('tabs-content').innerHTML =  page;
// }

//accordion
var acc = document.getElementsByClassName("accordion");
for ( var i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active-promotion");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}
var slider = document.getElementById("myRange");
var output = document.getElementById("to-price-pull-right");
output.innerHTML = slider.value;

slider.oninput = function() {
	output.innerHTML = this.value;
}
var totalPrice = document.getElementsByClassName("total-price");	
totalPrice.innerHTML = parseFloat(slider.value)*59.280;
//carts

//icon
var iconLine = document.getElementsByClassName('icon-line');
var cc =document.getElementById('product-line')
iconLine.onclick = function(){
	if(cc.style.display == 'block')
		cc.style.display = 'none';
}
carts.address =`
<div class="row " id="address-cart">
<div class="col-md-6  col-xs-12">
	<div class="form-group">
		 <input id="fullName" class="form-control" name="full_name" placeholder="Họ và tên" type="text">
		 <div class="alert-form-content">
			 <span class="alert-form"></span>
		 </div>
	</div>
</div>
<div class="col-md-6  col-xs-12">
	<div class="form-group">
		 <input id="phone" class="form-control" name="number" placeholder="Số điện thoại" type="text">
		 <div class="alert-form-content">
			<span class="alert-form"></span>
		</div>
	</div>
</div>
<div class="col-md-6  col-xs-12">
	<div class="form-group">
		 <input id="email" class="form-control" name="email" placeholder="Email" value="" type="email">
		 <div class="alert-form-content">
			<span class="alert-form"></span>
		</div>
	</div>
</div>
<div class="col-md-6  col-xs-12">
	<div class="form-group">
		 <select id="province">
			 <option> -- Tỉnh thành --</option>
			 <option value="Hà Nội">Hà Nội</option>
			 <option value="Hà Nam">Hà Nam</option>
			 <option value="Bắc Ninh">Bắc Ninh</option>
		 </select>
		 <div class="alert-form-content">
			<span class="alert-form"></span>
		</div>
	</div>
</div>
<div class="col-md-6  col-xs-12">
	<div class="form-group">
		 <select id="district"  >
			 <option> -- Quận huyện --</option>	 
			 <option value="Bắc Ninh">TP Bắc Ninh</option>	
			 <option value="Từ Sơn">Từ Sơn</option>
			 <option value="Tiên Du">Tiên Du</option>	
		 </select>
		 <div class="alert-form-content">
			<span class="alert-form"></span>
		</div>
	</div>
</div>
<div class="col-md-6  col-xs-12">
	<div class="form-group">
		 <select id="wards">
			 <option> -- Phường xã --</option> 	
			 <option value="Vệ An">Vệ An</option>
			 <option value="Võ Cường">Võ Cường</option>
			 <option value="Tiền An">Tiền An</option>
		 </select>
		 <div class="alert-form-content">
			<span class="alert-form"></span>
		</div>
	</div>
</div>
<div class="col-md-12  col-xs-12">
	<div class="form-group">
		 <input id="address" class="form-control" name="diachi" placeholder="Địa chỉ" value="">
		 <div class="alert-form-content">
			<span class="alert-form"></span>
		</div>
	</div>
</div>
<div class="col-md-12  col-xs-12">
	<div class="form-group">
		 <input id="about" class="form-control" name="ghichu" placeholder="Ghi chú" >
		 <div class="alert-form-content">
			<span class="alert-form"></span>
		</div>
	</div>
</div>
<div class="col-md-12  col-xs-12 btn-cart ">
	<button class="btn-process-payment" onclick="formValidation()"> 			Tiếp tục Thanh toán 
	<i class="fa fa-arrow-right" aria-hidden="true"></i>
	</button>
</div>
</div>
`
carts.login = `
	<div class="row login-cart">
		<div class="col-md-12  col-xs-12 ">
			<div class="form-group">
				<input id="account" class="form-control" name="full_name" placeholder="Email hoặc số điện thoại" type="text">
				<div>
					<span class="alert-form-login">

					</span>
				</div>
			</div>
			<div class="form-group">
				<input id="password" class="form-control" name="full_name" placeholder="Mật khẩu" type="password">
				<div>
					<span class="alert-form-login">
						
					</span>
				</div>
			</div>
			<div class="form-group">
					<button class="btn-login" onclick="formLogin()" >
						Đăng nhập
					</button>
			</div>
			<div class="form-group">
				<a  class="forget-password">
					Quên mật khẩu ?
				</a>
			</div>
			<div class="form-group">
				<button class="btn btn-primary">	
					<div class="icon-facebook">
						<i class="fa fa-facebook" aria-hidden="true"></i>
					</div>
					<div class="text-login">
						Đăng nhập bằng facebook
					</div>
					
				</button>
			</div>
			<div class="form-group">		
				<button class="btn btn-danger">
					<div class="icon-google">
						<i class="fa fa-google" aria-hidden="true"></i>
					</div>
					<div class="text-login">
						Đăng nhập bằng gmail
					</div>
				</button>
			</div>
		</div>
	</div>
`
