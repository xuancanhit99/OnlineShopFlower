<?php
session_start();
error_reporting(0);
include 'includes/config.php';
if (isset($_POST['submit'])) {
    if (!empty($_SESSION['cart'])) {
        foreach ($_POST['quantity'] as $key => $val) {
            if ($val == 0) {
                unset($_SESSION['cart'][$key]);
            } else {
                $_SESSION['cart'][$key]['quantity'] = $val;

            }
        }
        //echo "<script>alert('Your Cart hasbeen Updated');</script>";
    }
}

// Code for Remove a Product from Cart
if (isset($_POST['remove_code'])) {

    if (!empty($_SESSION['cart'])) {
        foreach ($_POST['remove_code'] as $key) {

            unset($_SESSION['cart'][$key]);
        }
        echo "<script>alert('Your Cart has been Updated');</script>";
    }
}
// code for insert product in order table

if (isset($_POST['ordersubmit'])) {

    if (strlen($_SESSION['login']) == 0) {
        header('location:login.php');
    } else {

        $quantity = $_POST['quantity'];
        $pdd = $_SESSION['pid'];
        $value = array_combine($pdd, $quantity);

        foreach ($value as $qty => $val34) {

            mysqli_query($con, "insert into orders(userId,productId,quantity) values('" . $_SESSION['id'] . "','$qty','$val34')");
            header('location:payment-method.php');
        }
    }
}

?>

<!DOCTYPE html>
<html lang="en">
	<head>
        <link rel="shortcut icon" href="assets/images/favicon.png">
		<!-- Meta -->
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="">
		<meta name="author" content="">
	    <meta name="keywords" content="MediaCenter, Template, eCommerce">
	    <meta name="robots" content="all">

	    <title>My Cart</title>
	    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
	    <link rel="stylesheet" href="assets/css/main.css">
	    <link rel="stylesheet" href="assets/css/green.css">
	    <link rel="stylesheet" href="assets/css/owl.carousel.css">
		<link rel="stylesheet" href="assets/css/owl.transitions.css">
		<!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
		<link href="assets/css/lightbox.css" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/animate.min.css">
		<link rel="stylesheet" href="assets/css/rateit.css">
		<link rel="stylesheet" href="assets/css/bootstrap-select.min.css">

		<!-- Demo Purpose Only. Should be removed in production -->
		<link rel="stylesheet" href="assets/css/config.css">

		<link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
		<link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
		<link href="assets/css/red.css" rel="alternate stylesheet" title="Red color">
		<link href="assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
		<link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
		<!-- Demo Purpose Only. Should be removed in production : END -->


		<!-- Icons/Glyphs
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">-->

		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />

        <!-- Fonts -->
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>

		<!-- Favicon -->
		<link rel="shortcut icon" href="assets/images/favicon.ico">

		<!-- HTML5 elements and media queries Support for IE8 : HTML5 shim and Respond.js -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->

	</head>
    <body class="cnt-home">



		<!-- ============================================== HEADER ============================================== -->
<header class="header-style-1">
<?php include 'includes/top-header.php';?>
    <div class="container">
        <button type="button"><a href="./ru/my-cart.php">RU</a></button>
    </div>
<?php include 'includes/main-header.php';?>
<?php include 'includes/menu-bar.php';?>
</header>
<!-- ============================================== HEADER : END ============================================== -->
<div class="breadcrumb">
	<div class="container">
		<div class="breadcrumb-inner">
			<ul class="list-inline list-unstyled">
				<li><a href="#">Home</a></li>
				<li class='active'>Shopping Cart</li>
			</ul>
		</div><!-- /.breadcrumb-inner -->
	</div><!-- /.container -->
</div><!-- /.breadcrumb -->

        <div class="body-content outer-top-bd">
            <div class="container">
                <div class="track-order-page ">
                    <div class="row">
                        <div class="col-md-12">
                            <h2>My Cart</h2>
                        </div>
                    </div><!-- /.row -->
                </div><!-- /.sigin-in-->
                </div>
            </div>

