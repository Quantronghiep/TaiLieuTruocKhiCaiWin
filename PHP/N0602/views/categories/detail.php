<table class="table table-bordered">
    <tr>
        <th>ID</th>
        <th>Post short content</th>
        <th>Category name</th>
        <th></th>
    </tr>
            <tr>
                <td>
                    <?php echo $category['id']; ?>
                </td>
                <td>
                    <?php echo $category['description']; ?>
                </td>
                <td>
                    <?php echo $category['name']; ?>
                </td>
                <td>
                    <a href="index.php?controller=category&action=delete&id=<?php echo $category['id'] ?>" title="Xóa"
                       onclick="return confirm('Bạn có chắc chắn muốn xóa bản ghi này')">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
</table>