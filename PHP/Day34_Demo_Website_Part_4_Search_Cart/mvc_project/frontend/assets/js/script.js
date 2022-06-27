// (document).ready() đảm bảo code JS chạy sau cùng k quan trọng vị trí
//chờ HTML CSS chạy xong mới chạy code JS
$(document).ready(function () {
   $('.add-to-cart').click(function () {
      //Lấy ra id của sp vừa click để cbi bước gọi ajax
       var product_id = $(this).attr('data-id');
       //Gọi ajax truyền id sản phẩm lên cùng ajax
       var obj_ajax = {
           //url ajax , chính là url mvc
           url:'index.php?controller=cart&action=add',
           //Phương thức truyền dữ liệu
           method: 'GET',
           //Các tham số truyền lên cùng ajax
           data:{
               //Tên tham số: giá trị
               product_id: product_id
           },
           //Nơi nhận kết quả trả về từ PHP thông qua tham số data truyền vào
           success: function (data) {
               console.log(data);
               // Xử lí kqua trả về và hiển thị cho user biết họ đã thêm sp thành công
               // - Set text và thêm class cho selector .ajax-message
               $('.ajax-message')
                   .html('Thêm sp vào giỏ thành công')
                   .addClass('ajax-message-active');
               //Ẩn message sau 1 time nào đó
               setTimeout(function (){
                    $('.ajax-message').removeClass('ajax-message-active');
               },3000);
               //Cập nhật tăng số lượng của icon giỏ hàng lên 1
               var cart_total = $('.cart-amount').html();
               cart_total++ ;
               //Set lại gtri mới cho selector
               $('.cart-amount').html(cart_total);
               //Set luôn trên mobile
               $('.cart-amount-mobile').html(cart_total);
           }
       };
       //Gọi ajax dùng cú pháp jQuery
       $.ajax(obj_ajax);
       //Chạy ứng dụng , cách debug ajax -> xem ajax hoạt động nt?
       //F12 -> Click thêm giỏ hàng -> tab Network -> XHR -> thấy URL mà ajax gọi
       // Click để xem thông tin
   });
});