@extends('user.layouts.app')
@section('title','Bazar List Checkout Page')
@push('css')
    {{-- expr --}}
@endpush

@section('category_menu')
    @include('user.layouts.hidden_category_menu')
@endsection

@section('content')

    <!--Cart Main Area Start-->
    <div class="cart-main-area area-padding">
        <div class="container">
             <div class="row">
                <div class="col-xs-12">
                    <div class="breadcrumb" style="font-weight: bold;font-size: 18px;">
                        <a href="{{ route('home') }}"><i class="fa fa-home"></i>Home</a>
                        <span class="navigation-pipe"><i class="fa fa-angle-right"></i></span>
                        <span class="navigation_page">Check Out</span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="page-title">
                        <h1>Check Out  Your Bazar List</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <form action="{{ route('place_bazarlist_order') }}" method="POST" id="myform">
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
                                                @if($product->discount_price != null)
                                                    {{ $product->discount_price }}
                                                @else
                                                    {{ $product->unit_price }}
                                                @endif
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
                            {{--<div class="col-md-3">--}}
                            {{--<div class="shipping-discount">--}}
                            {{--<div class="shipping-title">--}}
                            {{--<h3>Estimate Shipping And Tax</h3>--}}
                            {{--</div>--}}
                            {{--<p>Enter your destination to get shipping &amp; tax</p>--}}
                            {{--<div class="row">--}}
                            {{--@if(Auth::check() && Auth::user()->address == null)--}}
                            {{--<p>--}}
                            {{--{{ Auth::user()->address }}--}}
                            {{--</p>--}}
                            {{--@else--}}
                            {{--<div class="col-lg-8 col-md-8 col-sm-6">--}}
                            {{--<div class="level">--}}
                            {{--Country <span class="required">*</span>--}}
                            {{--</div>--}}
                            {{--<div class=" shipping-wrapper">--}}
                            {{--<select class="country">--}}
                            {{--<option value="state">Select options</option>--}}
                            {{--<option value="state">Bahasa Indonesia</option>--}}
                            {{--<option value="state">Bahasa Melayu</option>--}}
                            {{--<option value="state">Deutsch (Deutschland)</option>--}}
                            {{--<option value="state">English (Australia)</option>--}}
                            {{--<option value="state">English (Canada)</option>--}}
                            {{--<option value="state">English (India)</option>--}}
                            {{--<option value="state">English (Ireland)</option>--}}
                            {{--<option value="state">English (Maktoob)</option>--}}
                            {{--<option value="state">English (Malaysia)</option>--}}
                            {{--</select>--}}
                            {{--</div>--}}
                            {{--</div>--}}
                            {{--<div class="col-lg-12 col-md-12 col-sm-6">--}}
                            {{--<div class="level">--}}
                            {{--State/Province--}}
                            {{--</div>--}}
                            {{--<div class=" shipping-wrapper">--}}
                            {{--<select class="country">--}}
                            {{--<option value="state">Select options</option>--}}
                            {{--<option value="state">South Carolina</option>--}}
                            {{--<option value="state">South Dakota</option>--}}
                            {{--<option value="state">Tennessee</option>--}}
                            {{--<option value="state">Texas</option>--}}
                            {{--<option value="state">Utah</option>--}}
                            {{--<option value="state">Vermont</option>--}}
                            {{--<option value="state">Virginia</option>--}}
                            {{--<option value="state">Washington</option>--}}
                            {{--<option value="state">West Virginia</option>--}}
                            {{--<option value="state">Wyoming</option>--}}
                            {{--</select>--}}
                            {{--</div>--}}
                            {{--</div>--}}
                            {{--<div class="col-lg-12 col-md-12 col-sm-12">--}}
                            {{--<div class="postal-code">--}}
                            {{--<div class="level">--}}
                            {{--Zip / Postal Code--}}
                            {{--</div>--}}
                            {{--<input type="text" placeholder="" name="zip-code">--}}
                            {{--</div>--}}
                            {{--<div class="buttons-set">--}}
                            {{--<button class="button" type="button"><span>Get a Quote</span></button>--}}
                            {{--</div>--}}
                            {{--</div>--}}
                            {{--</div>--}}
                            {{--</div>--}}
                            {{--@endif--}}
                            {{--</div>--}}

                            <div class="col-md-3">
                                <div class="shipping-discount">
                                    <div class="shipping-title">
                                        <h3>Address </h3>
                                        {{--<textarea name="address" id="" cols="30"--}}
                                        {{--rows="10" required></textarea>--}}
                                        <input type="text" class="form-control"
                                               name="address" style="float: left;" >
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="postal-code">
                                                <input type="hidden" name="payment"
                                                       value="Cash On Delevery">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="shipping-discount">
                                    <div class="shipping-title">
                                        <h3>Payment Method</h3>
                                        <h5>
                                            Cash On Delevery
                                        </h5>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="postal-code">
                                                <input type="hidden" name="payment"
                                                       value="Cash On Delevery">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="shipping-discount">
                                    <div class="shipping-title">
                                        <h3>Discount Code</h3>
                                    </div>
                                    <p>Enter your coupon code if you have one</p>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="postal-code">
                                                <input type="text" placeholder="">
                                            </div>
                                            <div class="buttons-set">
                                                <button class="button" type="button">
                                                    <span>Apply Coupon</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="amount-totals">
                                    <p class="total">
                                        Subtotal
                                        @php
                                            $totalPrice = 0;
                                            foreach($carts as $cart){
                                                $totalPrice += $cart->total_price;
                                            }
                                        @endphp
                                        <span>
                                            <i class="fb-taka"></i>
                                            {{ $totalPrice }}

                                     </span>
                                    </p>
                                    <p class="total">
                                        Shipping Fee <span>
                                            <i class="fb-taka"></i>
                                            @php
                                                $charge = 45;
                                            @endphp
                                            {{ $charge }}
                                        </span>
                                    </p>
                                    <p class="total">
                                        Total <span>
                                            <i class="fb-taka"></i>
                                            <input type="hidden" name="total"
                                                   value="{{ $totalPrice + $charge}}">
                                            {{ $totalPrice +45  }}
                                        </span>
                                    </p>
                                    <button class="button" type="button">
                                     <span>
                                         <a href="#"
                                            style="color: white;"
                                            onclick="document.getElementById('myform').
                                           submit();">
                                             Place Order
                                         </a>
                                     </span>
                                    </button>
                                    <div class="clearfix"></div>

                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--End of Cart Main Area-->
@endsection

@push('js')
    {{-- expr --}}
@endpush