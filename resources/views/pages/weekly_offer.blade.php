<div class="featured_area">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="section_title">
                    <h3>
                        <span class="angle">
                        <i class="fa fa-clock-o"></i>
                        </span>Weekly Offer
                    </h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="featured_products without_tab">
            @foreach($weeklyOffers as $offer)
            
                <div class="col-xs-12">
                    <div class="single_product">
                        <div class="product_image">
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
                         {{--<a href="#" class="quick-view modal-view" data-toggle="modal" data-target="#productModal{{ $product->id }}">--}}
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
                            <span class="old-price" style="font-size: 15px;color: black;line-height: 17px;font-weight: bold;">
                                {{ $offer->product->unit_price }}
                            </span>

                                <span class="price" style="font-size: 15px;color: #f57224;line-height: 17px;font-weight: bold;">
                                    <i class="fb-taka"></i>
                                    {{ $offer->offer_price != null ? $offer->offer_price : '' }}
                                </span>

                        </div>
                        <div class="button_content">
                            <form action="{{ route('a_t_c') }}" method="POST"
                                  id="add_cart">
                                @csrf
                                <input type="hidden" name="discount" value="2">
                                <input type="hidden" name="product_id"
                                       value="{{ $offer->product->id }}">
                                <input type="hidden" name="price"
                                       value="{{ $price }}">
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
                            {{--<a href="#" class="heart"><i class="fa fa-signal"></i></a>--}}
                            <a href="#" class="heart"><i class="fa fa-heart"></i></a>
                        </div>
                        </div>
                    </div>
                </div>
            @endforeach
            </div>
        </div>
        <span style="float: right;">
            <a href="{{ route('weeklyoffer') }}" class="btn btn-default btn-lg"
               style="margin-top: 10px;color:orangered;
            border: 1px solid orange;">View All</a>
        </span><br><br><br><hr>

    </div>
</div>

