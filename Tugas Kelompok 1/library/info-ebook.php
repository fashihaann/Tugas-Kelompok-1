<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])==1)
{   
    header('location:index.php');
}
else
{ 
    if(isset($_POST['update']))
    {
        $bookname=$_POST['bookname'];
        $category=$_POST['category'];
        $author=$_POST['author'];
        $isbn=$_POST['isbn'];
        $price=$_POST['price'];
        $bookid=intval($_GET['bookid']);
        $sql="update  tblbooks set BookName=:bookname,CatId=:category,AuthorId=:author,ISBNNumber=:isbn,BookPrice=:price where id=:bookid";
        $query = $dbh->prepare($sql);
        $query->bindParam(':bookname',$bookname,PDO::PARAM_STR);
        $query->bindParam(':category',$category,PDO::PARAM_STR);
        $query->bindParam(':author',$author,PDO::PARAM_STR);
        $query->bindParam(':isbn',$isbn,PDO::PARAM_STR);
        $query->bindParam(':price',$price,PDO::PARAM_STR);
        $query->bindParam(':bookid',$bookid,PDO::PARAM_STR);
        $query->execute();
        $_SESSION['msg']="Book info updated successfully";
        header('location:manage-books.php');
    }
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Online Library Management System | Edit Book</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME STYLE  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>
    <!------MENU SECTION START-->
    <?php include('includes/header.php');?>
    <!-- MENU SECTION END-->
    <div class="content-wrapper">
        <div class="container">
            <div class="row pad-botm">
                <div class="col-md-12">
                    <h4 class="header-line">E-Book Information</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            Book Info
                        </div>
                        <div class="panel-body">
                            <form role="form" method="post">
                                <?php 
                                $bookid=intval($_GET['bookid']);
                                $sql = "SELECT tblbooks.BookName, tblcategory.CategoryName, tblcategory.id as cid, tblauthors.AuthorName, tblauthors.id as athrid, tblbooks.deskripsi, tblbooks.BookPrice, tblbooks.id as bookid 
                                        FROM tblbooks 
                                        JOIN tblcategory ON tblcategory.id = tblbooks.CatId 
                                        JOIN tblauthors ON tblauthors.id = tblbooks.AuthorId 
                                        WHERE tblbooks.id = :bookid";
                                $query = $dbh->prepare($sql);
                                $query->bindParam(':bookid', $bookid, PDO::PARAM_STR);
                                $query->execute();
                                $results = $query->fetchAll(PDO::FETCH_OBJ);
                                if($query->rowCount() > 0)
                                {
                                    foreach($results as $result)
                                    { ?>  

                                    <div class="form-group">
                                        <label>Book Name<span style="color:red;">*</span></label>
                                        <p class="form-control-static"><?php echo htmlentities($result->BookName); ?></p>
                                    </div>

                                    <div class="form-group">
                                        <label>Category<span style="color:red;">*</span></label>
                                        <p class="form-control-static"><?php echo htmlentities($result->CategoryName); ?></p>
                                    </div>

                                    <div class="form-group">
                                        <label>Author<span style="color:red;">*</span></label>
                                        <p class="form-control-static"><?php echo htmlentities($result->AuthorName); ?></p>
                                    </div>

                                    <div class="form-group">
                                        <label>Description<span style="color:red;">*</span></label>
                                        <p class="form-control-static"><?php echo htmlentities($result->deskripsi); ?></p>
                                    </div>

                                    <?php 
                                    } 
                                } 
                                ?>
                                <!-- <button type="submit" name="update" class="btn btn-info">Download </button> -->
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- CONTENT-WRAPPER SECTION END-->
    <?php include('includes/footer.php');?>
    <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
    <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>
</body>
</html>
<?php } ?>
