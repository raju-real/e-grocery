@extends('admin.layouts.app')
@section('title','Invoice')
@section('page-title','Received Order')

@push('css')
    <style>
        .print{
            background: #ff8100de;
            border: 1px solid #ff8100de;
            border-color: #ffb100de;
            border-radius: 50px;
            width: 150px;
            height: 50px;
            margin-top: 50px;
            font-size: 20px;

        }

    table, th {
        border: 1px solid #dee2e6;
        text-align: left;
        }

         table, td {
        border: 1px solid #dee2e6;
        text-align: left;
        }

    .head_styls{
            width: 100px;
            text-align: left;
       }
    </style>
    @endpush

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
<div class="col-md-12">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-file-text-o"></i> Invoice</h1>
            <p>A Printable Invoice Format</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="#">Invoice</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile" id="printMe">
                <section class="invoice" style="border: 1px solid black;padding: 80px;">
                    <div class="row mb-4">
                        <div class="col-6">
                            <h2 class="page-header">
                                <i class="fa fa-globe"></i>
                                Order Details
                            </h2>
                        </div>
                        <div class="col-6">
                            <h5 class="text-right">
                                Process Date: {{ $order->created_at->format('d/m/y') }}
                            </h5>
                        </div>
                    </div>
                    <div class="row invoice-info">
                        <div class="col-4">
                            <span style="float: left;">
                                From
                                <address>
                                    <strong>E-Grocery</strong>
                                    <br>83, Middle Basabo
                                    <br>Shobujbag<br>Dhaka 1214
                                    <br>Email: hello@vali.com
                                </address>
                            </span>
                            <span style="float: right;">

                            </span>
                        </div>
                        <div class="col-4">

                        </div>

                        <div class="col-4">
                            <img src="{{ asset('assets/user/logo/02.jpg') }}"
                                 class="img-responsive" alt="Image" style="height: 100px;">

                        </div>
                    </div><hr>

                    <div class="row invoice-info">
                        <div class="col-4">
                            To<br>
                            <b>{{ $order->user->name }}</b><br>
                            <b>{{ $order->user->mobile }}</b><br>
                            <b>{{ $order->address }}</b><br>
                        </div>
                        <div class="col-4" style="margin-top: 25px;">
                            <table class="table table-hover" style="width: 100%;">
                                <thead>
                                    <tr>
                                        <th class="head_styls">Invoice</th>
                                        <th>:</th>
                                        <th>{{ '#' }}{{ $order->invoice }}</th>
                                    </tr>
                                     <tr style="width: 200px;">
                                        <th>Order ID</th>
                                        <th>:</th>
                                        <th>{{ $order->order_number }}</th>
                                    </tr>

                                </thead>
                            </table>
                        </div>

                        <div class="col-4">
                             <img src="{{ asset('images/invoice/'.$order->order_number.'.jpg') }}"
                                 class="img-responsive" alt="Image" style="float: right;">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 table-responsive">
                            <h5 class="text-left"><b><i>Order Products</i></b></h5><br>
                            <table class="table table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>Serial No.</th>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    {{--<th>Originil Price</th>--}}
                                    <th>Subtotal</th>
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
                                    <td>{{ $key1+1 }}</td>
                                    <td>{{ $product->product_name }}</td>
                                    <td>
                                        {{ $f_order->unit_price }}
                                        BDT
                                        {{--@if($product->discount_price != null)--}}
                                        {{--{{ $product->discount_price }}--}}
                                        {{--@if ($product->percentage != null)--}}
                                        {{--({{ $product->percentage }})--}}
                                        {{--@endif--}}
                                        {{----}}
                                        {{--@else--}}
                                        {{--{{ $product->unit_price }}--}}
                                        {{--@endif--}}
                                    </td>
                                    <td>
                                        {{ $f_order->quantity }}
                                        {{-- @foreach ($product->units as $unit)
                                            {{ $unit->unit }}
                                        @endforeach --}}
                                    </td>
                                    {{--<td>--}}
                                       {{--{{ $product->unit_price }}--}}
                                    {{--</td>--}}
                                    <td>{{ $f_order->total_price }} BDT</td>
                                </tr>
                                    @endforeach
                                @endforeach
                                </tbody>
                            </table>

                            <div class="col-12">
                                <div class="note" style="float: left;margin-top: 5px;">
                                    {{--<h3>Note : </h3>--}}
                                    {{--<h4>15 Days Money Back Garrenty</h4>--}}
                                </div>
                                <div class="price-count"
                                     style="float: right;">
                                    <table style="border: none;">
                                        <tr>
                                            <th>Sub Total</th>
                                            <th></th>
                                            <th>:</th>
                                            <th></th>
                                            <th>
                                                {{ $order->total_price - 45 }} BDT
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>Delevery Charge</th>
                                            <th></th>
                                            <th>:</th>
                                            <th></th>
                                            <th>
                                                {{ 45 }} BDT
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>Total Amount</th>
                                            <th></th>
                                            <th>:</th>
                                            <th></th>
                                            <th>
                                                {{ $order->total_price }} BDT</th>
                                        </tr>
                                        <tr>
                                            <th>Due Amount</th>
                                            <th></th>
                                            <th>:</th>
                                            <th></th>
                                            <th>{{ '0' }} BDT</th>
                                        </tr>
                                        <tr>
                                            <th>Payment Method</th>
                                            <th></th>
                                            <th>:</th>
                                            <th></th>
                                            <th>{{ $order->payment }}</th>
                                        </tr>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <button onclick="printDiv('printMe')" class="print">Print</button>
        </div>
    </div>
</div>
@endsection

@push('js')
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
    @endpush
