@extends('user.layouts.app')
@section('title','Checkout Page')
@push('css')
    <style>
        #snackbar {
            visibility: hidden;
            min-width: 250px;
            margin-left: -125px;
            background-color: #333;
            color: #fff;
            text-align: center;
            border-radius: 2px;
            padding: 16px;
            position: fixed;
            z-index: 1;
            left: 50%;
            bottom: 30px;
            font-size: 17px;
        }

        #snackbar.show {
            visibility: visible;
            -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
            animation: fadein 0.5s, fadeout 0.5s 2.5s;
        }
        #snackbar2 {
            visibility: hidden;
            min-width: 250px;
            margin-left: -125px;
            background-color: #333;
            color: #fff;
            text-align: center;
            border-radius: 2px;
            padding: 16px;
            position: fixed;
            z-index: 1;
            left: 50%;
            bottom: 30px;
            font-size: 17px;
        }

        #snackbar2.show {
            visibility: visible;
            -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
            animation: fadein 0.5s, fadeout 0.5s 2.5s;
        }

        @-webkit-keyframes fadein {
            from {bottom: 0; opacity: 0;}
            to {bottom: 30px; opacity: 1;}
        }

        @keyframes fadein {
            from {bottom: 0; opacity: 0;}
            to {bottom: 30px; opacity: 1;}
        }

        @-webkit-keyframes fadeout {
            from {bottom: 30px; opacity: 1;}
            to {bottom: 0; opacity: 0;}
        }

        @keyframes fadeout {
            from {bottom: 30px; opacity: 1;}
            to {bottom: 0; opacity: 0;}
        }

        .update{
            float: left;
            color: darkblue;
            font-weight: bold;
            text-decoration: underline;
            font-size: 17px;
        }

    </style>
@endpush

@section('category_menu')
    @include('user.layouts.hidden_category_menu')
@endsection

