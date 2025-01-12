<?php

use Dompdf\Dompdf;
use Sabberworm\CSS\Value\Size;

class Test extends Controller
{

    public $dethimodel;
    public $chitietde;
    public $ketquamodel;

    public function __construct()
    {
        $this->dethimodel = $this->model("DeThiModel");
        $this->chitietde = $this->model("ChiTietDeThiModel");
        $this->ketquamodel = $this->model("KetQuaModel");
        parent::__construct();
        require_once "./mvc/core/Pagination.php";
    }

    public function default()
    {
        if (AuthCore::checkPermission("dethi", "view")) {
            $this->view("main_layout", [
                "Page" => "test",
                "Title" => "Đề kiểm tra",
                "Plugin" => [
                    "notify" => 1,
                    "sweetalert2" => 1,
                    "pagination" => [],
                ],
                "Script" => "test",
                "user_id" => $_SESSION['user_id'],
            ]);
        } else {
            $this->view("single_layout", ["Page" => "error/page_403", "Title" => "Lỗi !"]);
        }
    }

    public function add()
    {
        if (AuthCore::checkPermission("dethi", "create")) {
            $this->view("main_layout", [
                "Page" => "add_update_test",
                "Title" => "Tạo đề kiểm tra",
                "Plugin" => [
                    "datepicker" => 1,
                    "flatpickr" => 1,
                    "select" => 1,
                    "notify" => 1,
                    "jquery-validate" => 1
                ],
                "Script" => "action_test",
                "Action" => "create"
            ]);
        } else {
            $this->view("single_layout", ["Page" => "error/page_403", "Title" => "Lỗi !"]);
        }
    }

    public function update($made)
    {
        if(filter_var($made, FILTER_VALIDATE_INT) !== false) {
            $dethi = $this->dethimodel->getById($made);
            if(isset($dethi)) {
                if (AuthCore::checkPermission("dethi", "update") && $dethi['nguoitao'] == $_SESSION['user_id']) {
                    $this->view("main_layout", [
                        "Page" => "add_update_test",
                        "Title" => "Cập nhật đề kiểm tra",
                        "Plugin" => [
                            "datepicker" => 1,
                            "flatpickr" => 1,
                            "select" => 1,
                            "notify" => 1,
                            "jquery-validate" => 1
                        ],
                        "Script" => "action_test",
                        "Action" => "update"
                    ]);
                } else {
                    $this->view("single_layout", ["Page" => "error/page_403", "Title" => "Lỗi !"]);
                }
            } else {
                $this->view("single_layout", ["Page" => "error/page_404", "Title" => "Lỗi !"]);
            }
        } else {
            $this->view("single_layout", ["Page" => "error/page_404", "Title" => "Lỗi !"]);
        }
    }

    public function start($made)
    {
        if(filter_var($made, FILTER_VALIDATE_INT) !== false) {
            $dethi = $this->dethimodel->getById($made);
            $check_allow = $this->dethimodel->checkStudentAllowed($_SESSION['user_id'], $made);
            if (isset($dethi)) {
                if(AuthCore::checkPermission("tgthi", "join") && $check_allow) {
                    $this->view("main_layout", [
                        "Page" => "vao_thi",
                        "Title" => "Bắt đầu thi",
                        "Test" => $dethi,
                        "Check" => $this->ketquamodel->getMaKQ($made, $_SESSION['user_id']),
                        "Script" => "vaothi",
                        "Plugin" => [
                            "notify" => 1
                        ]
                    ]);
                } else {
                    $this->view("single_layout", ["Page" => "error/page_403", "Title" => "Lỗi !"]);
                }
            } else {
                $this->view("single_layout", ["Page" => "error/page_404", "Title" => "Lỗi !"]);
            }
        } else {
            $this->view("single_layout", ["Page" => "error/page_404", "Title" => "Lỗi !"]);
        }
    }

