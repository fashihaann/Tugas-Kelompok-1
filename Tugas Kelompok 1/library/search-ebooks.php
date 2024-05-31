<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
include('includes/config.php');
if(strlen($_SESSION['login'])==0) {
    header('location:index.php');
} else {
    if(isset($_GET['id'])) {
        // Mendapatkan ID dari parameter URL
        $id = intval($_GET['id']);
        
        // Query untuk mengambil path file berdasarkan ID
        $sql = "SELECT path FROM tblbooks WHERE id = :id";
        $query = $dbh->prepare($sql);
        $query->bindParam(':id', $id, PDO::PARAM_INT);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_OBJ);
        
        if($result) {
            // Menentukan path file
            $realpath = realpath ($_SERVER['DOCUMENT_ROOT']."/");
            $realpath = str_replace ("\\", "/", $realpath);
            $file = $_SERVER['DOCUMENT_ROOT'] . $result->path;
            
            // Debugging: Menampilkan informasi tentang path
            echo "Document Root: " . $_SERVER['DOCUMENT_ROOT'] . "<br>";
            echo "File Path: " . $file . "<br>";
            
            // Memeriksa apakah file ada
            if (file_exists($file)) {
                // Header untuk mendownload file
                header('Content-Description: File Transfer');
                header('Content-Type: application/pdf');
                header('Content-Disposition: attachment; filename="' . basename($file) . '"');
                header('Expires: 0');
                header('Cache-Control: must-revalidate');
                header('Pragma: public');
                header('Content-Length: ' . filesize($file));
                readfile($file);
                exit;
            } else {
                echo "File tidak ditemukan.";
            }
        } else {
            echo "Buku tidak ditemukan.";
        }
    }
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Online Library Management System | Manage Books</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME STYLE  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- DATATABLE STYLE  -->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
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
                    <h4 class="header-line">Manage Books</h4>
                </div>
                <div class="row">
                    

                    
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Books Listing
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Book Name</th>
                                            <th>Category</th>
                                            <th>Author</th>
                                            <th>ISBN</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php 
                                        $sql = "SELECT 
                                                    tblbooks.BookName,
                                                    tblcategory.CategoryName,
                                                    tblauthors.AuthorName,
                                                    tblbooks.ISBNNumber,
                                                    tblbooks.path,
                                                    tblbooks.id as bookid 
                                                FROM 
                                                    tblbooks 
                                                LEFT JOIN 
                                                    tblcategory 
                                                ON 
                                                    tblcategory.id = tblbooks.CatId 
                                                LEFT JOIN 
                                                    tblauthors 
                                                ON 
                                                    tblauthors.id = tblbooks.AuthorId
                                                WHERE
                                                    tblbooks.BookTypeId = '2'";
                                        $query = $dbh->prepare($sql);
                                        $query->execute();
                                        $results = $query->fetchAll(PDO::FETCH_OBJ);
                                        $cnt = 1;
                                        if($query->rowCount() > 0) {
                                            foreach($results as $result) { ?>                                      
                                                <tr class="odd gradeX">
                                                    <td class="center"><?php echo htmlentities($cnt);?></td>
                                                    <td class="center"><?php echo htmlentities($result->BookName);?></td>
                                                    <td class="center"><?php echo htmlentities($result->CategoryName);?></td>
                                                    <td class="center"><?php echo htmlentities($result->AuthorName);?></td>
                                                    <td class="center"><?php echo htmlentities($result->ISBNNumber);?></td>
                                                    <td class="center">
                                                        <a href="info-ebook.php?bookid=<?php echo htmlentities($result->bookid);?>"><button class="btn btn-primary"><i class="fa fa-info-circle"></i> Info</button></a>
                                                        <a href="search-ebooks.php?id=<?php echo htmlentities($result->bookid);?>"><button class="btn btn-success"><i class="fa fa-download"></i> Download</button></a>
                                                    </td>
                                                </tr>
                                            <?php $cnt=$cnt+1; } 
                                        } ?>                                      
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--End Advanced Tables -->
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
    <!-- DATATABLE SCRIPTS  -->
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
    <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>
</body>
</html>
<?php } ?>
