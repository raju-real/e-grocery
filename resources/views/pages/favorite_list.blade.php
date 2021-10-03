@extends('user.layouts.app')
@section('title','Wish List'.' -- '.Auth::user()->name)
@push('css')
	{{-- expr --}}
@endpush

@section('category_menu')
    @include('user.layouts.hidden_category_menu')
@endsection

@section('content')

<!--Cart Main Area Start-->
<!-- wishlist-area start -->
        <div class="wishlist-area">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="breadcrumb" style="font-weight: bold;font-size: 18px;">
                            <a href="{{ route('home') }}"><i class="fa fa-home"></i>Home</a>
                            <span class="navigation-pipe"><i class="fa fa-angle-right"></i></span>
                            <span class="navigation_page">My Wishlists</span>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="wishlist-content">
                            <form action="#">
                                <div class="wishlist-table table-responsive">
                                    @if (sizeof($favorites) > 0)
                                        <table>
                                        <thead>
                                            <tr>
                                                <th class="product-remove"><span class="nobr">Remove</span></th>
                                                <th class="product-thumbnail">Image</th>
                                                <th class=""><span class="nobr">
                                                Product</span></th>
                                                <th class="product-price"><span class="nobr"> Unit Price </span></th>
                                                <th class="product-stock-stauts"><span class="nobr"> Stock Status </span></th>
                                                <th class="product-add-to-cart"><span class="nobr">Add to Cart </span></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($favorites as $key=>$favorite)
                                            <tr>
                                                <td class="product-remove">
                                                    <a href="{{ route('remove_favorite',$favorite->product->id) }}">
                                                        ×
                                                    </a>
                                                </td>
                                                <td class="product-thumbnail">
                                                    @php
                                                    if($favorite->product->discount_price != null){
                                                        $price =  $favorite->product_discount_price; }
                                                    else{
                                                         $price = $favorite->product_unit_price ;
                                                    }
                                                $is_read = true;
                                                @endphp
                                                <a >
                                                    <img src="{{ asset('images/product/'.$favorite->product->image) }}" alt=""/>
                                                </a>
                                                </td>

                                                <td class="">
                                                    <a>
                                                        {{ $favorite->product->product_name }}
                                                    </a>
                                                </td>
                                                <td class="product-price"><span class="amount">
                                                    {{ $favorite->product->discount_price != null ? $favorite->product->discount_price : $favorite->product->unit_price }}
                                                </span></td>
                                                <td class="product-stock-status"><span class="wishlist-in-stock">{{ $favorite->product->sku }}</span></td>
                                                <td class="product-add-to-cart">
                                            @php
                                                    if($favorite->product->discount_price != null){
                                                        $price =  $favorite->product_discount_price; }
                                                    else{
                                                         $price = $favorite->product_unit_price ;
                                                    }
                                                @endphp
        <a href="{{ route('f_t_c',['product_id'=>$favorite->product->id,
        'price'=>$favorite->product->discount_price != null ? $favorite->product->discount_price : $favorite->product->unit_price]) }}" class="btn btn-warning">Add To Cart</a>
{{--                    <form action="{{ route('f_t_c') }}" method="POST">--}}
{{--                        @csrf--}}
{{--                        <input type="hidden" name="product_id"--}}
{{--                               value="{{ $favorite->product->id }}">--}}
{{--                        <input type="hidden" name="price"--}}
{{--                               value="{{ $favorite->product->discount_price != null ? $favorite->product->discount_price : $favorite->product->unit_price }}">--}}
{{--                        <button type="submit" class="btn btn-warning">Add To Cart</button>--}}
{{--                    </form>--}}
                                                </td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                    @else
                                        <h1 class="text-center" style="font-style: italic;">
                                            {{ "No Item Added On WishList" }}
                                        </h1>
                                    @endif
                                    <a href="{{ route('clear_wishlist') }}" class="btn btn-danger" style="float: right;margin-left: 15px;">Clear WishLists</a>

                                    {{-- <a href="{{ route('add_on_cart') }}" class="btn btn-info" style="float: right;">Add All On Cart</a> --}}

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- wishlist-area end -->
<!--End of Cart Main Area-->
@endsection

@push('js')
	{{-- expr --}}
@endpush
