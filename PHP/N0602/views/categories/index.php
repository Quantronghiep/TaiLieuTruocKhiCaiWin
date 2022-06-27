<a href="index.php?controller=category&action=create" class="btn btn-primary">
    <i class="fa fa-plus"></i> Thêm mới
</a>
<table class="table table-bordered">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th></th>
    </tr>
    <?php if (!empty($categories)): ?>
        <?php foreach ($categories as $category): ?>
            <tr>
                <td>
                    <?php echo $category['id']; ?>
                </td>
                <td>
                    <?php echo $category['name']; ?>
                </td>
                <td>
                    <?php echo $category['description']; ?>
                </td>
                <td>
                    <a href="index.php?controller=category&action=detail&id=<?php echo $category['id'] ?>"
                       title="Xem">
                        <i class="fa fa-eye"></i>
                    </a>
                    <a href="index.php?controller=category&action=delete&id=<?php echo $category['id'] ?>" title="Xóa"
                       onclick="return confirm('Bạn có chắc chắn muốn xóa bản ghi này')">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
        <?php endforeach ?>

    <?php else: ?>
    <?php endif; ?>
</table>