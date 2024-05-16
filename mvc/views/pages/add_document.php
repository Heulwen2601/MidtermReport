<div class="content">
    <form class="form-taothongbao">
        <div class="row g-0 flex-md-grow-1">
            <div class="col-md-8 col-lg-7 col-xl-9 col-custom-9 order-md-0">
                <div class="content content-full">
                    <form class="block block-rounded form-tao-de" novalidate="novalidate">
                        <div class="block-header block-header-default">
                            <h3 class="block-title">Thêm tài liệu giảng dạy</h3>
                        </div>
                        <div class="block block-content">
                            <div class="form-floating mb-4">
                                <input type="text" class="form-control" id="title" name="title" required>
                                <label for="title">Tiêu đề</label>
                            </div>

                            <div class="form-floating mb-4">
                                <input type="text" class="form-control" id="subject" name="subject" required>
                                <label for="subject">Mã môn học</label>
                            </div>

                            <div class="mb-4">
                                <label for="file" class="form-label">Chọn file để upload</label>
                                <input type="file" class="form-control" id="file" name="file" required>
                            </div>

                            <div class="mb-4">
                                <button type="submit" class="btn btn-hero btn-primary" id="btn-add-document">
                                    <i class="fa fa-fw fa-plus me-1"></i>Thêm tài liệu
                                </button>
                            </div>

                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </form>
</div>
