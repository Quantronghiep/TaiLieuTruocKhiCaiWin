var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active-accordion");
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
