@extends('user.layouts.app')
@section('title',$product->product_name)
@push('css')

@section('category_menu')
    @include('user.layouts.hidden_category_menu')
@endsection

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
</style>
@endpush

@section('category_menu')
    @include('user.layouts.hidden_category_menu')
@endsection

@section('content')
    <!-- single product start -->
    <div class="single_product_area">
        <div class="container">
             <div class="row">
                <div class="col-xs-12">
                    <div class="breadcrumb" style="font-weight: bold;font-size: 18px;">
                        <a href="{{ route('home') }}"><i class="fa fa-home"></i>Home</a>
                        <span class="navigation-pipe"><i class="fa fa-angle-right"></i></span>
                        <span class="navigation_page">Product Details</span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="primary_block">
                    <div class="col-xs-12 col-sm-6 col-md-5">
                        <div class="zoomWrapper">
                            <div id="img-1" class="zoomWrapper single-zoom">
                                @php
                                    $image = DB::table('image_products')->where('product_id',$product->id)->first();
                                @endphp
                                <a href="#">
                                    <img id="zoom1" src="{{ asset('images/product/'.$image->image) }}" data-zoom-image="{{ asset('images/product/'.$image->image) }}" alt="big-1">
                                </a>
                                {{-- <span class="new-box">
                                    <span class="new-label">New</span>
                                </span> --}}
                            </div>
                            <div class="product-thumb row">
                                <ul class="p-details-slider" id="gallery_01">
                                    @foreach($product->images as $image)
                                        <li class="col-md-4">
                                            <a class="elevatezoom-gallery" href="#" data-image="{{ asset('images/product/'.$image->image) }}" data-zoom-image="{{ asset('images/product/'.$image->image) }}"><img src="{{ asset('images/product/'.$image->image) }}" alt=""></a>
                                        </li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4">
                        <div class="primary_block_details">
                            <h1>{{ $product->product_name }}</h1>
                            @if($product->company_id != null)
                                <p id="product_reference" style="font-size: 15px;">
                                    <label>Reference: </label>
                                    <span content="demo_1" style="font-size: 15px;">
                                {{ $product->company->company_name }}
                            </span>
                                </p>
                            @endif

                            <p class="product_condition">
                            <span id="shortProducts">
                                {!! $product->product_details !!}
                                {{--{!! substr($product->product_details,0,200) !!}--}}
                            </span>

                            </p>
                            <script>
                                function openDetails() {
                                    $('#shortProducts').show();
                                }
                            </script>

                            <br>
                            <div class="stock" style="margin-top:10px;">
                                {{-- <div class="stock_items">
                                    <p>276 Items</p>
                                </div> --}}
                                @if($product->quantity > 0)
                                <div class="stock_button">
                                    <a href="#">

                                        {{ $product->sku }}

                                    </a>
                                </div>
                                @endif
                            </div>
                            <br>
                            <span id="our_price_display" style="margin-top: 15px;font-size: 25px;font-weight: bold;color: #f57224;">
                        	<i class="fb-taka"></i>
                                {{ $price }}
                                {{--@if(sizeof($product->todayoffer)>0)--}}
                                    {{--@foreach($product->todayoffer as $offer)--}}
                                        {{--{{ $offer->offer_price }}--}}
                                    {{--@endforeach--}}
                                {{--@elseif(sizeof($product->weeklyoffer)>0)--}}
                                    {{--@foreach($product->weeklyoffer as $offer)--}}
                                        {{--{{ $offer->offer_price }}--}}
                                    {{--@endforeach--}}
                                {{--@elseif(sizeof($product->slider)>0)--}}
                                    {{--@foreach($product->slider as $offer)--}}
                                        {{--{{ $offer->offer_price }}--}}
                                    {{--@endforeach--}}
                                {{--@elseif(sizeof($product->promotion)>0)--}}
                                    {{--@foreach($product->promotion as $offer)--}}
                                        {{--{{ $offer->offer_price }}--}}
                                    {{--@endforeach--}}
                                {{--@elseif($product->discount_price != null)--}}
                                    {{--{{ $product->discount_price }}--}}
                                {{--@else--}}
                                    {{--{{ $product->unit_price }}--}}
                                {{--@endif--}}
                                @if($price < $product->unit_price)
                                &nbsp;<u style="text-decoration: line-through;color: black">
                                    <i class="fb-taka"></i>
                                    {{ $product->unit_price  }}
                                </u>
                                    @endif



                        </span>
                            <form id="myform" action="{{ route('add_to_cart') }}"
                                  method="POST">
                                @csrf
                                <input type="hidden" name="discount"
                                       value="{{ $discount }}" />
                                <input type="hidden" name="product_id"
                                       value="{{ $product->id }}" />
                                @php
                                    $is_read = true;
                                @endphp
                                <input type="hidden" name="price"
                                       value="{{ $price }}" {{ $is_read ? 'readonly' : '' }}>
                                <div class="product_attributes clearfix">
                                    @if($product->category_id != 9)
                                        <div class="quantity_wanted_p">
                                            <label>Quantity</label>
                                            <input name="quantity" type="number" value="1" class="cart-plus-minus-box">
                                            <div class="dec qtybutton">-</div>
                                            <div class="inc qtybutton">+</div>
                                            <span class="clearfix"></span>

                                        </div>
                                    @endif
                                    <p style="" id="minimal_quantity_wanted_p">
                                        {{--The minimum purchase order quantity for the product is--}}
                                        {{--<b id="minimal_quantity_label">1</b>--}}
                                    </p>

                                    <div id="attributes">
                                        <div class="clearfix"></div>
                                        @if(sizeof($product->sizes) < 0)
                                            <fieldset class="attribute-fieldset">
                                                <label class="attribute-label">Size</label>
                                                <div class="attribute-list">
                                                    <div class="selector">
                                                        <select class="form-control attribute-select" name="group_1">
                                                            <option title="S" selected="selected" value="">Select Size</option>
                                                            @foreach($product->sizes as $size)
                                                                <option value="{{ $size->id }}">
                                                                    {{ $size->size }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        @endif
                                        @if(sizeof($product->colors) > 0)
                                            <fieldset class="attribute-fieldset">
                                                <label class="attribute-label">Color</label>
                                                <div class="attribute-list">
                                                    <div class="selector">
                                                        <select class="form-control attribute-select" name="group_1">
                                                            <option title="S" selected="selected" value="">Select colors</option>
                                                            @foreach($product->colors as $color)
                                                                <option value="{{ $color->id }}">{{ $color->color }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        @endif

                                        <div class="button_content">
                                            @if($product->quantity > 0)
                                                <button type="submit" class="cart_button">
                                                    add to cart
                                                </button>
                                            @else
                                                <button disabled  class="cart_button" style="cursor: no-drop;background: #FF5722 none repeat scroll 0 0;opacity: 0.6;border: 1px solid #FF5722">
                                                    Out Of Stock
                                                </button>
                                            @endif

                                            <div id="snackbar" style="background: #648FA4;">
                                                <span id="snack_message"></span>
                                            </div>
                                            <a href="{{ route('add_to_favorite',$product->id) }}" class="heart">
                                                <i class="fa fa-heart"></i>
                                            </a>

                                            @if($product->quantity > 0 && $product->sku = 'In Stock')
                                            <a href="{{ route('buy_now',['product_id' => $product->id, 'price' => $price,'discount'=>$discount]) }}" class="btn btn-default" style="margin: 25px 0 0 10px;background: forestgreen;
                                           color:white;">
                                                Buy Now
                                            </a>
                                                @endif
                                        </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <div class="row" id="review_product">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="p-details-tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active">
                          <a href="#more-info" aria-controls="more-info"
                          role="tab" data-toggle="tab">
                            MORE
                          </a>
                        </li>
                          <li role="presentation">
                            <a href="#reviews" aria-controls="reviews" role="tab"
                             data-toggle="tab"> Review
                           </a>
                         </li>
                    </ul>
                </div>
                <div class="clearfix"></div>
                <div class="tab-content review">
                    <div role="tabpanel" class="tab-pane active" id="more-info">
                        @if($product->video != null)
                            <video width="420" height="340" controls>
                                <source src="{{URL::asset("/videos/".$product->video)}}"
                                        type="video/mp4">
                                Your browser does not support the video tag.
                            </video>
                        @elseif($product->details != null)
                            <p>{{ $product->product_details }}</p>
                        @endif
                    </div>

                    <div role="tabpane2" class="tab-pane" id="reviews">
                        <div id="product-comments-block-tab">
                                @php
                                  $reviews = App\Model\Review::with('user')
                                  ->where('product_id',$product->id)->get();
                                @endphp
                                @if(sizeof($reviews)>0)
                                @foreach($reviews as $review)
                                  <div class="col-md-1">
                                    <img class="img-responsive img-rounded img-circle
                                    img-thumbnail"
                                    src="{{ asset('images/user/'.$review->user->image) }}"
                                    alt="" />
                                  </div>
                                  <div class=col-md-11>
                                    <h5>{{ $review->user->name }}</h5>
                                    <p>{{ $review->comments }}</p><hr>
                                  </div>
                                  <br>
                             @endforeach
                              @else 
                                <h2 class="text-center">No Review Yet :)</h2>
                              @endif

                        
                            <div class="row" style="margin-top: 30px;">
                                <div class="col-md-10 col-md-offset-1">
                                    @if(Auth::check())
                                  <div class="form-group">
                                      <label for=""><h4>Write A Review</h4></label>
                                      <input id="product_id" type="hidden" name="product_id" value="{{ $product->id }}" {{ $is_read ? "readonly" : '' }}>
                                      <textarea v-model="comments" name="comments" class="form-control" style="border-radius: 10px;height: 100px;"></textarea>
                                  </div>
                                  <button type="submit" class="btn btn-success btn-lg" @click="submitReview">
                                    Submit Review
                                  </button>
                              @else 
                               <h4 style="color: black;" class="text-center"> If you want to post a review, 
                                <span>
                                    <a href="{{ route('login') }}">
                                    <u>Login</u>
                                </a>
                                </span>
                                    First
                                </h4>
                              @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            <br>
            {{-- Releated Product --}}
            <div class="col-lg-12 col-md-12 col-xs-12" style="margin-top: 15px;">
                <div class="featured_area">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="section_title">
                                    <h3>
                            <span class="angle">
                            <i class="fa fa-clock-o"></i>
                            </span>Related Products
                                    </h3>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="featured_products without_tab">
                                @foreach($related_products as $product)
                                    <div class="col-xs-12">
                                        <div class="single_product">
                                            <div class="product_image">
                                                @php
                                                    $image = DB::table('image_products')
                                                    ->where('product_id',$product->id)->first();
                                                @endphp
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
                                                {{--<a href="#" class="new-box"><span>New</span></a>--}}
                                                {{--<a href="#" class="quick-view modal-view" data-toggle="modal" data-target="#productModal{{ $product->id }}">--}}
                                                {{--<i class="fa fa-eye"></i>Quick view--}}
                                                {{--</a>--}}
                                            </div>
                                            <div class="product_content">
                                                <form action="{{ route('product_details',$product->slug) }}" method="POST" id="add_to_cart1">
                                                            @csrf
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
                                                        <span class="old-price
                                                                product-price" style="font-size: 14px;color: #3c3c3c;line-height: 17px;">
                                                {{ $product->unit_price }}
                                                                </span>
                                                        <span class="price" style="font-size: 14px;color: #3c3c3c;line-height: 17px;">
                                                                    <i class="fb-taka"></i>
                                                            {{ $product->discount_price }}
                                                                </span>
                                                    @else
                                                        <span style="font-size: 14px;color: #3c3c3c;line-height: 17px;">
                                                                <i class="fb-taka"></i>
                                                            {{ $product->unit_price }}
                                                                </span>
                                                    @endif
                                                </div>
                                                <div class="button_content">

                                                    <form action="{{ route('a_t_c') }}" method="POST"
                                                      id="add_cart">
                                                    @csrf
                                                    <input type="hidden" name="from_single_page"
                                                           value="yes">
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
                                                    {{--<a href=""--}}
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
                    </div>
                </div>
                <!-- featured end -->
            </div>
            {{-- Related product end --}}
            </div>
        </div>
@endsection

@push('js')

<script type="text/javascript">
    var app = new Vue({
        el: '#review_product',
            mounted() {
            console.log('ok');
           },
        data (){
            return {
                product_id : '',
                comments : '',
                form : {
                    product_id :'',
                    comments :'',
                }
            }
        },
        methods : {
            submitReview(){
                let product_id = document.getElementById('product_id').value;
                let comments = this.comments;
                if(comments.length){
                    let data = {
                        product_id : product_id,
                        comments : comments
                    };
                    axios.post('/save_review',data).then(response=>{
                        var x = document.getElementById("snackbar");
                            x.className = "show";
                            $('#snack_message').html(response.data.message);
                            setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
                            location.reload();
                    }).catch(error=>{
                        console.log(error);
                    });
                } else{
                     var x = document.getElementById("snackbar");
                        x.className = "show";
                        $('#snack_message').html('Write Review First');
                        setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
                }
            }
        }
       
    });
</script>

    <script type="text/javascript">
        $(document).ready(function () {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });


            //delete user login
            $('#addCart').on("click",function () {
                var product_id = $(this).data("id");
                $.ajax({
                    type: "GET",
                    url: "{{ url('add_to_cart')}}"+'/'+product_id,
                    success: function (data) {
                        // swal("Successfully Added");
                        var x = document.getElementById("snackbar");
                        x.className = "show";
                        setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);

                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });
            });
        });
    </script>
@endpush
