<?php

class Controller {
    // Khai báo thuộc tính dùng chung cho controller con kế thừa từ nó
    // + Tiêu đề động của từng trang
    public $page_title;
    // + Thông tin lỗi động của từng trang
    public $error;
    // + Nội dung động của từng trang
    public $content;

    public function render($file_path, $variables = []) {
        // + Giải nén mảng biến truyền vào
        extract($variables);
        // + Bắt đầu sử dụng bộ nhớ đệm để đọc nội dung file từ đường dẫn file truyền vào
        ob_start();
        // + Nhúng file để lưu nội dung file vào bộ nhớ đệm
        require "$file_path";
        // + Kết thúc sử dụng bộ nhớ đệm để trả về nội dung file
        $content = ob_get_clean();

        // + Trả về nội dung file vừa đọc đc
        return $content;
    }
}