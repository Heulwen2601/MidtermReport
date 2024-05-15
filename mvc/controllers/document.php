<?php
class Document extends Controller {
    public $DocumentModel;

    function __construct() {
        $this->DocumentModel = $this->model('DocumentModel');
        parent::__construct();
    }

    public function default() {
        if (AuthCore::checkPermission("document", "view")) {
            $documents = $this->DocumentModel->getAllDocuments();
            $this->view("main_layout", [
                "Page" => "document",
                "Title" => "Tài liệu giảng dạy",
                "Plugin" => [
                    "ckeditor" => 1,
                    "select" => 1,
                    "notify" => 1,
                    "sweetalert2" => 1,
                    "pagination" => [],
                    "jquery-validate" => 1,
                ],
                "Script" => "document",
                "user_id" => $_SESSION['user_id'],
                "documents" => $documents
            ]);
        } else {
            $this->view("single_layout", ["Page" => "error/page_403", "Title" => "Lỗi !"]);
        }
    }

    public function upload() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $subject = $_POST['subject'];
            $type = $_POST['type'];
            $title = $_POST['title'];
            $description = $_POST['description'];
            $file = $_FILES['file'];

            if ($this->DocumentModel->uploadDocument($subject, $type, $title, $description, $file)) {
                header("Location: /Document");
            } else {
                echo "Error uploading file";
            }
        }
    }

    public function download($id) {
        $document = $this->DocumentModel->getDocumentById($id);
        if ($document) {
            header("Content-Type: " . $document['type']);
            echo $document['file_path'];
        } else {
            echo "File not found";
        }
    }
}
?>
