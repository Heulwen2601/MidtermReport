<div class="row g-0 flex-md-grow-1" id="chitietdethi" data-id="<?php echo $data["Test"]["made"] ?>">
    <div class="content content-full">
        <div class="block block-rounded">
            <ul class="nav nav-tabs nav-tabs-alt align-items-center" role="tablist">
                <li class="nav-item">
                    <button class="nav-link active" id="bang-diem-tab" data-bs-toggle="tab" data-bs-target="#bang-diem" role="tab" aria-controls="bang-diem" aria-selected="true">Bảng
                        điểm</button>
                </li>
                <li class="nav-item ms-auto">
                    <div class="block-options ps-3 pe-2">
                        <button type="button" class="btn-block-option" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSetting" aria-controls="offcanvasSetting">
                            <i class="si si-info"></i>
                        </button>
                        <a data-bs-toggle="tooltip" data-bs-placement="top" title="Chỉnh sửa đề thi" class="btn-block-option" href="./test/update/<?php echo $data["Test"]["made"] ?>" role="button"><i class="si si-pencil"></i></a>
                        <button data-bs-toggle="tooltip" data-bs-placement="top" title="Toàn màn hình" type="button" class="btn-block-option" data-toggle="block-option" data-action="fullscreen_toggle"></button>
                    </div>
                </li>
            </ul>
            <div class="block-content tab-content">
                <div class="tab-pane active" id="bang-diem" role="tabpanel" aria-labelledby="bang-diem-tab" tabindex="0">
                    <form action="#" method="POST" id="search-form" onsubmit="return false;">
                        <div class="row mb-4">
                            <div class="input-group">
                                <div class="col-md-6 d-flex gap-3">
                                    <button class="btn btn-alt-secondary dropdown-toggle btn-filtered-by-group" id="dropdown-filter-group" type="button" data-bs-toggle="dropdown" aria-expanded="false">Tất cả</button>
                                    <ul class="dropdown-menu mt-1" aria-labelledby="dropdown-filter-group">
                                        <li><a class="dropdown-item filtered-by-group active" href="javascript:void(0)" data-value="0">Tất cả</a></li>
                                        <?php
                                        foreach ($data["Test"]["nhom"] as $nhom) {
                                            echo '<li><a class="dropdown-item filtered-by-group" href="javascript:void(0)" data-value="' . $nhom['manhom'] . '">' . $nhom['tennhom'] . '</a></li>';
                                        }
                                        ?>
                                    </ul>
                                    <button class="btn btn-alt-secondary dropdown-toggle btn-filtered-by-state" id="dropdown-filter-state" type="button" data-bs-toggle="dropdown" aria-expanded="false">Đã nộp bài</button>
                                    <ul class="dropdown-menu mt-1" aria-labelledby="dropdown-filter-state">
                                        <li><a class="dropdown-item filtered-by-state" href="javascript:void(0)" data-state="present">Đã nộp bài</a></li>
                                        <li><a class="dropdown-item filtered-by-state" href="javascript:void(0)" data-state="absent">Vắng thi</a></li>
                                        <li><a class="dropdown-item filtered-by-state" href="javascript:void(0)" data-state="interrupted">Chưa nộp bài</a></li>
                                        <li><a class="dropdown-item filtered-by-state" href="javascript:void(0)" data-state="all">Tất cả</a></li>
                                    </ul>
                                </div>
                                <div class="col-md-6 d-flex justify-content-end">
                                    <button type="button" class="btn btn-hero btn-primary btn-sm" id="export_excel"><i class="fa-solid fa-file me-1"></i>Xuất bảng
                                        điểm</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="table-responsive">
                        <table class="table table-vcenter">
                            <thead>
                                <tr class="table-col-title">
                                    <th class="text-center col-sort" data-sort-column="manguoidung" data-sort-order="default">MSSV</th>
                                    <th class="col-sort" data-sort-column="hoten" data-sort-order="default">Họ tên</th>
                                    <th class="text-center col-sort" data-sort-column="diemthi" data-sort-order="default">Điểm</th>
                                    <th class="text-center col-sort" data-sort-column="thoigianvaothi" data-sort-order="default">Thời gian vào thi</th>
                                    <th class="text-center col-sort" data-sort-column="thoigianlambai" data-sort-order="default">Thời gian thi</th>
                                    <th class="text-center col-sort" data-sort-column="solanchuyentab" data-sort-order="default">Số lần thoát</th>
                                </tr>
                            </thead>
                            <tbody id="took_the_exam">
                            </tbody>
                        </table>
                    </div>
                    <?php if (isset($data["Plugin"]["pagination"])) require "./mvc/views/inc/pagination.php" ?>
                </div>
            </div>    
        </div>
    </div>
</div>
</div>

<div class="modal fade" id="modal-cau-hoi" tabindex="-1" role="dialog" aria-labelledby="modal-cau-hoi" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Chi tiết đề thi</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body pb-1">
                <div id="list-question"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-primary" data-bs-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>


<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasSetting" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
        <h4 class="offcanvas-title" id="offcanvasExampleLabel"><?php echo $data["Test"]["tende"] ?></h4>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body content-side">
        <!-- <div class="d-md-none push">
            <button type="button" class="btn w-100 btn-alt-primary" data-toggle="class-toggle" data-target="#side-content" data-class="d-none">
                Thông tin đề thi
            </button>
        </div> -->
        <div>
            <h5 class="mb-3">THÔNG TIN ĐỀ THI</h5>
            <ul class="list-unstyled text-dark fs-sm">
                <li class="mb-1 fs-base"><i class="text-primary fa fa-file-signature me-2"></i><span>Tên đề:
                        <?php echo $data["Test"]["tende"] ?></span>
                </li>
                <li class="mb-1 fs-base"><i class="text-primary fa fa-clock me-2"></i><span>Thời gian tạo:
                        <?php echo date_format(date_create($data["Test"]["thoigiantao"]), "H:i d/m/Y") ?></span>
                </li>
            </ul>
            <h5 class="mb-3">MÔN THI</h5>
            <p class="mb-3"><?php echo $data["Test"]["mamonhoc"] . " - " . $data["Test"]["tenmonhoc"] ?></p>
            <h5 class="mb-3">GIAO CHO</h5>
            <ul class="nav nav-pills nav-justified push">
                <?php
                foreach ($data["Test"]["nhom"] as $nhom) {
                    echo '<li class="nav-item me-1 mb-2"><a class="nav-link border text-muted" href="./module/detail/' . $nhom['manhom'] . '">' . $nhom['tennhom'] . '</a></li>';
                }
                ?>
            </ul>
            <?php
            if ($data["Test"]["loaide"] == 0) {
                echo '<h5 class="mb-3">NỘI DUNG</h5>
                    <a href="javasript:void(0)" class="text-primary fw-bold" data-bs-toggle="modal"
                            data-bs-target="#modal-cau-hoi" data-id="' . $data["Test"]["made"] . '"><i class="fa fa-file me-2"></i>Xem chi tiết</a>';
            }
            ?>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-show-test" tabindex="-1" role="dialog" aria-labelledby="modal-cau-hoi" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Chi tiết kết quả</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body pb-1">
                <div id="content-file">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-alt-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-sm btn-primary" data-bs-dismiss="modal">Done</button>
            </div>
        </div>
    </div>
</div>