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
    </form>

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