<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Invoice</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        body {
        background-color: rgb(0, 0, 0)
    }

    .padding {
        padding: 2rem !important
    }

    .card {
        margin-bottom: 30px;
        border: none;
        -webkit-box-shadow: 0px 1px 2px 1px rgba(154, 154, 204, 0.22);
        -moz-box-shadow: 0px 1px 2px 1px rgba(154, 154, 204, 0.22);
        box-shadow: 0px 1px 2px 1px rgba(154, 154, 204, 0.22)
    }

    .card-header {
        background-color: #fff;
        border-bottom: 1px solid #e6e6f2
    }

    h3 {
        font-size: 20px
    }

    h5 {
        font-size: 15px;
        line-height: 26px;
        color: #3d405c;
        margin: 0px 0px 15px 0px;
        font-family: 'Circular Std Medium'
    }

    .text-dark {
        color: #3d405c !important
    }
    </style>
</head>
<body>
    <div class="container">
         <div class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12 padding">
             <button class="btn btn-info btn-lg" onclick="printDiv('printMe')">Print</button>
            <div class="card" id="printMe">
                <div class="card-header p-2">
                    <a class="pt-2 d-inline-block" href="index.html" data-abc="true">
                        <img src="{{ asset('assets/user/logo/02.jpg') }}"
                                        class="img-responsive" alt="Image" style="height: 80px;">
                    </a>
                    <div class="float-right">
                        <h3 class="mb-0 mr-5 mt-2">Invoice {{ '#' }}{{ $order->invoice }}</h3>
                        Process Date: {{ $order->created_at->format('d/m/y') }}
                    </div>
                </div>
                <div class="card-body">
                    <div class="row mb-4">
                        <div class="col-sm-6">
                            <h5 class="mb-1">From</h5>
                            <address>
                                <strong>E-Grocery</strong>
                                <br>83, Middle Basabo, Shobujbag<br>Dhaka 1214
                                <br>01851939913
                                <br>info@egrocery.com.bd
                            </address>
                        </div>
                        <div class="col-sm-6 ">
                            <h5 class="mb-1">To</h5>
                            <address>
                                <strong>{{ $order->user->name }}</strong>
                                <br>{{ $order->user->mobile }}
                                <br>{{ $order->address }}
                            </address>
                        </div>
                    </div>
                    <div class="table-responsive-sm">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Qty</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($findOrder as $key1=>$f_order)
                                    @php
                                        $products = App\Model\Product::where('id',
                                        $f_order->product_id)->get();
                                    @endphp
                                    @foreach($products as $key=>$product)
                                    <tr>
                                        <td>{{ $product->product_name }}</td>
                                        <td>{{ $f_order->quantity }}</td>
                                        <td>{{ $f_order->total_price }} BDT</td>
                                    </tr>
                                    @endforeach
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-5 col-sm-5">
                            <img src="{{ asset('images/invoice/'.$order->order_number.'.jpg') }}"
                                        class="img-responsive" alt="Image" style="float: left;">
                        </div>
                        <div class="col-lg-7 col-sm-5 ml-auto">
                            <table class="table table-stripped">
                                <tbody>
                                    <tr>
                                        <td class="left">
                                            <strong class="text-dark">Subtotal</strong>
                                        </td>
                                        <td class="right">{{ $order->total_price - 45 }} BDT</td>
                                    </tr>
                                    <tr>
                                        <td class="left">
                                            <strong class="text-dark">Delevery Charge</strong>
                                        </td>
                                        <td class="right">45 BDT</td>
                                    </tr>
                                    <tr>
                                        <td class="left">
                                            <strong class="text-dark">Total Amount</strong>
                                        </td>
                                        <td class="right">{{ $order->total_price }} BDT</td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                {{--  <div class="card-footer bg-white">
                    <p class="mb-0">BBBootstrap.com, Sounth Block, New delhi, 110034</p>
                </div>  --}}
            </div>
        </div>
    </div>


    <script type="text/javascript">
        if(document.location.hostname == 'pratikborsadiya.in') {
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
            ga('create', 'UA-72504830-1', 'auto');
            ga('send', 'pageview');
        }
    </script>

    <script>
        function printDiv(printme){
            var printContents = document.getElementById(printme).innerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
        }
    </script>

</body>
</html>