    public function detail($made)
    {
        if(filter_var($made, FILTER_VALIDATE_INT) !== false) {
            $dethi = $this->dethimodel->getInfoTestBasic($made);
            if (isset($dethi)) {
                if(AuthCore::checkPermission("dethi", "create") && $dethi['nguoitao'] == $_SESSION['user_id']) {
                    $this->view("main_layout", [
                        "Page" => "test_detail",
                        "Title" => "Danh sách đã thi",
                        "Test" => $dethi,
                        "Script" => "test_detail",
                        "Plugin" => [
                            "pagination" => [],
                            "chart" => 1
                        ]
                    ]);
                } else {
                    $this->view("single_layout", ["Page" => "error/page_403", "Title" => "Lỗi !"]);
                }
            } else {
                $this->view("single_layout", ["Page" => "error/page_404", "Title" => "Lỗi !"]);
            }
        } else {
            $this->view("single_layout", ["Page" => "error/page_404", "Title" => "Lỗi !"]);
        }
    }

    public function select($made)
    {
        if(filter_var($made, FILTER_VALIDATE_INT) !== false) {
            $check = $this->dethimodel->getById($made);
            if (isset($check)) {
                if(($check && AuthCore::checkPermission("dethi", "create") || AuthCore::checkPermission("dethi", "update")) && $check['loaide'] == 0 && $check['nguoitao'] == $_SESSION['user_id']) {
                    $this->view('main_layout', [
                        "Page" => "select_question",
                        "Title" => "Chọn câu hỏi",
                        "Script" => "select_question",
                        "Plugin" => [
                            "notify" => 1,
                            "pagination" => [],
                        ],
                    ]);
                } else {
                    $this->view("single_layout", ["Page" => "error/page_403", "Title" => "Lỗi !"]);
                }
            } else {
                $this->view("single_layout", [
                    "Page" => "error/page_404",
                    "Title" => "Lỗi !"
                ]);
            }
        } else {
            $this->view("single_layout", ["Page" => "error/page_404", "Title" => "Lỗi !"]);
        }
    }

    // Tham gia thi
    public function taketest($made)
    {
        if(filter_var($made, FILTER_VALIDATE_INT) !== false) {
            if (AuthCore::checkPermission("tgthi", "join")) {
                $user_id = $_SESSION['user_id'];
                $check = $this->ketquamodel->getMaKQ($made, $user_id);
                $infoTest = $this->dethimodel->getById($made);
                date_default_timezone_set('Asia/Ho_Chi_Minh');
                $now = new DateTime();
                $timestart = new DateTime($infoTest['thoigianbatdau']);
                $timeend = new DateTime($infoTest['thoigianketthuc']);
                if ($now >= $timestart && $now <= $timeend && $check['diemthi'] == '') {
                    $this->view("single_layout", [
                        "Page" => "de_thi",
                        "Title" => "Làm bài kiểm tra",
                        "Made" => $made,
                        "Script" => "de_thi",
                        "Plugin" => [
                            "sweetalert2" => 1
                        ]
                    ]);
                } else {
                    header("Location: ../start/$made");
                }
            } else {
                $this->view("single_layout", ["Page" => "error/page_403", "Title" => "Lỗi !"]);
            }
        } else {
            $this->view("single_layout", ["Page" => "error/page_404", "Title" => "Lỗi !"]);
        }
    }