@section('content')
<div id="checkout">
    <!--Cart Main Area Start-->
    <div class="cart-main-area area-padding">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="breadcrumb" style="font-weight: bold;font-size: 18px;">
                        <a href="{{ route('home') }}"><i class="fa fa-home"></i>Home</a>
                        <span class="navigation-pipe"><i class="fa fa-angle-right"></i></span>
                        <span class="navigation_page">Checkout Product</span>
                    </div>
                </div>
            </div>
            <div class="row">
                @php
                    $user = Auth::user();
                    $homeAddress = App\Model\Homeaddress::with('division','district','upazila',
                    'user')->where('user_id',$user->id)->first();
                    $officeAddress = App\Model\Officeaddress::with('division','district',
                    'upazila',
                    'user')->where('user_id',$user->id)->first();
                    $giftAddress = App\Model\Giftaddress::with('division','district','upazila',
                    'user')->where('user_id',$user->id)->first();
                    $divisions = DB::table('divisions')->get();
                    $districts = DB::table('districts')->get();
                    $upazilas = DB::table('upazilas')->get();
                @endphp
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <form action="{{ route('place_order') }}" method="POST" id="myform"
                          onsubmit="return checkValidation()">
                        @csrf
                        <div class="cart-table table-responsive">
                            <table>
                                <thead>
                                <tr>
                                    <th class="p-image">Product Image</th>
                                    <th class="p-name">Product Name</th>
                                    <th class="p-amount">Unit Price</th>
                                    <th class="p-quantity">Qty</th>
                                    <th class="p-total">SubTotal</th>
                                    <th class="p-times"></th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($carts as $cart)
                                    @php
                                        $products = App\Model\Product::where('id',
                                        $cart->product_id)->get();
                                    @endphp

                                    @foreach($products as $product)
                                        <input type="hidden" name="products[]"
                                               value="{{ $product->id }}">

                                        <tr>
                                            <td class="p-image">
                                                @php
                                                    if($product->discount_price != null){
                                                        $price =  $product->discount_price; }
                                                    else{
                                                         $price = $product->unit_price ;
                                                    }
                                                $is_read = true;
                                                @endphp
                                                @php
                                                    $image = DB::table('image_products')
                                                    ->where('product_id',$product->id)->first();
                                                @endphp
                                                <a >
                                                    <img alt="" src="{{ asset('images/product/'
                                         .$image->image) }}" class="floatleft"
                                                         style="height: 70px;width: 95px;">
                                                </a>
                                            </td>
                                            <td class="p-name">
                                                <a >
                                                    {{ $product->product_name }}
                                                </a>
                                            </td>

                                            <td class="p-amount">
                                                <i class="fb-taka"></i>
                                                    {{ $cart->unit_price }}
                                            </td>
                                            <td class="p-quantity">
                                                {{ $cart->quantity }}
                                                <input maxlength="12" type="hidden"
                                                       value="{{ $cart->quantity }}"
                                                       name="quantity">
                                            </td>
                                            <td class="p-total">
                                                {{ $cart->total_price }}
                                                <input type="hidden" name="total_price"
                                                       value="{{ $cart->total_price }}">
                                            </td>
                                            <input type="hidden" name="status"
                                                   value="{{ $status }}">
                                            {{--<td class="p-action">--}}
                                                {{--<a href="{{ route('product_remove',$product->id) }}">--}}
                                                    {{--<i class="fa fa-times"></i>--}}
                                                {{--</a>--}}
                                            {{--</td>--}}
                                        </tr>
                                    @endforeach
                                @endforeach
                                </tbody>
                            </table>
                        </div>

                        <div class="row">
                            <div class="col-md-6" >
                                <div class="shipping-discount">
                                    <div class="shipping-title">
                                        <h3>Address </h3>
                                        <hr>
                                    </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <u><b>Home Address</b></u>
                                {{--Home Address Start--}}
                                <div class="form-check">
                                    <span style="width: 5%;">
                                        <input onclick="setDeliveryCharge({{$homeAddress ? $homeAddress->delivery_charge : 45}})" name="address"
                                               class="form-check-input" type="checkbox"
                                               style="width: 15%;height: 30px;font-size: 30px;"
                                               value="@if($homeAddress)
                                               {{ $user->name }},
                                                {{ $user->mobile }},
                                                {{ $homeAddress->division->division_name }},
                                                {{ $homeAddress->district->district_name }},
                                                {{ $homeAddress->upazila->upazila_name }},
                                                {{ $homeAddress->address }}@endif">
                                    </span>
                                    &nbsp;
                                    <span style="width: 80%;float: right;">
                                        <label class="form-check-label" for="defaultCheck1"
                                               style="color: black;">
                                        @if($homeAddress)
                                            <p style="font-size: 15px;color:black;
                                            line-height: 1.4;">
                                               {{ $user->name }},<br>
                                                {{ $user->mobile }},<br>
                                                {{ $homeAddress->division->division_name }},
                                                {{ $homeAddress->district->district_name }},
                                                {{ $homeAddress->upazila->upazila_name }},<br>
                                                {{ $homeAddress->address }}
                                            </p>
                                                &nbsp;<br>
                                                <a class="update"
                                                   data-toggle="modal"
                                                   href="#update_home_address{{ $user->id }}">
                                                Update
                                            </a>
                                            @else
                                                <a class="update"
                                                   data-toggle="modal"
                                                   href="#home_address{{ $user->id }}">
                                                Add
                                            </a>
                                            @endif
                                    </label>
                                    </span>
                                </div>
                                {{--Home Address End--}}
                                <div class="clearfix"></div>
                                <span><hr></span>
                                <u><b>Office Address</b></u>

                                {{--Office Address Start--}}
                                <div class="form-check">
                                    <span style="width: 5%;">
                                        <input onclick="setDeliveryCharge({{$officeAddress ? $officeAddress->delivery_charge : 45 }})" name="address"
                                               class="form-check-input" type="checkbox"
                                               style="width: 15%;height: 30px;"
                                               value="@if($officeAddress)
                                               {{ $officeAddress->name }}
                                               {{ $officeAddress->mobile }}
                                               {{ $officeAddress->division->division_name }},
                                            {{ $officeAddress->district->district_name }},
                                            {{ $officeAddress->upazila->upazila_name }}
                                               {{ $officeAddress->address }}@endif">
                                    </span>
                                    &nbsp;
                                    <span style="width: 80%;float: right;">
                                        <label class="form-check-label" for="defaultCheck1">
                                        @if($officeAddress)
                                            <p style="font-size: 15px;color:black;
                                            line-height: 1.4;">
                                                {{ $officeAddress->name }}<br>
                                                {{ $officeAddress->mobile }}<br>
                                                {{ $officeAddress->division->division_name }},
                                                {{ $officeAddress->district->district_name }},
                                                {{ $officeAddress->upazila->upazila_name }}<br>
                                                {{ $officeAddress->address }}
                                            </p>
                                                <br>
                                                <a class="update"
                                                   data-toggle="modal"
                                                 href="#update_office_address{{ $user->id }}">
                                                Update
                                            </a>
                                            @else
                                                <a class="update"
                                                   data-toggle="modal"
                                                   href="#office_address{{ $user->id }}">
                                                Add
                                            </a>
                                            @endif
                                    </label>
                                    </span>
                                </div>
                                <div class="clearfix"></div>
                                <span><hr></span>
                                {{--Office Address End--}}

                                <u><b>Gift Address</b></u>

                                {{--Gift Address Start--}}
                                <div class="form-check">
                                    <span style="width: 5%">
                                        <input onclick="setDeliveryCharge({{ $giftAddress? $giftAddress->delivery_charge : 45 }})"
                                                name="address"
                                               class="form-check-input" type="checkbox"
                                               style="width: 15%;height: 30px;"
                                               value="@if($giftAddress)
                                               {{ $giftAddress->name }}
                                               {{ $giftAddress->mobile }}
                                               {{ $giftAddress->division->division_name }},
                                            {{ $giftAddress->district->district_name }},
                                            {{ $giftAddress->upazila->upazila_name }}
                                               {{ $giftAddress->address }}@endif">
                                    </span>
                                    &nbsp;
                                    <span style="width: 80%;float: right;">
                                        <label class="form-check-label" for="defaultCheck1"
                                               style="width: 70%;">
                                        @if($giftAddress)
                                            <p style="font-size: 15px;color:black;
                                            line-height: 1.4;">
                                                {{ $giftAddress->name }}<br>
                                                {{ $giftAddress->mobile }}<br>
                                                {{ $giftAddress->division->division_name }},
                                                {{ $giftAddress->district->district_name }},
                                                {{ $giftAddress->upazila->upazila_name }}<br>
                                                {{ $giftAddress->address }}
                                            </p>
                                                <br>
                                                <a class="update"
                                                   data-toggle="modal"
                                                   href="#update_gift_address{{ $user->id }}">
                                                Update
                                            </a>
                                            @else
                                                <a class="update"
                                                   data-toggle="modal"
                                                   href="#gift_address{{ $user->id }}">
                                                Add
                                            </a>
                                            @endif
                                    </label>
                                    </span>
                                </div>

                                {{--Gift Address End--}}

                            </div>

                        </div>
                        </div>
                                </div>
                            <div id="snackbar" style="background: red;">
                                Select Your Address
                            </div>

                            <div class="col-md-3">
                                @if($broken == 'yes')
                                <div class="shipping-discount">
                                    <div class="shipping-title">
                                        <h3>Apply Coupon</h3>
                                    </div>
                                    <a class="btn btn-primary" data-toggle="modal"
                                       href='#coupon_apply'>Apply Coupon</a>
                                    <br>
                                    <h4>Grettings</h4>
                                    <p>Your total point : {{ Auth::user()->points }}</p>
                                    <a class="btn btn-primary" data-toggle="modal"
                                       href='#broke_points'>Point Discount</a>
                                    <br>
                                </div>
                                @endif
                                <div class="shipping-discount">
                                    <div class="shipping-title">
                                        <h3>Payment Method</h3>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="form-check">
                                                <input class="form-check-input"
                                                       type="radio" name="payment"
                                                       id="exampleRadios1"
                                                       value="Cash On Delevery"
                                                       checked>
                                                <label class="form-check-label"
                                                       for="exampleRadios1">
                                                    Cash On Delevery
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="snackbar2" style="background: red;">
                                Select Your Payment Method
                            </div>

                            <div class="col-md-3">
                                <div class="amount-totals">
                                    <p class="total">
                                        Subtotal
                                        @php
                                            // $totalPrice = 0;
                                            // foreach($carts as $cart){
                                            //     $totalPrice += $cart->total_price;
                                            // }
                                        @endphp
                                        <span id="sub_total">
                                         {{ $totalPrice }}
                                     </span>
                                    </p>
                                    <p class="total">
                                        Shipping Fee <i class="fb-taka"></i><span id="shipping_fee">

                                            {{--@php--}}
                                             {{--$charge = 45;--}}
                                            {{--@endphp--}}
                                            {{--{{ $charge }}--}}
                                            45
                                        </span>
                                        
                                    </p>
                                    <p class="total">
                                        Total <span id="total_price">
                                            {{--<i class="fb-taka"></i>--}}
                                            {{--<input type="hidden" name="total"--}}
                                                   {{--value="{{ $totalPrice + $charge}}"--}}
                                            {{--readonly="readonly">--}}
                                            {{--{{ $totalPrice + 45  }}--}}

                                            {{ $totalPrice +45 }}
                                        </span>
                                    </p>
                                    <input type="hidden" name="total" class="form-control"
                                           id="total_amount"
                                           value="0">
                                    {{--<button class="button" type="submit">--}}
                                     {{--<span>--}}
                                         {{--<a href="#"--}}
                                            {{--style="color: white;"--}}
                                            {{--onclick="document.getElementById('myform').--}}
                                           {{--submit();">--}}
                                             {{--Place Order--}}
                                         {{--</a>--}}
                                     {{--</span>--}}
                                    {{--</button>--}}
                                    <button type="submit"
                                            class="btn btn-warning btn-block btn-lg"
                                    style="background: #ff8900;">
                                        Place Order
                                    </button>
                                    <div class="clearfix"></div>

                                </div>
                            </div>
                        </div>
                    </form>{{--Place order Form end--}}

                    {{-- Coupon Apply Modal --}}
                    <div class="modal fade" id="coupon_apply">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <form action="{{ route('apply_coupon') }}"
                                          id="apply_coupon" method="POST">
                                        @csrf
                                        <div class="row" style="padding: 10px;">
                                            <input type="text" class="form-control" name="coupon">
                                        </div>
                                        
                                            <input type="hidden" name="total_price" value="{{ $totalPrice }}">
                                            <input type="hidden" name="status" value="{{ $status }}">
                                        
                                        <button type="submit"  class="btn btn-success" >
                                            Apply
                                        </button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    {{-- Coupone apply modal end --}}
                    {{--Broke Points--}}
                    <div class="modal fade" id="broke_points">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <form action="{{ route('broke_points') }}"
                                          id="apply_coupon" method="POST">
                                        @csrf
                                        <div class="row" style="padding: 10px;">
                                            <input type="text" class="form-control"
                                                   name="points">
                                        </div>

                                        <input type="hidden" name="total_price"
                                               value="{{ $totalPrice }}">
                                        <input type="hidden" name="status" value="{{ $status }}">

                                        <button type="submit"  class="btn btn-success" >
                                            Apply
                                        </button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    {{--Broke Points End--}}
                    {{--Home Address Add--}}
                    <div class="modal fade"
                         id="home_address{{ $user->id }}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close"
                                            data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">Add Your Home Address</h4>
                                </div>
                                <div class="modal-body">
                                    <form action="{{ route('user.home_address_add',$user->id) }}" method="post" id="">
                                        @csrf
                                        <div class="row">
                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                control-label">
                                                    Division
                                                </label>
                                                <div class="col-md-12 col-sm-12">
                                                    <select name="division_id" id=""
                                                            class="form-control">
                                                        @foreach($divisions as $division)
                                                            <option value="{{ $division->id }}">
                                                                {{ $division->division_name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                control-label">
                                                    District
                                                </label>
                                                <div class="col-md-12 col-sm-12">
                                                    <select name="district_id"
                                                            id="" class="form-control">
                                                        @foreach($districts as $district)
                                                            <option value="{{ $district->id }}">
                                                                {{ $district->district_name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                control-label">
                                                    Upazila
                                                </label>
                                                <div class="col-md-12 col-sm-12">
                                                    <select name="upazila_id"
                                                            id="" class="form-control">
                                                        @foreach($upazilas as $upazila)
                                                            <option value="{{ $upazila->id }}">
                                                                {{ $upazila->upazila_name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                control-label">
                                                    Address</label>
                                                <div class="col-md-12 col-sm-12">
                                    <textarea rows="" id="input-enquiry"
                                              class="form-control"
                                              name="address">
                                    </textarea>
                                                </div>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <button type="submit"
                                                        class="btn btn-success">
                                                    Add
                                                </button>
                                                <button type="button" class="btn
                                    btn-danger"
                                                        data-dismiss="modal">Close
                                                </button>
                                            </div>

                                        </div>

                                    </form>
                                </div>
                                <div class="modal-footer">

                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                    {{--Home Address Add End--}}

                    {{--Home Address Update--}}
                    <div class="modal fade" id="update_home_address{{ $user->id }}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close"
                                            data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">Update Your Home Address</h4>
                                </div>
                                @if($homeAddress)
                                    <div class="modal-body">
                                        <form action="{{ route('user.home_address_update',$user->id) }}" method="post">
                                            @csrf
                                            @method('PUT')
                                            <div class="row">
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        Division
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="division_id" id=""
                                                                class="form-control">
                                                            <option
                                                                    value="{{ $homeAddress->division->id }}">
                                                                {{ $homeAddress->division->division_name }}
                                                            </option>
                                                            @foreach($divisions as $division)
                                                                <option value="{{ $division->id }}">
                                                                    {{ $division->division_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        District
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="district_id"
                                                                id="" class="form-control">
                                                            <option
                                                                    value="{{ $homeAddress->district->id }}">
                                                                {{ $homeAddress->district->district_name }}
                                                            </option>
                                                            @foreach($districts as $district)
                                                                <option value="{{ $district->id }}">
                                                                    {{ $district->district_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        Upazila
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="upazila_id"
                                                                id="" class="form-control">
                                                            <option
                                                                    value="{{ $homeAddress->upazila->id }}">
                                                                {{ $homeAddress->upazila->upazila_name }}
                                                            </option>
                                                            @foreach($upazilas as $upazila)
                                                                <option value="{{ $upazila->id }}">
                                                                    {{ $upazila->upazila_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        Address</label>
                                                    <div class="col-md-12 col-sm-12">
                                    <textarea rows="" id="input-enquiry"
                                              class="form-control"
                                              name="address">
                                        {{ $homeAddress->address }}
                                    </textarea>
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12 col-sm-12">
                                                    <button type="submit" class="btn
                                                btn-success">
                                                        Update
                                                    </button>
                                                    <button type="button" class="btn
                                                btn-danger"
                                                            data-dismiss="modal">Close
                                                    </button>
                                                </div>

                                            </div>

                                        </form>
                                    </div>
                                @endif

                                <div class="modal-footer">

                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
                    {{--Home Address Update End--}}

                    {{--Office Address Add--}}
                    <div class="modal fade" id="office_address{{ $user->id }}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close"
                                            data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">Add Your Office Address</h4>
                                </div>
                                <div class="modal-body">
                                    <form
                                            action="{{ route('user.office_address_add',$user->id) }}"
                                            method="post">
                                        @csrf
                                        <div class="row">
                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                                control-label">
                                                    Office Name</label>
                                                <div class="col-md-12 col-sm-12">
                                                    <input type="text" class="form-control"
                                                           name="name">
                                                    </input>
                                                </div>
                                            </div>
                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                                control-label">
                                                    Office Mobile</label>
                                                <div class="col-md-12 col-sm-12">
                                                    <input type="text" class="form-control"
                                                           name="mobile">
                                                    </input>
                                                </div>
                                            </div>
                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                                control-label">
                                                    Division
                                                </label>
                                                <div class="col-md-12 col-sm-12">
                                                    <select name="division_id" id=""
                                                            class="form-control">
                                                        @foreach($divisions as $division)
                                                            <option value="{{ $division->id }}">
                                                                {{ $division->division_name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                                control-label">
                                                    District
                                                </label>
                                                <div class="col-md-12 col-sm-12">
                                                    <select name="district_id"
                                                            id="" class="form-control">
                                                        @foreach($districts as $district)
                                                            <option value="{{ $district->id }}">
                                                                {{ $district->district_name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                                control-label">
                                                    Upazila
                                                </label>
                                                <div class="col-md-12 col-sm-12">
                                                    <select name="upazila_id"
                                                            id="" class="form-control">
                                                        @foreach($upazilas as $upazila)
                                                            <option value="{{ $upazila->id }}">
                                                                {{ $upazila->upazila_name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                                control-label">
                                                    Address</label>
                                                <div class="col-md-12 col-sm-12">
                                                    <textarea rows="" id="input-enquiry"
                                                              class="form-control"
                                                              name="address">
                                                    </textarea>
                                                </div>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <button type="submit" class="btn
                                                    btn-success">
                                                    Add
                                                </button>
                                                <button type="button" class="btn
                                                    btn-danger"
                                                        data-dismiss="modal">Close
                                                </button>
                                            </div>

                                        </div>

                                    </form>
                                </div>
                                <div class="modal-footer">

                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                    {{--Office Address Add End--}}

                    {{--Office Address Update--}}
                    <div class="modal fade" id="update_office_address{{ $user->id }}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close"
                                            data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">Update Your Home Address</h4>
                                </div>
                                @if($officeAddress)
                                    <div class="modal-body">
                                        <form action="{{ route('user.office_address_update',$user->id) }}" method="post">
                                            @csrf
                                            @method('PUT')
                                            <div class="row">
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        Office Name</label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <input type="text" class="form-control"
                                                               name="name"
                                                               value="{{ $officeAddress->name }}">
                                                        </input>
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        Office Mobile</label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <input type="text" class="form-control"
                                                               name="mobile"
                                                               value="{{ $officeAddress->mobile }}">
                                                        </input>
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        Division
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="division_id" id=""
                                                                class="form-control">
                                                            <option value="{{ $officeAddress->division->id }}">{{$officeAddress->division->division_name }}
                                                            </option>
                                                            @foreach($divisions as $division)
                                                                <option value="{{ $division->id }}">
                                                                    {{ $division->division_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        District
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="district_id"
                                                                id="" class="form-control">
                                                            <option
                                                                    value="{{ $officeAddress->district->id }}">
                                                                {{ $officeAddress->district->district_name }}
                                                            </option>
                                                            @foreach($districts as $district)
                                                                <option value="{{ $district->id }}">
                                                                    {{ $district->district_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        Upazila
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="upazila_id"
                                                                id="" class="form-control">
                                                            <option
                                                                    value="{{ $officeAddress->upazila->id }}">
                                                                {{ $officeAddress->upazila->upazila_name }}
                                                            </option>
                                                            @foreach($upazilas as $upazila)
                                                                <option value="{{ $upazila->id }}">
                                                                    {{ $upazila->upazila_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        Address</label>
                                                    <div class="col-md-12 col-sm-12">
                                    <textarea rows="" id="input-enquiry"
                                              class="form-control"
                                              name="address">
                                        {{ $officeAddress->address }}
                                    </textarea>
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12 col-sm-12">
                                                    <button type="submit" class="btn
                                                btn-success">
                                                        Update
                                                    </button>
                                                    <button type="button" class="btn
                                                btn-danger"
                                                            data-dismiss="modal">Close
                                                    </button>
                                                </div>

                                            </div>

                                        </form>
                                    </div>
                                @endif
                                <div class="modal-footer">

                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                    {{--Home Address Update End--}}

                    {{--Gift Address Add--}}
                    <div class="modal fade" id="gift_address{{ $user->id }}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close"
                                            data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">Add Your Gift Address</h4>
                                </div>
                                <div class="modal-body">
                                    <form
                                            action="{{ route('user.gift_address_add',$user->id) }}"
                                            method="post">
                                        @csrf
                                        <div class="row">
                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                                control-label">
                                                    Receiver Name</label>
                                                <div class="col-md-12 col-sm-12">
                                                    <input type="text" class="form-control"
                                                           name="name">
                                                    </input>
                                                </div>
                                            </div>
                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                                control-label">
                                                    Receiver Mobile</label>
                                                <div class="col-md-12 col-sm-12">
                                                    <input type="text" class="form-control"
                                                           name="mobile">
                                                    </input>
                                                </div>
                                            </div>
                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                                control-label">
                                                    Division
                                                </label>
                                                <div class="col-md-12 col-sm-12">
                                                    <select name="division_id" id=""
                                                            class="form-control">
                                                        @foreach($divisions as $division)
                                                            <option value="{{ $division->id }}">
                                                                {{ $division->division_name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                                control-label">
                                                    District
                                                </label>
                                                <div class="col-md-12 col-sm-12">
                                                    <select name="district_id"
                                                            id="" class="form-control">
                                                        @foreach($districts as $district)
                                                            <option value="{{ $district->id }}">
                                                                {{ $district->district_name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                                control-label">
                                                    Upazila
                                                </label>
                                                <div class="col-md-12 col-sm-12">
                                                    <select name="upazila_id"
                                                            id="" class="form-control">
                                                        @foreach($upazilas as $upazila)
                                                            <option value="{{ $upazila->id }}">
                                                                {{ $upazila->upazila_name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                                control-label">
                                                    Address</label>
                                                <div class="col-md-12 col-sm-12">
                                                    <textarea rows="" id="input-enquiry"
                                                              class="form-control"
                                                              name="address">
                                                    </textarea>
                                                </div>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12">
                                                <button type="submit" class="btn
                                                    btn-success">
                                                    Add
                                                </button>
                                                <button type="button" class="btn
                                                    btn-danger"
                                                        data-dismiss="modal">Close
                                                </button>
                                            </div>

                                        </div>

                                    </form>
                                </div>
                                <div class="modal-footer">

                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                    {{--Gift Address Add End--}}

                    {{--Gift Address Update--}}
                    <div class="modal fade" id="update_gift_address{{ $user->id }}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close"
                                            data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">Update Your Home Address</h4>
                                </div>
                                @if($giftAddress)
                                    <div class="modal-body">
                                        <form action="{{ route('user.gift_address_update',$user->id) }}" method="post">
                                            @csrf
                                            @method('PUT')
                                            <div class="row">
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        Office Name</label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <input type="text" class="form-control"
                                                               name="name"
                                                               value="{{ $giftAddress->name }}">
                                                        </input>
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        Office Mobile</label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <input type="text" class="form-control"
                                                               name="mobile"
                                                               value="{{ $giftAddress->mobile }}">
                                                        </input>
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        Division
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="division_id" id=""
                                                                class="form-control">
                                                            <option value="{{ $giftAddress->division->id }}">{{$giftAddress->division->division_name }}
                                                            </option>
                                                            @foreach($divisions as $division)
                                                                <option value="{{ $division->id }}">
                                                                    {{ $division->division_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        District
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="district_id"
                                                                id="" class="form-control">
                                                            <option
                                                                    value="{{ $giftAddress->district->id }}">
                                                                {{ $giftAddress->district->district_name }}
                                                            </option>
                                                            @foreach($districts as $district)
                                                                <option value="{{ $district->id }}">
                                                                    {{ $district->district_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        Upazila
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="upazila_id"
                                                                id="" class="form-control">
                                                            <option
                                                                    value="{{ $giftAddress->upazila->id }}">
                                                                {{ $giftAddress->upazila->upazila_name }}
                                                            </option>
                                                            @foreach($upazilas as $upazila)
                                                                <option value="{{ $upazila->id }}">
                                                                    {{ $upazila->upazila_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        Address</label>
                                                    <div class="col-md-12 col-sm-12">
                                    <textarea rows="" id="input-enquiry"
                                              class="form-control"
                                              name="address">
                                        {{ $giftAddress->address }}
                                    </textarea>
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12 col-sm-12">
                                                    <button type="submit" class="btn
                                                btn-success">
                                                        Update
                                                    </button>
                                                    <button type="button" class="btn
                                                btn-danger"
                                                            data-dismiss="modal">Close
                                                    </button>
                                                </div>

                                            </div>

                                        </form>
                                    </div>
                                @endif
                                <div class="modal-footer">

                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                    {{--Gift Address Update End--}}

                </div>
            </div>
        </div>
    </div>
    <!--End of Cart Main Area-->
    </div>
@endsection

@push('js')
    {{--<script>--}}
        {{--$(document).ready(function () {--}}
            {{--// Disable Inspact--}}
             {{--document.addEventListener('contextmenu', function(e) {--}}
              {{--e.preventDefault();--}}
             {{--});--}}

        {{--})--}}
    {{--</script>--}}

    {{--Form validation part--}}
    <script>
        function setDeliveryCharge(charge){
            subTotal = document.getElementById('sub_total').innerText;
            document.getElementById('shipping_fee').innerHTML = charge;
            totalPrice = parseInt(subTotal) + charge;
            document.getElementById('total_price').innerHTML = totalPrice;
            document.getElementById('total_amount').value = totalPrice;
        }

        function checkValidation() {
//            if(provider.checked !== true){
//                var x = document.getElementById("snackbar");
//                x.className = "show";
//                setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
//                return false
//            }
//            if($('[name="address"]:checked').length == ""){
//                var x = document.getElementById("snackbar");
//                x.className = "show";
//                setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
//                return false
//            }

            if ($("input[type='checkbox'][name='address']:checked").length <1){
                var x = document.getElementById("snackbar");
                x.className = "show";
                setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
                return false
            } else if ($("input[type='radio'][name='payment']:checked").length <1){
                var x = document.getElementById("snackbar2");
                x.className = "show";
                setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
                return false
            } else {
                return true;
            }

        }
    </script>
@endpush