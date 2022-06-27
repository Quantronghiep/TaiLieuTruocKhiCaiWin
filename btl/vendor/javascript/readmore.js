function readMore() {
    var button = document.getElementById("button");
    var moreText = document.getElementById("more");
    var writeLess= document.getElementById("writeLess")
    if (button.style.display === "none") {
      button.style.display = "inline";
      writeLess.style.display = "none";
      moreText.style.display = "none";
    } else {
      button.style.display = "none";
      writeLess.style.display = "inline";
      moreText.style.display = "inline";
    }
  }

function readMoreFunction(){
    var buttonReadMore = document.getElementById("readMore");
    var moreContent = document.getElementById("more-content");
    if (moreContent.style.display === "none") {
      buttonReadMore.innerHTML = "Thu gọn"; 
      moreContent.style.display = "block";
    } else {
      buttonReadMore.innerHTML = "Xem Thêm"; 
      moreContent.style.display = "none";
    }
}