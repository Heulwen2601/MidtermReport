<?php
class DocumentModel extends DB {

    public function getAllDocuments() {
        $sql = "SELECT id, subject, type, title, description, file_path, uploaded_at FROM documents";
        $result = mysqli_query($this->con, $sql);
        $documents = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $documents[] = $row;
        }
        return $documents;
    }

    public function uploadDocument($subject, $type, $title, $description, $file) {
        $filePath = mysqli_real_escape_string($this->con, file_get_contents($file['tmp_name']));
        $sql = "INSERT INTO documents (subject, type, title, description, file_path) VALUES (?, ?, ?, ?, ?)";
        $stmt = mysqli_prepare($this->con, $sql);
        mysqli_stmt_bind_param($stmt, 'sssss', $subject, $type, $title, $description, $filePath);
        return mysqli_stmt_execute($stmt);
    }

    public function getDocumentById($id) {
        $sql = "SELECT file_path, type FROM documents WHERE id = ?";
        $stmt = mysqli_prepare($this->con, $sql);
        mysqli_stmt_bind_param($stmt, 'i', $id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        return mysqli_fetch_assoc($result);
    }
}
?>
