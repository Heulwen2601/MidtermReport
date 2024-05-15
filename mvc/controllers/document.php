<?php

class Document extends Controller
{
    public $DocumentModel;
    function __construct()
    {
        $this->DocumentModel = $this->model('DocumentModel');
        parent::__construct();
        require_once "./mvc/core/Pagination.php";
    }

    public function default()
    {
        if(AuthCore::checkPermission("document","view")) {
            $this->view("main_layout",[
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
            ]); 
        } else $this->view("single_layout", ["Page" => "error/page_403","Title" => "Lỗi !"]);
    }
}
