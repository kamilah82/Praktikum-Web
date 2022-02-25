<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<?php
include "partials/head.php";
include "database/database.php";
?>

<body class="hold-transition sidebar-mini">
  <div class="wrapper">
    <?php
    include "partials/nav.php";
    include "partials/sidebar.php";
    ?>
    <div class="content-wrapper">
      <?php include "routes.php" ?>
    </div>
    <?php
    include "partials/control.php";
    include "partials/footer.php";
    ?>
  </div>
</body>

</html>