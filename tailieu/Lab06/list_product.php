<?php
    require_once("entities/product.class.php");
    require_once("entities/category.class.php");
?>

<?php
    include_once("header.php");
    if (!isset($_GET["cateid"])) {
        $prods = Product::list_product();
    }
    else {
        $cateid = $_GET["cateid"];
        $prods = Product::list_product_by_cateid($cateid);
    }
    $cates = Category::list_category();
?>
<div class="container text-center">
    <div class="col-sm-3 panel panel-danger">
        <h3 class="panel-heading">Danh mục</h3>
        <ul class="list-group">
            <?php
                foreach ($cates as $item) {
                    echo "<li class='list-group-item'><a href='/lab3/list_product.php?cateid=".$item["CateID"]."'>".$item["CategoryName"]."</a></li>";
                }
            ?>
        </ul>
    </div>
    <div class="col-sm-9 panel panel-info">
        <h3 class="panel-heading">Chi tiết sản phẩm</h3><br>
        <div class="row">
            <?php
                foreach ($prods as $item) {
            ?>
                    <div class="col-sm-6">
                        <img src="<?php echo "images/".$item["Picture"];?>" class="img-responsive" style="width:100%" alt="Image">
                    </div>
                    <div class="col-sm-6">
                        <div style="padding: 10px">
                            <h3 class="text-info">
                                <?php echo $item["ProductName"];?>
                            </h3>
                            <p>
                                Giá: <?php echo $item["Price"];?>
                            </p>
                            <p>
                                Mô tả: <?php echo $item["Description"];?>
                            </p>
                            <p>
                              <button type="button" class="btn btn-primary" onclick="location.href='lab3/shopping_cart.php?id=<?php echo $item["ProductID"];?>'">Mua hàng</button>
                            </p>
                        </div>
                    </div>
            <?php
                }
            ?>
        </div>
    </div>
    <?php if (isset($prods_relate) && !empty($prods_relate)) { ?>
        <h3 class="panel-heading">Sản phẩm liên quan</h3>
        <div class="row">
            <?php
                foreach ($prods_relate as $item) {
            ?>
                    <div class="col-sm-4">
                        <a href="/Lab3/product_detail.php?id=<?php echo $item["ProductID"]; ?>">
                            <img src="<?php echo "images/".$item["Picture"];?>" class="img-responsive" style="width: 100%" alt="Image">
                        </a>
                        <p class="text-danger"><?php echo $item["ProductName"]; ?></p>
                        <p class="text-info"><?php echo $item["Price"]; ?></p>
                        <p>
                          <button type="button" class="btn btn-primary" onclick="location.href='lab3/shopping_cart.php?id=<?php echo $item["ProductID"];?>'">Mua hàng</button>
                        </p>
                    </div>
            <?php
                }
            ?>
        </div>
    <?php } ?>
</div>

<?php
    include_once("footer.php");
?>