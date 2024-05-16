<<<<<<< HEAD
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
=======
<div class="content">
    <h2>Tài liệu giảng dạy</h2>
    <button type="button" class="btn btn-hero btn-primary" data-bs-toggle="modal"
            data-bs-target="#modal-add-question" id="addquestionnew" data-role="cauhoi" data-action="create"><i class="fa-regular fa-plus"></i> Thêm tài liệu</button>
    <form action="/Document/upload" method="post" enctype="multipart/form-data">
        <label for="subject">Môn học:</label>
        <input type="text" name="subject" id="subject" required><br>
        <label for="type">Loại:</label>
        <input type="text" name="type" id="type" required><br>
        <label for="title">Tiêu đề:</label>
        <input type="text" name="title" id="title" required><br>
        <label for="description">Mô tả:</label>
        <textarea name="description" id="description"></textarea><br>
        <label for="file">Chọn file để upload:</label>
        <input type="file" name="file" id="file" required><br>
        <button type="submit">Upload</button>
>>>>>>> 77d14c4a44040fe40141aa2d30e72f226baf5708
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

<<<<<<< HEAD
    <div class="row my-3">
        <?php if(isset($data["Plugin"]["pagination"])) require "./mvc/views/inc/pagination.php"?>
    </div>
</div>
=======
    <h3>Danh sách tài liệu</h3>
    <ul>
        <?php if (!empty($data['documents'])): ?>
            <?php foreach ($data['documents'] as $document): ?>
                <li>
                    <p>ID: <?php echo htmlspecialchars($document['id']); ?></p>
                    <p>Môn học: <?php echo htmlspecialchars($document['subject']); ?></p>
                    <p>Mô tả: <?php echo htmlspecialchars($document['description']); ?></p>
                    <?php
                    // Lấy tên file từ đường dẫn
                    $fileName = basename($document['file_path']);
                    ?>
                    <a href="/Document/download/<?php echo htmlspecialchars($document['id']); ?>" target="_blank">
                        <?php echo htmlspecialchars($fileName); ?>
                    </a>
                    <small>Uploaded at: <?php echo htmlspecialchars($document['uploaded_at']); ?></small>
                </li>
            <?php endforeach; ?>
        <?php else: ?>
            <p>No documents found.</p>
        <?php endif; ?>
    </ul>
</div>
>>>>>>> 77d14c4a44040fe40141aa2d30e72f226baf5708
