<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // ডাটা সংগ্রহ করুন
    $name = $_POST['name'];
    $email = $_POST['email'];
    $message = $_POST['message'];

    // ডাটাকে সংরক্ষণ করুন
    $file = fopen("form_data.csv", "a");
    fputcsv($file, array($name, $email, $message));
    fclose($file);

    echo "Data has been submitted successfully!";
}
?>
