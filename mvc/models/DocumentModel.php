<?php
class DocumentModel extends DB {
    public function getAllDocuments() {
        $sql = "SELECT d.id,d.mamonhoc, mh.tenmonhoc, d.title, d.filename, d.uploaded_at
        FROM documents d
        JOIN monhoc mh ON d.mamonhoc = mh.mamonhoc;";
        $result = mysqli_query($this->con, $sql);
        $documents = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $documents[] = $row;
        }
        return $documents;
    }

    public function getDocumentById($id) {
        $sql = "SELECT filename FROM documents WHERE id = ?";
        $stmt = mysqli_prepare($this->con, $sql);
        mysqli_stmt_bind_param($stmt, 'i', $id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        return mysqli_fetch_assoc($result);
    }

    public function getAllDocumentsBySubject($mamonhoc) {
        $query = "SELECT * FROM documents WHERE mamonhoc = ?";
        $stmt = $this->connect()->prepare($query);
        $stmt->bind_param("i", $mamonhoc);
        $stmt->execute();
        return $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
    }

    public function uploadDocument($mamonhoc, $title, $filename) {
        $query = "INSERT INTO documents (mamonhoc, title, filename) VALUES (?, ?, ?)";
        $stmt = $this->connect()->prepare($query);
        $stmt->bind_param("iss", $mamonhoc, $title, $filename);
        return $stmt->execute();
    }
}
?>
