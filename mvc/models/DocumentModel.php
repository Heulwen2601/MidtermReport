<?php
class DocumentModel extends DB{
    public function view()
    {
        $sql = "SELECT * FROM doccument";
        $result = mysqli_query($this->con, $sql);
        return $this->con;
    }

    public function create()
    {
        $sql = "SELECT * FROM doccument";
        $result = mysqli_query($this->con, $sql);
        return $this->con;
    }

    public function delete()
    {
        $sql = "SELECT * FROM doccument";
        $result = mysqli_query($this->con, $sql);
        return $this->con;
    }
}
?>
