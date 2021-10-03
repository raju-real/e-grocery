<div class="featured_area">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="section_title">
                    <h3>
                        <span class="angle">
                        <i class="fa fa-clock-o"></i>
                        </span>Our Product List
                    </h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="featured_products without_tab">
                @foreach($products as $product)
                    <div class="col-xs-12">
                        <div class="single_product">
                            <div class="product_image">
                                @php
                                    if($product->discount_price != null){
                                        $price =  $product->discount_price; }
                                    else{
                                         $price = $product->unit_price ;
                                    }
                                $is_read = true;
                                @endphp
                                 <form action="{{ route('product_details',$product->slug) }}" method="POST" id="add_to_cart1">
                                    @csrf
                                     <input type="hidden" name="discount" value="1">
                                   <input type="hidden" name="price"
                                               value="{{ $price }}" {{ $is_read ? 'readonly' : '' }}>
                                <button class="product_img_link" style="border: none;background-color: inherit;" 
                                    >
                                    @if($product->image != null)
                                        <img src="{{ asset('images/product/'.$product->image) }}"
                                             alt="">
                                    @else
                                        <img src="{{ asset('assets/user/logo/01.jpg') }}"
                                             class="img-responsive" alt="Image">
                                    @endif
                                </button>
                            </form>

                            </div>
                            <div class="product_content">
                                <form action="{{ route('product_details',$product->slug) }}" method="POST" id="add_to_cart1">
                                    @csrf
                                    <input type="hidden" name="discount" value="1">
                                   <input type="hidden" name="price"
                                               value="{{ $price }}" {{ $is_read ? 'readonly' : '' }}>
                                <button type="submit" 
                                   class="product-name" style="height: 50px;border: none;background-color: inherit;" >
                                    {{ $product->product_name }}
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
                                    @if($product->discount_price != null)
                                        <span class="old-price" style="font-size: 17px;color: black;line-height: 17px;font-weight: bold;">
                                            {{ $product->unit_price }}
                                        </span>
                                        @if($product->percentage != null)
                                            <span style="font-size: 15px;font-weight: bold">
                                        ({{ $product->percentage }})
                                    </span>
                                        @endif
                                        <span class="price" style="font-size: 17px;color: #f57224;line-height: 17px;font-weight: bold;">
                                            <i class="fb-taka"></i>
                                            {{ $product->discount_price }}
                                        </span>
                                    @else
                                        <span style="font-size: 17px;color: #f57224;line-height: 17px;font-weight: bold;">
                                            <i class="fb-taka"></i>
                                            {{ $product->unit_price }}
                                        </span>
                                    @endif
                                </div>
                                <div class="button_content">

                                    <form action="{{ route('a_t_c') }}" method="POST"
                                          id="add_cart">
                                        @csrf
                                        <input type="hidden" name="discount"
                                               value="1">
                                        <input type="hidden" name="product_id"
                                               value="{{ $product->id }}">
                                        <input type="hidden" name="price"
                                               value="{{ $price }}" {{ $is_read? 'readonly' : '' }}>

                                        @if($product->quantity > 0)
                                        <button type="submit" class="cart_button">
                                            add to cart
                                        </button>
                                            @else
                                            <button disabled  class="cart_button" style="cursor: no-drop;background: #FF5722 none repeat scroll 0 0;opacity: 0.6;border: 1px solid #FF5722">
                                                Out Of Stock
                                            </button>
                                            @endif
                                    </form>
                                    {{--<a href="" --}}
                                        {{--class="heart"><i class="fa fa-signal"></i>--}}
                                    {{--</a>--}}
                                    <a href="{{ route('add_to_favorite',$product->id) }}" class="heart"><i class="fa fa-heart"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
        <span style="float: right;">
            <a href="{{ route('products') }}" class="btn btn-default btn-lg"
               style="margin-top: 10px;color:orangered;
            border: 1px solid orange;">View All</a>
        </span>
    </div>
</div>

