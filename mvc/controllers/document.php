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
                "Title" => "Danh sách tài liệu",
                "documents" => $documents
            ]);
        } else {
            $this->view("single_layout", ["Page" => "error/page_403", "Title" => "Lỗi !"]);
        }
    }

    public function download($id) {
        $document = $this->DocumentModel->getDocumentById($id);
        if ($document) {
            $filePath = $document['file_path'];
            if (file_exists($filePath)) {
                header('Content-Description: File Transfer');
                header('Content-Type: application/octet-stream');
                header('Content-Disposition: attachment; filename="'.basename($filePath).'"');
                header('Expires: 0');
                header('Cache-Control: must-revalidate');
                header('Pragma: public');
                header('Content-Length: ' . filesize($filePath));
                readfile($filePath);
                exit;
            } else {
                die('File not found');
            }
        } else {
            die('Document not found');
        }
    }

    public function add()
    {
        if(AuthCore::checkPermission("document","create")) {
            $this->view("main_layout",[
                "Page" => "add_document",
                "Title" => "Thêm tài liệu mới",
                "Script" => "document",
                "Plugin" => [
                    "sweetalert2" => 1,
                    "datepicker" => 1,
                    "flatpickr" => 1,
                    "notify" => 1,
                    "jquery-validate" => 1,
                    "select" => 1,
                ],
                "Action" => "create"
            ]);
        } else $this->view("single_layout", ["Page" => "error/page_403","Title" => "Lỗi !"]);
    }

    public function upload() {
        $subject_id = $_POST['subject_id'];
        $title = $_POST['title'];
        $filename = $_FILES['file']['name'];
        $target_dir = "./uploads/";
        $target_file = $target_dir . basename($filename);

        if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
            $result = $this->DocumentModel->uploadDocument($subject_id, $title, $filename);
            echo $result;
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    }

    public function getDocumentsBySubject() {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $subject_id = $_POST['subject_id'];
            $data = $this->DocumentModel->getAllDocumentsBySubject($subject_id);
            echo json_encode($data);
        }
    }
}
?>
