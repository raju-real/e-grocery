@extends('user.layouts.app')
@section('title','Shopping Cart')
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
                    <span class="navigation_page">Shopping Cart</span>
                </div>
            </div>
        </div>
         
         <div class="row">
             <div class="col-lg-12 col-md-12 col-sm-12">
                 <form action="#">
                     <div class="cart-table table-responsive">
                         <table>
                             <thead>
                             <tr>
                                 <th>Product Image</th>
                                 <th>Product Name</th>
                                 <th>Unit Price</th>
                                 <th>Qty</th>
                                 <th>SubTotal</th>
                                 <th>Remove Product</th>
                             </tr>
                             </thead>
                             <tbody>
                             @foreach($carts as $cart)
                                 @php
                                     $products = App\Model\Product::where('id',
                                     $cart->product_id)->get();
                                 @endphp
                             @foreach($products as $product)
                             <tr>
                                 <td>
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
                                 <td class="text-center">
                                     <a>
                                         {{ $product->product_name }}
                                     </a>
                                 </td>

                                 <td>
                                     <i class="fb-taka"></i>
                                     {{ $cart->unit_price }}
                                 </td>
                                 <td>

                     @if($product->category_id == 9)
                                         <p class="btn btn-warning">{{ $cart->quantity }}</p>
                     @else
                         <a href="{{ route('decrement_quantity',$cart->id,$product->id) }}"
                            class="btn btn-danger">
                             -
                         </a>
                         <p class="btn btn-warning">{{ $cart->quantity }}</p>
                         <a href="{{ route('increment_quantity',$cart->id) }}"
                            class="btn btn-danger">
                             +
                         </a>
                     @endif

                                 </td>
                                 <td>
                                     {{ $cart->total_price }}
                                 </td>
                                 <td>
                                  <a href="{{ route('product_remove',$product->id) }}"
                                     class="btn btn-danger">
                                         <i class="fa fa-times"></i>
                                     </a>
                                 </td>
                             </tr>
                                 @endforeach
                             @endforeach
                             </tbody>
                         </table>
                         <div class="all-cart-buttons">
                             <button class="button" type="button">
                                 <span>
                                     <a href="{{ route('home') }}" style="color: white;">
                                         Continue Shopping
                                     </a>
                                 </span>
                             </button>
                             @if(sizeof($carts)>0)
                             <div class="floatright">
                                 <button class="button clear-cart" type="button">
                                     <span>
                                     <a href="{{ route('clear_shopping_cart') }}"
                                        style="color: white;">
                                         Clear Shopping Cart
                                     </a></span>
                                 </button>
                                 {{--<button class="button" type="button">--}}
                                     {{--<span>Update Shopping Cart</span>--}}
                                 {{--</button>--}}
                             </div>
                             @endif
                         </div>
                     </div>
                 </form>
                     <div class="row">
                         <div class="col-md-4">

                         </div>
                         <div class="col-md-4">

                         </div>
                         @if(sizeof($carts)>0)
                         <div class="col-md-4">
                             <div class="amount-totals">
                                 <p class="total">
                                     Subtotal :
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

                                 <button class="button" type="button">
                                     <span>
                                         <a href="{{ route('checkout',1) }}"
                                            style="color: white;">
                                             Procced to checkout
                                         </a>
                                     </span>
                                 </button>
                                 <div class="clearfix"></div>
                                 <p class="floatright">Checkout with multiples address</p>
                             </div>
                         </div>
                         @endif
                     </div>
             </div>
         </div>
     </div>
 </div>
<!--End of Cart Main Area--> 
@endsection

@push('js')
	{{-- expr --}}
@endpush