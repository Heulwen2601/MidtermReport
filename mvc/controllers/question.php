<?php

use PhpOffice\PhpWord\Element\AbstractContainer;
use PhpOffice\PhpWord\Element\Text;
use PhpOffice\PhpWord\IOFactory as WordIOFactory;

class Question extends Controller
{
    public $cauHoiModel;
    public $cauTraLoiModel;

    function __construct()
    {
        $this->cauHoiModel = $this->model("CauHoiModel");
        $this->cauTraLoiModel = $this->model("CauTraLoiModel");
        parent::__construct();
        require_once "./mvc/core/Pagination.php";
    }

    function default()
    {
        if (AuthCore::checkPermission("cauhoi", "view")) {
            $this->view("main_layout", [
                "Page" => "question",
                "Title" => "Câu hỏi",
                "Plugin" => [
                    "ckeditor" => 1,
                    "select" => 1,
                    "notify" => 1,
                    "sweetalert2" => 1,
                    "pagination" => [],
                    "jquery-validate" => 1,
                ],
                "Script" => "question",
                "user_id" => $_SESSION['user_id'],
            ]);
        } else {
            $this->view("single_layout", ["Page" => "error/page_404","Title" => "Lỗi !"]);
        }
    }
    
        public function getQuestion()
    {
        if (AuthCore::checkPermission("cauhoi", "view")) {
            if($_SERVER['REQUEST_METHOD'] == 'GET'){
                $result = $this->cauHoiModel->getAll();
                echo json_encode($result);    
            }
        }
    }

    public function delete()
    {
        if (AuthCore::checkPermission("cauhoi", "delete")) {
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                $id = $_POST['macauhoi'];
                $this->cauHoiModel->delete($id);
            }
        }
    }

    public function getQuestionById()
    {
        if (AuthCore::checkPermission("cauhoi", "view")) {
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                $id = $_POST['id'];
                $result = $this->cauHoiModel->getById($id);
                echo json_encode($result);
            }
        }
    }

    public function getAnswerById()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $id = $_POST['id'];
            $result = $this->cauTraLoiModel->getAll($id);
            echo json_encode($result);
        }
    }

    public function editQuesion()
    {
        if (AuthCore::checkPermission("cauhoi", "update")) {
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                $id = $_POST['id'];
                $this->cauTraLoiModel->deletebyanswer($id);
                $mamon = $_POST['mamon'];
                $machuong = $_POST['machuong'];
                $dokho = $_POST['dokho'];
                $noidung = $_POST['noidung'];
                $cautraloi = $_POST['cautraloi'];
                $nguoitao = $_SESSION['user_id'];
                $result = $this->cauHoiModel->update($id, $noidung, $dokho, $mamon, $machuong, $nguoitao);
                $macauhoi = $id;
                foreach ($cautraloi as $x) {
                    $this->cauTraLoiModel->create($macauhoi, $x['content'], $x['check'] == 'true' ? 1 : 0);
                }
            }
        }
    }

    public function getTotalPage()
    {
        AuthCore::checkAuthentication();
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $content = $_POST['content'];
            $select = $_POST['selected'];
            echo $this->cauHoiModel->getTotalPage($content);
        }
    }

    public function getQuestionBySubject()
    {
        AuthCore::checkAuthentication();
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $mamonhoc = $_POST['mamonhoc'];
            $machuong = $_POST['machuong'];
            $dokho = $_POST['dokho'];
            $content = $_POST['content'];
            $page = $_POST['page'];
            $result = $this->cauHoiModel->getQuestionBySubject($mamonhoc,$machuong,$dokho,$content,$page);
            echo json_encode($result);
        }
    }
    
    public function getTotalPageQuestionBySubject()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $mamonhoc = $_POST['mamonhoc'];
            $machuong = $_POST['machuong'];
            $dokho = $_POST['dokho'];
            $content = $_POST['content'];
            $result = $this->cauHoiModel->getTotalPageQuestionBySubject($mamonhoc,$machuong,$dokho,$content);
            echo $result;
        }
    }

    public function getQuery($filter, $input, $args) {
        $result = $this->cauHoiModel->getQuery($filter, $input, $args);
        return $result;
    }

    public function getAnswersForMultipleQuestions() {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $arr_question_id = $_POST['questions'];
            $result = $this->cauTraLoiModel->getAnswersForMultipleQuestions($arr_question_id);
            echo json_encode($result);
        }
    }
    
    public function getsoluongcauhoi()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $chuong = isset($_POST['chuong']) ? $_POST['chuong'] : array();
            $monhoc = $_POST['monhoc'];
            $dokho = $_POST['dokho'];
            $result = $this->cauHoiModel->getsoluongcauhoi($chuong,$monhoc,$dokho);
            echo $result;
        }
    }
}
