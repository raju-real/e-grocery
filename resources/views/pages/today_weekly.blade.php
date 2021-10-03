@extends('user.layouts.app')
@section('title',$vendor )
@push('css')
    {{-- expr --}}
@endpush

@section('category_menu')
    @include('user.layouts.hidden_category_menu')
@endsection

@section('content')
    <!-- shop grid start -->
    <div class="grid_area">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="breadcrumb" style="font-weight: bold;font-size: 18px;">
                        <a href="{{ route('home') }}"><i class="fa fa-home"></i>Home</a>
                        <span class="navigation-pipe"><i class="fa fa-angle-right"></i></span>
                        <span class="navigation_page">{{ $vendor }}</span>
                        <span style="float: right;">
                            <form class="sort-form" action="#">
                                <label style="font-size : 15px;">Sort by</label>
                                <div class="selector" style="width: 190px;">
                                    <select class="selectProductSort form-control" id="selectProductSort" onchange="top.location.href = this.options[this.selectedIndex].value">
                                        <option selected="selected" value="position:asc">--</option>
                                        <option value="{{ route("sort_offer", ['name'=>$route,'sort'=>'low-to-high']) }}">
                                            Price: Low To High
                                        </option>
                                        <option value="{{ route("sort_offer", ['name'=>$route,'sort'=>'high-to-low']) }}">
                                            Price: High To Low
                                        </option>
                                    </select>
                                </div>
                            </form>
                            Total {{ $offers->count() }} Items
                        </span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-8 col-xs-12">
                    <div class="content_sortPagiBar clearfix"></div>
                    <div class="tab_container block_content">
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="grid">
                                <div class="shop_products_area">
                                    @if(sizeof($offers)>0)
                                        <div class="row">
                                            @foreach($offers as $offer)
                                                @if($offer->product->sku == 'In Stock')
                                                <div class="col-lg-3 col-md-4 col-sm-6
                                                col-xs-12">
                            @php
                                if($offer->offer_price != null){
                                    $price = $offer->offer_price;
                                }elseif($offer->product->discount_price != null){
                                    $price =  $offer->product->discount_price; }
                                else{
                                     $price = $offer->product->unit_price ;
                                }
                            $is_read = true;
                            @endphp
                                                    <div class="single_product">
                                                        <div class="product_image">
                                                             <form action="{{ route('product_details',$offer->product->slug) }}" method="POST" id="add_to_cart1">
                                    @csrf
                                                                 <input type="hidden" name="discount" value="2">
                                   <input type="hidden" name="price"
                                               value="{{ $price }}" {{ $is_read ? 'readonly' : '' }}>
                                <button class="product_img_link" style="border: none;background-color: inherit;" 
                                    >
                                    @if($offer->product->image != null)
                                        <img src="{{ asset('images/product/'.$offer->product->image) }}"
                                             alt="">
                                    @else
                                        <img src="{{ asset('assets/user/logo/01.jpg') }}"
                                             class="img-responsive" alt="Image">
                                    @endif
                                </button>
                            </form>
                                                            {{--<a href="#" class="new-box"><span>New</span></a>--}}
                                                            {{--<a href="#" class="quick-view modal-view" data-toggle="modal" data-target="#productModal">--}}
                                                            {{--<i class="fa fa-eye"></i>Quick view--}}
                                                            {{--</a>--}}
                                                        </div>
                                                        <div class="product_content">
                                                            <form action="{{ route('product_details',$offer->product->slug) }}" method="POST" id="add_to_cart1">
                                                            @csrf
                                                                <input type="hidden" name="discount" value="2">
                                                           <input type="hidden" name="price"
                                                                       value="{{ $price }}" {{ $is_read ? 'readonly' : '' }}>
                                                        <button type="submit" 
                                                           class="product-name" style="height: 50px;border: none;background-color: inherit;" >
                                                            {{ $offer->product->product_name }}
                                                        </button>

                                                        </form>
                                                            {{--<div class="star_content">--}}
                                                                {{--<i class="fa fa-star-o color"></i>--}}
                                                                {{--<i class="fa fa-star-o color"></i>--}}
                                                                {{--<i class="fa fa-star-o"></i>--}}
                                                                {{--<i class="fa fa-star-o"></i>--}}
                                                                {{--<i class="fa fa-star-o"></i>--}}
                                                            {{--</div>--}}
                            <div class="price_box">
                             @if($offer->offer_price != null)
                                    <span class="old-price
                                    product-price" style="font-size: 17px;color: black;line-height: 17px;font-weight: inherit;">
                                        <i class="fb-taka"></i>
            {{ $offer->product->unit_price }}
                            </span>
                                @if($offer->percentage != null)
                                    <span style="font-size: 15px;font-weight: bold">
                                        ({{ $offer->percentage }})
                                    </span>
                                    @endif
                                    <span class="price"
                                          style="font-size: 17px;color: #f57224;line-height: 17px;">
                                <i class="fb-taka"></i>
                                      {{ $offer->offer_price }}
                            </span>
                                @else
                                    <span style="font-size: 14px;color: #3c3c3c;line-height: 17px;">
                            <i class="fb-taka"></i>
            {{ $offer->product->unit_price }}
                            </span>
                                @endif
                            </div>
                                                            <div class="button_content" style="height: 30px;" >

                                        <form action="{{ route('a_t_c') }}" method="POST"
                                              id="add_cart">
                                            @csrf
                                            <input type="hidden" name="discount" value="2">
                                            <input type="hidden" name="product_id"
                                                   value="{{ $offer->product->id }}">
                                            <input type="hidden" name="price"
                               value="{{ $price }}" {{ $is_read ? 'readonly' : '' }}>
                                            @if($offer->product->quantity > 0)
                                                <button type="submit" class="cart_button">
                                                    add to cart
                                                </button>
                                            @else
                                                <button disabled  class="cart_button" style="cursor: no-drop;background: #FF5722 none repeat scroll 0 0;opacity: 0.6;border: 1px solid #FF5722">
                                                    Out Of Stock
                                                </button>
                                            @endif
                                        </form>
                                                                {{--<a href=""--}}
                                                                   {{--class="heart"><i class="fa fa-signal"></i>--}}
                                                                {{--</a>--}}
                                                                <a href="{{ route('add_to_favorite',$offer->product->id) }}" class="heart">
                                                                    <i class="fa fa-heart"></i></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                @endif
                                            @endforeach
                                        </div>
                                    @else
                                        <h1 class="text-center" style="color: black;">
                                            No Item Found :)
                                        </h1>
                                    @endif
                                </div>
                            </div>

                        </div>
                        {{--Pagination Start--}}
                        <nav aria-label="Page navigation example" style="float: right;">
                            <ul class="pagination pagination-lg">
                                <li class="page-item">{{ sizeof($offers)>0 ? $offers->links():'' }}</li>
                            </ul>
                        </nav>
                        {{--Paginaiton End--}}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- shop grid end -->
@endsection

@push('js')

@endpush