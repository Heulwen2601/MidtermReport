<?php include_once("header.php"); ?>

<?php
    require_once("entities/product.class.php");
    require_once("entities/category.class.php");

    if (isset($_POST["btnsubmit"])) {
        $productName = $_POST["txtName"];
        $cateID = $_POST["txtCateID"];
        $price = $_POST["txtprice"];
        $quantity = $_POST["txtquantity"];
        $description =$_POST["txtdesc"];
        $picture = $_FILES["txtpic"];

        $newProduct = new Product($productName, $cateID, $price, $quantity, $description, $picture);

        $result = $newProduct->save();

        if (!$result) {
            header("Location: add_product.php?faillure");
        }
        else {
            header("Location: add_product.php?inserted");
        }
    }
?>

<?php
    if (isset($_GET["inserted"])) {
        echo "<h2>Thêm sản phẩm thành công</h2>";
    }
?>

<form method="post" enctype=”multipart/form-data”>
    <div class="row">
        <div class="lbltittle">
            <label>Tên sản phẩm</label>
        </div>

        <div class="lblinput">
            <input type="text" name="txtName" value="<?php echo isset($_POST["txtName"]) ? $_POST["txtName"] : "" ; ?>" />
        </div>
    </div>

    <div class="row">
        <div class="lbltittle">
            <label>Mô tả sản phẩm</label>
        </div>

        <div class="lblinput">
            <textarea name="txtdesc" cols="21" rows="10" value="<?php echo isset($_POST["txtdesc"]) ? $_POST["txtdesc"] : "" ; ?>"></textarea>
        </div>
    </div>

    <div class="row">
        <div class="lbltittle">
            <label>Số lượng sản phẩm</label>
        </div>

        <div class="lblinput">
            <input type="number" name="txtquantity" value="<?php echo isset($_POST["txtquantity"]) ? $_POST["txtquantity"] : "" ; ?>"/>
        </div>
    </div>

    <div class="row">
        <div class="lbltittle">
            <label>Giá sản phẩm</label>
        </div>

        <div class="lblinput">
            <input type="text" name="txtprice" value="<?php echo isset($_POST["txtprice"]) ? $_POST["txtprice"] : "" ; ?>"/>
        </div>
    </div>

    <div class="row">
        <div class="lbltittle">
            <label>Loại sản phẩm</label>
        </div>

        <div class="lblinput">
            <select name="txtCateID">
                <option value="" selected>--Chọn loại--</option>
                <?php
                    $cates = Category::list_category();
                    foreach ($cates as $item) {
                        echo "<option value=".$item["CateID"].">".$item["CategoryName"]."</option>";
                    }
                    ?>
            </select>
        </div>
    </div>

    <div class="row">
        <div class="lbltittle">
            <label>Hình ảnh</label>
        </div>

        <div class="lblinput">
            <input type="file" name="txtpic" accept=".png, .gif, .jpg" />
        </div>
    </div>

    <div class="row">
        <div class="submit">
            <input type="submit" name="btnsubmit" value="Thêm sản phẩm"/>
        </div>
    </div>
</form>

<?php include_once("footer.php"); ?>