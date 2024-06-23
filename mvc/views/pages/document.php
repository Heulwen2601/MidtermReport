<div class="content" data-id="<?php echo $_SESSION["user_id"] ?>">
    <form action="#" method="POST" id="search-form" onsubmit="return false;">
        <div class="row mb-4">
            <div class="col-6 flex-grow-1">
                <div class="input-group">
                    <input type="text" class="form-control" id="search-input" name="search-input" placeholder="Tìm kiếm tài liệu theo tên môn học...">
                </div>
            </div>
            <div class="col-6 d-flex align-items-center justify-content-end gap-3">
                <a class="btn btn-hero btn-primary" href="./document/add"><i class="fa fa-fw fa-plus me-1"></i> Thêm tài liệu</a>
            </div>
        </div>
    </form>
    <div class="container">
        <h2>Danh sách tài liệu</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Tiêu đề</th>
                    <th>Mã môn học</th>
                    <th>Tên môn học</th>
                    <th>Tên tài liệu</th>
                    <th>Tải xuống</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($data['documents'] as $document): ?>
                    <tr>
                        <td><?php echo $document['title']; ?></td>
                        <td><?php echo $document['mamonhoc']; ?></td>
                        <td><?php echo $document['tenmonhoc']; ?></td>
                        <td><?php echo $document['filename']; ?></td>
                        <td><a href="<?php echo '/Document/download/' . $document['id']; ?>" class="btn btn-primary">Tải xuống</a></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

    <div class="row my-3">
        <?php if(isset($data["Plugin"]["pagination"])) require "./mvc/views/inc/pagination.php"?>
    </div>
</div>