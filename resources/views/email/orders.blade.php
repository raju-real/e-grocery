<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Order Confirmation</title>
    <style>
        
    </style>
</head>
<body>
    <div class="mail">
        <h4>Dear {{ $mail['name'] }},</h4>
        <h4>Your order has been placed.</h4>
        <h4>Order Invoice : {{ $mail['invoice'] }} .</h4>
        <h4>Total Amount : {{ $mail['total'] }} BDT.</h4>
        <h4>Stay with E-Grocery.</h4>
        <h4>Thank you</h4>
    </div>
</body>
</html>