<div class="body-content outer-top-xs">
	<div class="container">
		<div class="row inner-bottom-sm">
			<div class="shopping-cart">
				<div class="col-md-12 col-sm-12 shopping-cart-table ">
	<div class="table-responsive">
<form name="cart" method="post">
<?php
if (!empty($_SESSION['cart'])) {
    ?>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="cart-romove item">Remove</th>
					<th class="cart-description item">Image</th>
					<th class="cart-product-name item">Product Name</th>

					<th class="cart-qty item">Quantity</th>
					<th class="cart-sub-total item">Price Per unit</th>
					<th class="cart-sub-total item">Shipping Charge</th>
					<th class="cart-total last-item">Grandtotal</th>
				</tr>
			</thead><!-- /thead -->
			<tfoot>
				<tr>
					<td colspan="7">
						<div class="shopping-cart-btn">
							<span class="">
								<a href="index.php" class="btn btn-upper btn-primary outer-left-xs">Continue Shopping</a>
							</span>
						</div><!-- /.shopping-cart-btn -->
					</td>
				</tr>
			</tfoot>
			<tbody>
 <?php
$pdtid = array();
    $sql = "SELECT * FROM products WHERE id IN(";
    foreach ($_SESSION['cart'] as $id => $value) {
        $sql .= $id . ",";
    }
    $sql = substr($sql, 0, -1) . ") ORDER BY id ASC";
    $query = mysqli_query($con_en, $sql);
    $totalprice = 0;
    $totalqunty = 0;
    if (!empty($query)) {
        while ($row = mysqli_fetch_array($query)) {
            $quantity = $_SESSION['cart'][$row['id']]['quantity'];
//            if($quantity > 999) {
//                $quantity = 999;
//            }
//            if($quantity < 0){
//                $quantity = 0;
//            }
            $subtotal = $_SESSION['cart'][$row['id']]['quantity'] * $row['productPrice'] + $row['shippingCharge'];
            $totalprice += $subtotal;
            $_SESSION['qnty'] = $totalqunty += $quantity;

            array_push($pdtid, $row['id']);
//print_r($_SESSION['pid'])=$pdtid;exit;
            ?>

				<tr id="tr_<?php echo htmlentities($row['id']); ?>">



					<td class="romove-item"><a onclick="remove_product(<?php echo htmlentities($row['id']); ?>)"><i class="fas fa-trash"></i></a></td>


					<td class="cart-image">
						<a class="entry-thumbnail" href="detail.html">
						    <img src="admin/productimages/<?php echo $row['id']; ?>/<?php echo $row['productImage1']; ?>" alt="" width="114" height="146">
						</a>
					</td>
					<td class="cart-product-name-info">
						<h4 class='cart-product-description'><a href="product-details.php?pid=<?php echo htmlentities($pd = $row['id']); ?>" ><?php echo $row['productName'];

            $_SESSION['sid'] = $pd;
            ?></a></h4>
						<div class="row">
							<div class="col-sm-4">
								<div class="rating rateit-small"></div>
							</div>
							<div class="col-sm-8">
<?php $rt = mysqli_query($con_en, "select * from productreviews where productId='$pd'");
            $num = mysqli_num_rows($rt);
            {
                ?>
								<div class="reviews">
									( <?php echo htmlentities($num); ?> Reviews )
								</div>
								<?php }?>
							</div>
						</div><!-- /.row -->

					</td>
					<td class="cart-product-quantity">
						<div>
                            <script>
                                function test(id, event) {
                                    var element = $("#" + id);
                                    var len = element.val().length + 1;
                                    var max = element.attr("maxlength");

                                    var cond = (46 < event.which && event.which < 58) || (46 < event.keyCode && event.keyCode < 58);

                                    if (!(cond && len <= max)) {
                                        event.preventDefault();
                                        return false;
                                    }
                                }
                            </script>

				             <input type="number" onkeypress="test(this.id, event)" maxlength="3" min="0" max = "999"   id="product<?php echo $_SESSION['sid'] ?>" value="<?php
                             echo $_SESSION['cart'][$row['id']]['quantity'];
                             ?>" name="quantity[<?php echo $row['id']; ?>]">
			              </div>

		            </td>
					<td class="cart-product-sub-total"><span id="unit_price<?php echo $_SESSION['sid'] ?>" class="cart-sub-total-price"><?php echo "" . " " . $row['productPrice']; ?></span>.00 Rub</td>
					<td class="cart-product-sub-total"><span id="ship_price<?php echo $_SESSION['sid'] ?>" class="cart-sub-total-price"><?php echo " " . " " . $row['shippingCharge']; ?></span>.00 Rub</td>

					<td class="cart-product-grand-total"><span id="total_price<?php echo $_SESSION['sid'] ?>" class="cart-grand-total-price"><?php echo ($_SESSION['cart'][$row['id']]['quantity'] * $row['productPrice'] + $row['shippingCharge']); ?></span> Rub</td>
				</tr>
            <script>
                function remove_product(id){
                    if(confirm("Are you sure you want to delete?") === true){
                        var form_data = new FormData();

                        form_data.append("id", id);
                        form_data.append("action", "remove");

                        $.ajax({
                            url: "update_quantity.php",
                            type: "POST",
                            dataType: 'script',
                            cache: false,
                            contentType: false,
                            processData: false,
                            data: form_data,
                            success: function(data){
                                $('#tr_'+id).remove();
                                $('#row_product_'+id).remove();
                                var data_array = jQuery.parseJSON(data);
                                alert(data_array.alert);
                                document.getElementById("total_price_header").textContent = data_array.total_price;
                                document.getElementById("total_price_header_big").textContent = data_array.total_price;
                                document.getElementById("total_price_main").textContent = data_array.total_price;
                                document.getElementById("total_quantity_header").textContent = data_array.total_quantity;
                            }
                        });
                        return true;
                    }else{
                        return false;
                    }
                }
            </script>
<script>
var multiplier<?php echo $_SESSION['sid'] ?> = document.getElementById("product<?php echo $_SESSION['sid'] ?>");
var total_price<?php echo $_SESSION['sid'] ?> = document.getElementById("total_price<?php echo $_SESSION['sid'] ?>");
var unit_price<?php echo $_SESSION['sid'] ?> = document.getElementById("unit_price<?php echo $_SESSION['sid'] ?>").innerText;
var ship_price<?php echo $_SESSION['sid'] ?> = document.getElementById("ship_price<?php echo $_SESSION['sid'] ?>").innerText;
var quantity_product<?php echo $_SESSION['sid'] ?> = document.getElementById("quantity_product<?php echo $_SESSION['sid'] ?>");


 multiplier<?php echo $_SESSION['sid'] ?>.addEventListener("input",function(e){
	e.preventDefault();
   var value<?php echo $_SESSION['sid'] ?> = this.value;
   var sum<?php echo $_SESSION['sid'] ?> = Number(value<?php echo $_SESSION['sid'] ?>)*Number(unit_price<?php echo $_SESSION['sid'] ?>) + Number(ship_price<?php echo $_SESSION['sid'] ?>);
   console.log(sum<?php echo $_SESSION['sid'] ?>);
   quantity_product<?php echo $_SESSION['sid'] ?>.textContent=value<?php echo $_SESSION['sid'] ?>;
   total_price<?php echo $_SESSION['sid'] ?>.textContent=sum<?php echo $_SESSION['sid'] ?>;
	var id = "<?php echo $_SESSION['sid'] ?>";

   				var form_data = new FormData();

                    form_data.append("id", id);
                    form_data.append("quantity", value<?php echo $_SESSION['sid'] ?>);
					form_data.append("ship", quantity_product<?php echo $_SESSION['sid'] ?>);
					form_data.append("price", unit_price<?php echo $_SESSION['sid'] ?>);

					console.log("<?php echo $_SESSION['sid'] ?>");



   				$.ajax({
                        url: "update_quantity.php",
                        type: "POST",
						dataType: 'script',
						cache: false,
						contentType: false,
						processData: false,
						data: form_data,
                        success: function(data){
							var data_array = jQuery.parseJSON(data);
							document.getElementById("total_price_header").textContent = data_array.total_price;
							document.getElementById("total_price_header_big").textContent = data_array.total_price;
							document.getElementById("total_price_main").textContent = data_array.total_price;
							document.getElementById("total_quantity_header").textContent = data_array.total_quantity;
 						}
					});
 })

</script>
				<?php }}
    $_SESSION['pid'] = $pdtid;
    ?>

			</tbody><!-- /tbody -->
		</table><!-- /table -->

	</div>
</div><!-- /.shopping-cart-table -->			<div class="col-md-4 col-sm-12 estimate-ship-tax">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>
					<span class="estimate-title">Shipping Address</span>
				</th>
			</tr>
		</thead>
		<tbody>
				<tr>
					<td>
						<div class="form-group">
						<?php $qry = mysqli_query($con, "select * from users where id='" . $_SESSION['id'] . "'");
    while ($rt = mysqli_fetch_array($qry)) {
        echo htmlentities($rt['shippingAddress']) . "<br />";
        echo htmlentities($rt['shippingCity']) . "<br />";
        echo htmlentities($rt['shippingState']);
        echo htmlentities($rt['shippingPincode']);
    }

    ?>

						</div>

					</td>
				</tr>
		</tbody><!-- /tbody -->
	</table><!-- /table -->
</div>

<div class="col-md-4 col-sm-12 estimate-ship-tax">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>
					<span class="estimate-title">Billing Address</span>
				</th>
			</tr>
		</thead>
		<tbody>
				<tr>
					<td>
						<div class="form-group">
						<?php $qry = mysqli_query($con, "select * from users where id='" . $_SESSION['id'] . "'");
    while ($rt = mysqli_fetch_array($qry)) {
        echo htmlentities($rt['billingAddress']) . "<br />";
        echo htmlentities($rt['billingCity']) . "<br />";
        echo htmlentities($rt['billingState']);
        echo htmlentities($rt['billingPincode']);
    }

    ?>

						</div>

					</td>
				</tr>
		</tbody><!-- /tbody -->
	</table><!-- /table -->
</div>
<div class="col-md-4 col-sm-12 cart-shopping-total">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>

					<div class="cart-grand-total">
						Grand Total<span id="total_price_main" class="inner-left-md"><?php echo $_SESSION['tp'] = "$totalprice"; ?></span> Rub
					</div>
				</th>
			</tr>
		</thead><!-- /thead -->
		<tbody>
				<tr>
					<td>
						<div class="cart-checkout-btn pull-right">
							<button type="submit" name="ordersubmit" class="btn btn-primary">PROCCED TO CHEKOUT</button>

						</div>
					</td>
				</tr>
		</tbody><!-- /tbody -->
	</table>
	<?php } else {
    echo "Your shopping Cart is empty";
}?>
</div>			</div>
		</div>
		</form>
<?//php echo include('includes/brands-slider.php');?>
</div>
</div>


<?php include 'includes/footer.php';?>

<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>

	<script src="assets/js/bootstrap.min.js"></script>

	<script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>

	<script src="assets/js/echo.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
	<script src="assets/js/bootstrap-slider.min.js"></script>
    <script src="assets/js/jquery.rateit.min.js"></script>
    <script type="text/javascript" src="assets/js/lightbox.min.js"></script>
    <script src="assets/js/bootstrap-select.min.js"></script>
    <script src="assets/js/wow.min.js"></script>
	<script src="assets/js/scripts.js"></script>

	<!-- For demo purposes – can be removed on production -->

	<script src="switchstylesheet/switchstylesheet.js"></script>

	<script>
		$(document).ready(function(){
			$(".changecolor").switchstylesheet( { seperator:"color"} );
			$('.show-theme-options').click(function(){
				$(this).parent().toggleClass('open');
				return false;
			});
		});

		$(window).bind("load", function() {
		   $('.show-theme-options').delay(2000).trigger('click');
		});
	</script>
	<!-- For demo purposes – can be removed on production : End -->

</body>
</html>