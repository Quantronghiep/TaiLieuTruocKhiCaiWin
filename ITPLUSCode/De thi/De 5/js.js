var number = prompt("Nhap 1 so ");
var check = /^[0-9]+$/;
if(number <0 || number > 100 || !check.test(number)){
    alert("Dừng nhập");
}
var x = '';
if(!(number <0 || number > 100 || !check.test(number))){
    for(var i =0 ; i <= number ; i++)
    if(i%2==1){
        x += i ;
        x+= ' , ';
    }
        
    alert('Các số lẻ là : ' + x);
}

event.preventDefault();