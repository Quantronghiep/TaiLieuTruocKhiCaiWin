https://jsfiddle.net/TrongHiep/q920Ldoh/261/

var courses = [
    'JS',
    'PHP',
    'RUBY'
]
 Array.prototype.map2 = function(callback){
    var output = [];
    var lengthArr = this.length;
    for(var i =0 ; i< lengthArr ; i++){
       var result = callback(this[i] , i);
       output.push(result);
    }
    return output;
 }

 var htmls = courses.map2(function(course){
     return `<h2>${course}</h2>`
 })

 console.log(htmls);