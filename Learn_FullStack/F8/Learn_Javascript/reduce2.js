//Xây dựng reduce
Array.prototype.reduce2=function(callBack,result){
    var i=0;
    // if(arguments.length <2){
    //     initialValue=this[0];
    //     i=1;
    // }
    if(result===undefined){
        result=this[0];
        i=1;
    }

    for( ; i < this.length ; i++){
        result=callBack(result,this[i],i, this); 
    }
    return result ;
}
const numbers = [1,2,3,4,5];
const result = numbers.reduce2((total,number) => {
    return total + number;
},0)
 
//Cách 2 dễ hiểu
// Array.prototype.reduce2=function(callBack,initialValue){
//     var i=0;
//     if(initialValue===undefined){
//         initialValue=this[0];
//         i=1;
//     }
//     var total =initialValue;
//     for( ; i < this.length ; i++){
//         total=callBack(total,this[i],i, this);
//     }
    
//     return total;

// }
// const result2=numbers.reduce2((total,number, index, arr) => {
//     console.log(index,arr);
//     return total + number;
// });
// console.log(result2);

