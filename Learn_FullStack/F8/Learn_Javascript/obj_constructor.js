// Obj constructor 
function User (firstName, lastName, avatar) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.avatar = avatar;

    this.getName = function() {
        return `${this.firstName} ${this.lastName}`;
    }
}
var author = new User('Hiep','Trong','Avatar');
var user = new User('Sơn','Đặng','Avatar');

author.title = 'Thông minh xinh đẹp'
author.getFirstName = function(){
    return this.firstName;
}

user.comment = 'Chia sẻ dạo tại F8'

// Obj prototype
User.prototype.className = 'F8';
User.prototype.getClassName = function(){
    return this.className;
}

console.log(user.className)
console.log(author.className)
console.log(author.getClassName());

console.log(author.title)
console.log(author.getName());
console.log(author.getFirstName());
console.log(user.constructor);