    public function delete()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST" && AuthCore::checkPermission("dethi", "delete")) {
            $made = $_POST['made'];
            $result = $this->dethimodel->delete($made);
            echo json_encode($result);
        } else {
            echo json_encode(false);
        }
    }

    public function addTest()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST" && AuthCore::checkPermission("dethi", "create")) {
            $mamonhoc = $_POST['mamonhoc'];
            $nguoitao = $_SESSION['user_id'];
            $tende = $_POST['tende'];
            $thoigianthi = $_POST['thoigianthi'];
            $thoigianbatdau = $_POST['thoigianbatdau'];
            $thoigianketthuc = $_POST['thoigianketthuc'];
            $socaude = $_POST['socaude'];
            $socautb = $_POST['socautb'];
            $socaukho = $_POST['socaukho'];
            $chuong = isset($_POST['chuong']) ? $_POST['chuong'] : array();
            $loaide = $_POST['loaide'];
            $xemdiem = $_POST['xemdiem'];
            $xemdapan = $_POST['xemdapan'];
            $xembailam = $_POST['xembailam'];
            $daocauhoi = $_POST['daocauhoi'];
            $daodapan = $_POST['daodapan'];
            $tudongnop = $_POST['tudongnop'];
            $manhom = $_POST['manhom'];
            $result = $this->dethimodel->create($mamonhoc, $nguoitao, $tende, $thoigianthi, $thoigianbatdau, $thoigianketthuc, $xembailam, $xemdiem, $xemdapan, $daocauhoi, $daodapan, $tudongnop, $loaide, $socaude, $socautb, $socaukho, $chuong, $manhom);
            echo $result;
        }
    }

    public function updateTest()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST" && AuthCore::checkPermission("dethi", "update")) {
            $made = $_POST['made'];
            $mamonhoc = $_POST['mamonhoc'];
            $tende = $_POST['tende'];
            $thoigianthi = $_POST['thoigianthi'];
            $thoigianbatdau = $_POST['thoigianbatdau'];
            $thoigianketthuc = $_POST['thoigianketthuc'];
            $socaude = $_POST['socaude'];
            $socautb = $_POST['socautb'];
            $socaukho = $_POST['socaukho'];
            $chuong = $_POST['chuong'];
            $loaide = $_POST['loaide'];
            $xemdiem = $_POST['xemdiem'];
            $xemdapan = $_POST['xemdapan'];
            $xembailam = $_POST['xembailam'];
            $daocauhoi = $_POST['daocauhoi'];
            $daodapan = $_POST['daodapan'];
            $tudongnop = $_POST['tudongnop'];
            $manhom = $_POST['manhom'];
            $result = $this->dethimodel->update($made, $mamonhoc, $tende, $thoigianthi, $thoigianbatdau, $thoigianketthuc, $xembailam, $xemdiem, $xemdapan, $daocauhoi, $daodapan, $tudongnop, $loaide, $socaude, $socautb, $socaukho, $chuong, $manhom);
            echo $result;
        }
    }

    public function getDetail()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST" && AuthCore::checkPermission("dethi", "view")) {
            $made = $_POST['made'];
            $result = $this->dethimodel->getById($made);
            echo json_encode($result);
        }
    }

    public function getTestGroup()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $manhom = $_POST['manhom'];
            $result = $this->dethimodel->getListTestGroup($manhom);
            echo json_encode($result);
        }
    }

    public function addDetail()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $made = $_POST['made'];
            $cauhoi = $_POST['cauhoi'];
            $result = $this->chitietde->createMultiple($made, $cauhoi);
            echo json_encode($result);
        }
    }

    public function getQuestion()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $made = $_POST['made'];
            $result = $this->dethimodel->getQuestionByUser($made, $_SESSION['user_id']);
            echo json_encode($result);
        }
    }

    public function getQuestionOfTestManual()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $made = $_POST['made'];
            $result = $this->dethimodel->getQuestionOfTestManual($made);
            echo json_encode($result);
        }
    }

    public function getResultDetail()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $makq = $_POST['makq'];
            $result = $this->dethimodel->getResultDetail($makq);
            echo json_encode($result);
        }
    }


    public function startTest()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $made = $_POST['made'];
            $user_id = $_SESSION['user_id'];
            $result = $this->ketquamodel->start($made, $user_id);
            $question = $this->dethimodel->getQuestionOfTest($made);
            echo json_encode($result);
        }
    }

    public function getTimeTest()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $dethi = $_POST['dethi'];
            $result = $this->dethimodel->getTimeTest($dethi, $_SESSION['user_id']);
            echo $result;
        }
    }

    public function getTimeEndTest()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $dethi = $_POST['dethi'];
            $result = $this->dethimodel->getTimeEndTest($dethi);
            echo $result;
        }
    }

    public function submit()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $listtr = $_POST['listCauTraLoi'];
            $thoigian = $_POST['thoigianlambai'];
            str_replace("(Indochina Time)", "(UTC+7:00)", $thoigian);
            $date = DateTime::createFromFormat('D M d Y H:i:s e+', $thoigian);
            $made = $_POST['made'];
            $nguoidung = $_SESSION['user_id'];
            $result = $this->ketquamodel->submit($made, $nguoidung, $listtr, $date->format('Y-m-d H:i:s'));
            echo $result;
        }
    }

    public function getDethi()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $dethi = $_POST['made'];
            $result = $this->dethimodel->create_dethi($dethi);
            echo json_encode($result);
        }
    }

    public function tookTheExam()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $made = $_POST['made'];
            $result = $this->ketquamodel->tookTheExam($made);
            echo json_encode($result);
        }
    }

    public function getExamineeByGroup()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $made = $_POST['made'];
            $manhom = $_POST['manhom'];
            $result = $this->ketquamodel->getExamineeByGroup($made, $manhom);
            echo json_encode($result);
        }
    }

    public function getQuery($filter, $input, $args)
    {
        $result = $this->ketquamodel->getQuery($filter, $input, $args);
        return $result;
    }

    public function getStatictical()
    {
        $made = $_POST['made'];
        $manhom = $_POST['manhom'];
        $result = $this->ketquamodel->getStatictical($made, $manhom);
        echo json_encode($result);
    }

    public function chuyentab(){
        $made = $_POST['made'];
        $id = $_SESSION['user_id'];
        $result = $this->ketquamodel->chuyentab($made,$id);
        echo $result;
    }

    public function exportPdf($makq)
    {
        $dompdf = new Dompdf();

        $info = $this->ketquamodel->getInfoPrintPdf($makq);
        $cauHoi = $this->dethimodel->getResultDetail($makq);
        $diem = $info['diemthi'] != "" ? $info['diemthi'] : 0;
        $socaudung = $info['socaudung'] != "" ? $info['socaudung'] : 0;
        $html = '
        <!DOCTYPE html>
        <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <style>
                * {padding: 0;margin: 0;box-sizing: border-box;}
                body{font-family: "Times New Roman", serif; padding: 50px 50px}
            </style>
        </head>
        <body>
            <table style="width:100%">
                <tr>
                    <td style="text-align: center;font-weight:bold">
                        TRƯỜNG ĐẠI HỌC TÔN ĐỨC THẮNG<br>
                        KHOA CÔNG NGHỆ THÔNG TIN<br><br><br>
                    </td>
                    <td style="text-align: center;">
                        <p style="font-weight:bold">' . mb_strtoupper($info['tende'], "UTF-8") . '</p>
                        <p style="font-weight:bold">Học phần: ' . $info['tenmonhoc'] . '</p>
                        <p style="font-weight:bold">Mã học phần: ' . $info['mamonhoc'] . '</p>
                        <p style="font-style:italic">Thời gian làm bài: ' . $info['thoigianthi'] . ' phút</p>
                    </td>
                </tr>
            </table>
            <table style="width:100%;margin-bottom:10px">
                <tr style="width:100%">
                    <td>Mã sinh viên: ' . $info['manguoidung'] . '</td>
                    <td>Tên thí sinh: ' . $info['hoten'] . '</td>
                </tr>
                <tr style="width:100%">
                    <td>Số câu đúng: ' . $socaudung . '/' . $info['tongsocauhoi'] . '</td>
                    <td>Điểm: ' . $diem . '</td>
                </tr>
            </table>       
            <hr>
            <div style="margin-top:20px">
        ';

        $html .= '
        </div>
        </body>
        </html>
        ';
        $dompdf->loadHtml($html, 'UTF-8');

        // Thiết lập kích thước giấy và hướng giấy
        $dompdf->setPaper('A4', 'portrait');

        // Xuất PDF
        $dompdf->render();
        $output = $dompdf->output();
        echo base64_encode($output);
    }

    function toAlpha($num){
        return chr(substr("000".($num+65),-3));
    }

    public function check(){
        $result = $this->ketquamodel->getMarkOfAllTest(2);
        echo "</br>";
        print_r($result);
    }

    public function getGroupsTakeTests() {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $tests = $_POST["tests"];
            $result = $this->dethimodel->getGroupsTakeTests($tests);
            echo json_encode($result);
        }
    }

    public function getTestsGroupWithUserResult()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $manhom = $_POST['manhom'];
            $result = $this->dethimodel->getTestsGroupWithUserResult($manhom, $_SESSION['user_id']);
            echo json_encode($result);
        }
    }
}