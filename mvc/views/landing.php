<?php require "inc/head.php" ?>

<body>
    <!-- Page Container -->
    <div id="page-container" class="sidebar-dark side-scroll page-header-fixed page-header-glass main-content-boxed remember-theme">
        <!-- Header -->
        <header id="page-header">
            <div class="content-header">
                <div class="space-x-1 d-flex align-items-center space-x-2 animated zoomInRight">
                    <a class="link-fx fw-bold" href="home">
                        <i class="fa fa-fire text-primary"></i>
                        <span class="fs-4 text-dual">TDTU </span><span class="fs-4 text-primary">Exam</span>
                    </a>
                </div>
                <div class="space-x-1">
                    <ul class="nav-main nav-main-horizontal nav-main-hover nav">
                        <li class="nav-main-item">
                            <a class="btn btn-hero rounded-pill btn-light px-3" data-toggle="class-toggle" data-target="#dark-mode-toggler" data-class="far fa" onclick="Dashmix.layout('dark_mode_toggle');" href="javascript:void(0)">
                                <i class="fa fa-moon" id="dark-mode-toggler"></i>
                            </a>
                        </li>
                        <?php 
                        if(!isset($_COOKIE['token'])) {
                            echo '<li class="nav-main-item">
                                <a class="btn btn-hero btn-light rounded-pill" href="auth/signin">
                                    <i class="fa fa-right-to-bracket me-2"></i>Đăng nhập
                                </a>
                            </li>';
                        } else {
                            echo '<li class="nav-main-item">
                                <a class="btn btn-hero btn-primary rounded-pill" href="dashboard">
                                    <i class="fa fa-sliders me-2"></i>Tổng quan
                                </a>
                            </li>';
                        }
                        ?>
                    </ul>
                </div>
            </div>
        </header>
        <!-- END Header -->
        <!-- Main Container -->
        <main id="main-container">
            <!-- Hero -->
            <div class="hero bg-body-extra-light hero-bubbles hero-lg overflow-hidden">
                <div class="hero-inner">
                    <span class="hero-bubble hero-bubble-lg bg-warning" style="top: 20%; left: 10%;"></span>
                    <span class="hero-bubble bg-success" style="top: 20%; left: 80%;"></span>
                    <span class="hero-bubble hero-bubble-sm bg-xwork" style="top: 40%; left: 25%;"></span>
                    <span class="hero-bubble hero-bubble-lg bg-xmodern" style="top: 10%; left: 20%;"></span>
                    <span class="hero-bubble hero-bubble-lg bg-xeco" style="top: 30%; left: 90%;"></span>
                    <span class="hero-bubble hero-bubble-lg bg-danger" style="top: 35%; left: 20%;"></span>
                    <span class="hero-bubble hero-bubble-lg bg-warning" style="top: 60%; left: 35%;"></span>
                    <span class="hero-bubble bg-info" style="top: 60%; left: 80%;"></span>
                    <span class="hero-bubble hero-bubble-lg bg-xdream" style="top: 75%; left: 70%;"></span>
                    <span class="hero-bubble hero-bubble-lg bg-xpro" style="top: 75%; left: 10%;"></span>
                    <span class="hero-bubble bg-xplay" style="top: 90%; left: 90%;"></span>
                    <div class="position-relative d-flex align-items-center">
                        <div class="content content-full">
                            <div class="row g-6 w-100 py-7 overflow-hidden">
                                <div
                                    class="col-md-7 order-md-last py-4 d-md-flex align-items-md-center justify-content-md-end">
                                    <img class="img-fluid animated flipInX" src="./public/media/various/landing.png"
                                        alt="Hero Promo">
                                </div>
                                <div class="col-md-5 py-4 d-flex align-items-center invisible" data-toggle="appear"
                                    data-class="animated fadeInLeft">
                                    <div class="text-center text-md-start">
                                        <h1 class="fw-bold fs-2 mb-3">
                                            Hệ thống hỗ trợ giảng viên khoa CNTT
                                        </h1>
                                        <p class="text-muted fw-medium mb-4">
                                            Hệ thống hỗ trợ các chức năng như xem lịch giảng dạy, lưu lại thông tin về bài giảng, tài liệu môn học và thiết lập các nhắc nhở. Ngoài ra, bạn có thể tạo các bài thi trắc nghiệm online, lưu lại danh sách điểm danh sinh viên,...
                                        </p>
                                        <a class="btn btn-alt-primary py-2 px-3 m-1" href="auth/signin" target="_blank">
                                            <i class="fa fa-arrow-right opacity-50 me-1"></i> Sử dụng ngay
                                        </a>
                                        <a class="btn btn-alt-secondary py-2 px-3 m-1 btn--scroll-to">
                                            <i class="fa fa-arrow-down opacity-50 me-1"></i> Tìm hiểu thêm
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END Hero -->
            <!-- Section 1 -->
            <div class="position-relative bg-body-extra-light" id="section--1">
                <div class="position-absolute top-0 end-0 bottom-0 start-0 bg-body-light skew-y-1"></div>
                <div class="position-relative">
                    <div class="content content-full my-5">
                        <div class="row g-0 justify-content-center text-center">
                        <div class="col-xl-4 invisible" data-toggle="appear" data-class="animated flipInX">
                                <div class="w-100 py-4 px-2">
                                    <div class="d-inline-block bg-body-extra-light rounded p-1 mb-4">
                                        <div class="d-inline-block bg-xinspire-light rounded p-4">
                                            <i class="fa fa-light fa-bell fa-2x text-xinspire-dark"></i>
                                        </div>
                                    </div>
                                    <h3 class="h4 fw-bold mb-1">
                                        Tạo các nhắc nhở cho lịch làm việc.
                                    </h3>
                                    <p class="fw-medium text-dark mb-0">
                                        Tính năng giúp người dùng ghi chú các lịch hẹn, lịch làm việc hay các công việc phải làm. Khi đến thời gian thiết lập, hệ thống sẽ gửi thông báo cho người dùng để nhắc nhở.
                                    </p>
                                </div>
                            </div>
                            <div class="col-xl-4 invisible" data-toggle="appear" data-class="animated flipInX">
                                <div class="w-100 py-4 px-2">
                                    <div class="d-inline-block bg-body-extra-light rounded p-1 mb-4">
                                        <div class="d-inline-block bg-xplay-lighter rounded p-4">
                                            <i class="fa fa-clipboard-user fa-2x text-xplay"></i>
                                        </div>
                                    </div>
                                    <h3 class="h4 fw-bold mb-1">
                                        Hỗ trợ điểm danh sinh viên
                                    </h3>
                                    <p class="fw-medium text-dark mb-0">
                                        Tính năng giúp hỗ trợ lưu các thông tin, random gọi tên sinh viên, gửi email cho sinh viên và lọc những sinh viên theo yêu cầu của người dùng.
                                    </p>
                                </div>
                            </div>
                            <div class="col-xl-4 invisible" data-toggle="appear" data-class="animated flipInX">
                                <div class="w-100 py-4 px-2">
                                    <div class="d-inline-block bg-body-extra-light rounded p-1 mb-4">
                                        <div class="d-inline-block bg-xpro-lighter rounded p-4">
                                            <i class="fa fa-file-lines fa-2x text-xpro"></i>
                                        </div>
                                    </div>
                                    <h3 class="h4 fw-bold mb-1">
                                        Tạo bài thi trắc nghiệm online
                                    </h3>
                                    <p class="fw-medium text-dark mb-0">
                                        Lưu hệ thống những câu hỏi trắc nghiệm theo chủ đề, đưa ra các đề thi dựa vào random theo từng mức độ. Ngoài ra còn ghi lại những thao tác chuột, chuyển tab khi sử dụng trang web.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END Section 1 -->

            <!-- Section 2 -->
            <div class="bg-body-extra-light">
                <div class="content content-full">
                    <div class="row">
                        <div class="order-md-1 col-md-6 d-flex align-items-center justify-content-center">
                            <img src="./public/media/various/landing_1.png" alt="" class="feature__img invisible"
                                data-toggle="appear" data-class="animated fadeInRight">
                        </div>
                        <div class="order-md-0 col-md-6 d-flex align-items-center">
                            <div>
                                <h3 class="h3 mb-4 fw-bolder invisible" data-toggle="appear"
                                    data-class="animated fadeInUp" data-offset="-200">
                                    Lưu thông tin điểm danh
                                </h3>
                                <p class="mb-4 invisible" data-toggle="appear" data-class="animated fadeInUp"
                                    data-offset="-200">Hệ thống lưu thông tin về các thông tin điểm danh của từng sinh viên</p>
                                <ul class="text-dark mb-4 m-0 list-unstyled">
                                    <li class="list-landing invisible" data-toggle="appear"
                                        data-class="animated fadeInUp" data-offset="-200" data-timeout="200">Điểm danh có mặt, vắng mặt, đánh dấu đã vắng hết số buổi</li>
                                    <li class="list-landing invisible" data-toggle="appear"
                                        data-class="animated fadeInUp" data-offset="-200" data-timeout="400">Gửi thông báo cho giáo viên để nhắc nhở sinh viên đi học đầy đủ</li>
                                    <li class="list-landing invisible" data-toggle="appear"
                                        data-class="animated fadeInUp" data-offset="-200" data-timeout="600">Xuất file excel trang tính để gửi cho sinh viên</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="content content-full">
                    <div class="row">
                        <div class="order-md-0 col-md-6 d-flex align-items-center justify-content-center">
                            <img src="./public/media/various/landing_2.png" alt="" class="feature__img invisible"
                                data-toggle="appear" data-class="animated fadeInLeft">
                        </div>
                        <div class="order-md-1 col-md-6 d-flex align-items-center">
                            <div>
                                <h3 class="h3 mb-4 fw-bolder invisible" data-toggle="appear"
                                    data-class="animated fadeInUp" data-offset="-200">
                                    Tạo các nhắc nhở, lịch hẹn cá nhân
                                </h3>
                                <p class="invisible" data-toggle="appear" data-class="animated fadeInUp"
                                    data-offset="-200">
                                    Bạn có thể cài đặt các thông báo theo:
                                </p>
                                <ul class="text-dark mb-4 m-0 list-unstyled">
                                    <li class="list-landing invisible" data-toggle="appear"
                                        data-class="animated fadeInUp" data-offset="-200" data-timeout="200">Gửi mail cho tôi khi đến thời gian</li>
                                    <li class="list-landing invisible" data-toggle="appear"
                                        data-class="animated fadeInUp" data-offset="-200" data-timeout="400">Hiển thị khi tôi đăng nhập vào hệ thống</li>
                                    <li class="list-landing invisible" data-toggle="appear"
                                        data-class="animated fadeInUp" data-offset="-200" data-timeout="600">Hiển thị thêm chức năng đánh dấu đã hoàn thành</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="content content-full">
                    <div class="row">
                        <div class="order-md-1 col-md-6 d-flex align-items-center justify-content-center">
                            <img src="./public/media/various/landing_3.png" alt="" class="feature__img invisible"
                                data-toggle="appear" data-class="animated fadeInRight">
                        </div>
                        <div class="order-md-0 col-md-6 d-flex align-items-center">
                            <div>
                                <h3 class="h3 mb-4 fw-bolder invisible" data-toggle="appear"
                                    data-class="animated fadeInUp" data-offset="-200">
                                    Tạo bài thi trắc nghiệm một chạm
                                </h3>
                                <p class="mb-2 invisible" data-toggle="appear" data-class="animated fadeInUp"
                                    data-offset="-200">Hệ thống tạo đề thi trắc nghiệm cho phép người dùng chọn chủ đề và tạo đề thi nhanh chóng</p>
                                <ul class="text-dark mb-4 m-0 list-unstyled">
                                    <li class="list-landing invisible" data-toggle="appear"
                                        data-class="animated fadeInUp" data-offset="-200" data-timeout="200">Đưa ra phân loại thông hiểu, vận dụng, vận dụng cao cho các câu hỏi</li>
                                    <li class="list-landing invisible" data-toggle="appear"
                                        data-class="animated fadeInUp" data-offset="-200" data-timeout="400">Cho phép tải hình ảnh, video và âm thanh cho bài thi
                                    </li>
                                    <li class="list-landing invisible" data-toggle="appear"
                                        data-class="animated fadeInUp" data-offset="-200" data-timeout="600">Các tính năng đánh dấu câu hỏi và câu trả lời, highlight từ khóa cho người dùng</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bg-body-extra-light">
                <div class="content content-full">
                    <div class="pt-7 pb-5">
                        <div class="position-relative">
                            <h2 class="fw-bold mb-2 text-center invisible" data-toggle="appear" data-class="animated fadeInDown" data-offset="-200">
                                <span class="text-primary">Nhóm phát triển</span>
                            </h2>
                            <h3 class="h4 fw-medium text-muted text-center mb-5 invisible" data-toggle="appear" data-class="animated fadeInDown" data-offset="-200">
                                Luôn sẵn sàng tiếp thu và thay đổi theo nhu cầu của bạn.
                            </h3>
                        </div>
                        <div class="row">
                            <div class="text-center slider-team">
                                <div class="p-3 invisible" data-toggle="appear" data-class="animated flipInX">
                                    <a class="block block-rounded bg-gd-primary text-center"
                                        href="https://github.com/transinh085">
                                        <div class="block-content block-content-full bg-gd-sea">
                                            <img class="img-avatar img-avatar-thumb"
                                                src="https://github.com/transinh085.png?size=460" alt="">
                                        </div>
                                        <div class="block-content block-content-full bg-black-10">
                                            <p class="fw-semibold text-white mb-0">Nguyễn Nhật Huy</p>
                                            <p class="fs-sm text-white-75 mb-0">
                                            52200080
                                            </p>
                                        </div>
                                    </a>
                                </div>
                                <div class="p-3 invisible" data-toggle="appear" data-class="animated flipInX">
                                    <a class="block block-rounded bg-gd-primary text-center"
                                        href="https://github.com/hgbaodev">
                                        <div class="block-content block-content-full bg-gd-sea">
                                            <img class="img-avatar img-avatar-thumb"
                                                src="https://github.com/hgbaodev.png?size=460" alt="">
                                        </div>
                                        <div class="block-content block-content-full bg-black-10">
                                            <p class="fw-semibold text-white mb-0">Nguyễn Quốc Huy</p>
                                            <p class="fs-sm text-white-75 mb-0">
                                            52200084
                                            </p>
                                        </div>
                                    </a>
                                </div>
                                <div class="p-3 invisible" data-toggle="appear" data-class="animated flipInX">
                                    <a class="block block-rounded bg-gd-primary text-center"
                                        href="https://github.com/nhienau">
                                        <div class="block-content block-content-full bg-gd-sea">
                                            <img class="img-avatar img-avatar-thumb"
                                                src="https://github.com/nhienau.png?size=460" alt="">
                                        </div>
                                        <div class="block-content block-content-full bg-black-10">
                                            <p class="fw-semibold text-white mb-0">Lâm Huỳnh Như</p>
                                            <p class="fs-sm text-white-75 mb-0">
                                            52200028
                                            </p>
                                        </div>
                                    </a>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END Section 2 -->

            <!-- Section 3 -->
            <div class="bg-body-light">
                <div class="content content-full">
                    <div class="py-4">
                        <h2 class="fw-bold mb-2 text-center invisible" data-toggle="appear" data-class="animated fadeInDown" data-offset="-200">
                            Nhận xét thực tế của <span class="text-primary">người dùng</span>
                        </h2>
                        <h3 class="h4 fw-medium text-muted text-center mb-5 invisible" data-toggle="appear" data-class="animated fadeInDown" data-offset="-200">
                            Luôn đồng hành và mang lại các trải nghiệm tốt nhất cho người dùng.
                        </h3>
                    </div>
                    <!-- Slider -->
                    <div class="js-slider invisible" data-toggle="appear" data-class="animated bounceIn" data-offset="-200" data-timeout="400" data-dots="true" data-arrows="true"
                        data-slides-to-show="1" data-autoplay="false">
                        <div class="py-3">
                            <blockquote class="blockquote">
                                <p class="px-7 fs-5 text-justify mb-5">"TDTU Exam là một hệ thống hỗ trợ cho các giảng viên khoa Công nghệ Thông tin, được thiết kế bởi các học sinh trong khoa. Đáp ứng đủ những yêu cầu cơ bản mà một giảng viên cần thiết."
                                </p>
                            </blockquote>
                            <div class="d-flex align-items-center justify-content-center">
                                <img class="img-avatar me-4" src="./public/media/avatars/thanhsang.jpg" alt="">
                                <div class="d-flex flex-column align-items-start">
                                    <div class="mt-2 fw-semibold fs-4">Nguyễn Văn A</div>
                                    <div class="fs-sm text-muted fs-5">Giảng viên</div>
                                </div>
                            </div>
                        </div>
                        <div class="py-3">
                            <blockquote class="blockquote">
                                <p class="px-7 fs-5 text-justify mb-5">"Giao diện của TDTU trực quan và dễ sử dụng, tính năng tùy chỉnh giao diện và phục vụ tương đối các tính năng cần thiết, đánh giá cao các tính năng lưu tài liệu giảng dạy theo từng môn học.</p>
                            </blockquote>
                            <div class="d-flex align-items-center justify-content-center">
                                <img class="img-avatar me-4" src="./public/media/avatars/avatar0.jpg" alt="">
                                <div class="d-flex flex-column align-items-start">
                                    <div class="mt-2 fw-semibold fs-4">Nguyễn Văn B</div>
                                    <div class="fs-sm text-muted fs-5">52200xxx</div>
                                </div>
                            </div>
                        </div>
                        <div class="py-3">
                            <blockquote class="blockquote">
                                <p class="px-7 fs-5 text-justify mb-5">"TDTU Exam đảm bảo an toàn và bảo mật thông tin của người dùng. Tôi rất hài lòng với trải nghiệm của mình khi sử dụng hệ thống này."
                                </p>
                            </blockquote>
                            <div class="d-flex align-items-center justify-content-center">
                                <img class="img-avatar me-4" src="./public/media/avatars/avatar0.jpg" alt="">
                                <div class="d-flex flex-column align-items-start">
                                    <div class="mt-2 fw-semibold fs-4">Trần Thị C</div>
                                    <div class="fs-sm text-muted fs-5">52200xxx</div>
                                </div>
                            </div>
                        </div>
                        <div class="py-3">
                            <blockquote class="blockquote">
                                <p class="px-7 fs-5 text-justify mb-5">Nhờ có TDTU Exam mà tôi đã tiết kiệm được rất nhiều thời gian trong việc quản lý lớp học của mình. Việc soạn bài, tạo các đề thi để cho học sinh thi chưa bao giờ đơn giản đến thế. Đặc biệt các bạn tư vấn và hỗ trợ rất nhiệt tình khi mình gặp vướng mắc.
                                </p>
                            </blockquote>
                            <div class="d-flex align-items-center justify-content-center">
                                <img class="img-avatar me-4" src="./public/media/avatars/avatar0.jpg" alt="">
                                <div class="d-flex flex-column align-items-start">
                                    <div class="mt-2 fw-semibold fs-4">Trần Văn D</div>
                                    <div class="fs-sm text-muted fs-5">52200xxx</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END Slider -->
                </div>
            </div>
            <!-- END Section 3 -->
        </main>
        <!-- END Main Container -->

        <!-- Footer -->
        <footer id="page-footer" class="footer-static bg-body-extra-light">
            <div class="content py-4">
                <!-- Footer Navigation -->
                <div class="row items-push fs-sm border-bottom pt-4">
                    <div class="col-6 col-md-4">
                        <h3 class="fw-semibold">Thông tin</h3>
                        <ul class="list list-simple-mini">
                            <li>
                                <a class="fw-semibold text-dark" href="#">
                                    Hướng dẫn sử dụng
                                </a>
                            </li>
                            <li>
                                <a class="fw-semibold text-dark" href="#">
                                    Cam kết bảo mật thông tin
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h3 class="fw-semibold">Địa chỉ</h3>
                        <div class="fs-sm push">
                            Trường Đại học Tôn Đức Thắng<br>
                            19 Đ.Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh<br>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h3 class="fw-semibold">Liên hệ</h3>
                        <ul class="list list-simple-mini">
                            <li>
                                <a class="fw-semibold" href="#">
                                    <i class="fab fa-1x fa-facebook-f me-2 text-dark"></i>
                                </a>
                                <a class="fw-semibold" href="#">
                                    <i class="fab fa-1x fa-facebook-messenger text-dark"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- END Footer Navigation -->

                <!-- Footer Copyright -->
                <div class="row fs-sm pt-4">
                    <div class="col-md-6 offset-md-3 text-center">
                        Copyright © 2024 Azota.
                    </div>
                </div>
                <!-- END Footer Copyright -->
            </div>
        </footer>
        <!-- END Footer -->
    </div>
    <!-- END Page Container -->

    <?php require "inc/script.php"?>
</body>

</html>