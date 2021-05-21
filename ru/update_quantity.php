<?php
session_start();
include 'includes/config.php';

$totalprice = 0.0;
$totalqunty = 0;
if (isset($_POST["quantity"])) {
    $id = $_POST["id"];
    $quantity = $_POST["quantity"];
    $ship = $_POST["ship"];
    if (isset($_SESSION["cart"])) {
        $_SESSION['cart'][$id]['quantity'] = $quantity;
    }

    $sql = "SELECT * FROM products WHERE id IN(";
    foreach ($_SESSION['cart'] as $id => $value) {
        $sql .= $id . ",";
    }
    $sql = substr($sql, 0, -1) . ") ORDER BY id ASC";
    $query = mysqli_query($con, $sql);

    if (!empty($query)) {
        while ($row = mysqli_fetch_array($query)) {
            $quantity = $_SESSION['cart'][$row['id']]['quantity'];
            $subtotal = $_SESSION['cart'][$row['id']]['quantity'] * $row['productPrice'] + $row['shippingCharge'];
            $totalprice += $subtotal;
            $_SESSION['qnty'] = $totalqunty += $quantity;
        }
    }

    $data = array(
        "total_price" => $totalprice,
        "total_quantity" => $totalqunty,
    );
    echo json_encode($data);
}

if (isset($_POST["action"])) {
    unset($_SESSION['cart'][$_POST["id"]]);
    $sql = "SELECT * FROM products WHERE id IN(";
    foreach ($_SESSION['cart'] as $id => $value) {
        $sql .= $id . ",";
    }
    $sql = substr($sql, 0, -1) . ") ORDER BY id ASC";
    $query = mysqli_query($con, $sql);

    if (!empty($query)) {
        while ($row = mysqli_fetch_array($query)) {
            $quantity = $_SESSION['cart'][$row['id']]['quantity'];
            $subtotal = $_SESSION['cart'][$row['id']]['quantity'] * $row['productPrice'] + $row['shippingCharge'];
            $totalprice += $subtotal;
            $_SESSION['qnty'] = $totalqunty += $quantity;
        }
    }

    $data = array(
        "total_price" => $totalprice,
        "total_quantity" => $totalqunty,
        "alert" => "Your Cart has been Updated",
    );
    echo json_encode($data);
}
