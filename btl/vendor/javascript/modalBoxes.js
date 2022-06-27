// add-to-cart
var addToCartModal = document.getElementById("add-to-cart");
var btnsAddToCart = document.getElementsByClassName("btn-add-to-cart");
var span = document.getElementsByClassName("close")[0];

for(var i=0 ; i< btnsAddToCart.length ; i++){
    btnsAddToCart[i].onclick= function(){
      console.log(addToCartModal);
      addToCartModal.style.display = "block";
    }
}

span.onclick = function() {
  addToCartModal.style.display = "none";
}

// retweet
var retweetModal = document.getElementById("retweet");
var btnsRetweet = document.getElementsByClassName("btn-retweet");
 
for(var i=0 ; i< btnsRetweet.length ; i++){
  if(retweetModal.style.display = "none"){
    btnsRetweet[i].onclick= function(){
      retweetModal.style.display = "block";
    }
  }
}
var demnguoc =  setTimeout(
  ()=>retweetModal.style.display = "none", 2000);

//continue shopping
var continueShopping=function(){
  if( addToCartModal.style.display = "block"){
    addToCartModal.style.display = "none";
  }
}


// showItem
var showItemModal = document.getElementById("showItem");
var btnsShowItem = document.getElementsByClassName("btn-showItem");
var span = document.getElementsByClassName("close")[1];
var btnPurchase = document.getElementById("btn-purchase")
for(var i=0 ; i< btnsShowItem.length ; i++){
  btnsShowItem[i].onclick= function(){
    showItemModal.style.display = "block";
  }
}
// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  showItemModal.style.display = "none";
}
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == retweetModal) {
    retweetModal.style.display = "none";
  } else  if (event.target == addToCartModal) {
    addToCartModal.style.display = "none";
  } else  if (event.target == showItemModal) {
    showItemModal.style.display = "none";
  }
}

btnPurchase.onclick = ()=> {
  if(showItemModal.style.display == "block"){
    showItemModal.style.display = "none";
    addToCartModal.style.display = "block";
  }
}

// slide img
var img= document.getElementById('anh');
var slideanh1=document.getElementById('slideanh1');
var slideanh2=document.getElementById('slideanh2');
slideanh1.onclick = ()=>{
  if(img.src ==  slideanh2.src)
    img.src= slideanh1.src;
}
slideanh2.onclick = ()=>{
  if(img.src ==  slideanh1.src)
    img.src= slideanh2.src;
}


