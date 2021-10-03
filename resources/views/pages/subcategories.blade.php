@extends('user.layouts.app')
@section('title','Sub Categories' )
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
                 <div class="row">
                    <div class="col-xs-12">
                        <div class="breadcrumb" style="font-weight: bold;font-size: 18px;">
                            <a href="{{ route('home') }}"><i class="fa fa-home"></i>Home</a>
                            <span class="navigation-pipe"><i class="fa fa-angle-right"></i></span>
                            <span class="navigation_page">Sub Categories</span>
                            <span style="float: right;">Total {{ $subcategories->count() }} Items</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-sm-8 col-xs-12">
                    {{--<div class="content_scene_cat">--}}
                    {{--<div class="content_banner">--}}
                    {{--<a class="white-hover" href="#">--}}
                    {{--<img src="{{ asset('assets/user/img/banner/banner_10.jpg') }}"--}}
                    {{--alt="">--}}
                    {{--</a>--}}
                    {{--</div>--}}
                    {{--</div>--}}
                    

                    <div class="content_sortPagiBar clearfix"></div>
                    <div class="tab_container block_content">
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="grid">
                                <div class="shop_products_area">
                        <div class="row">
                            @foreach($subcategories as $subcategory)
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="single_product">
                                        <div class="product_image">
                                            <a class="product_img_link" href="{{ route('subsubcategories',$subcategory->slug) }}">
                                                @if($subcategory->image != null)
                                                    <img src="{{ asset('images/subcategory/'.$subcategory->image) }}" alt="">
                                                @else
                                                    <img src="{{ asset('assets/user/logo/01.jpg') }}"  alt="">
                                                @endif
                                            </a>
                                        </div>
                                        <br>
                                        <div class="product_content">
                                            <a href="{{ route('subsubcategories',$subcategory->slug) }}" class="product-name" style="height: 50px;margin-left: 20px;">
                                                {{ $subcategory->name }}
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                                </div>
                            </div>

                        </div>
                        {{--Pagination Start--}}
                        {{--<nav aria-label="Page navigation example" style="float: right;">--}}
                            {{--<ul class="pagination pagination-lg">--}}
                                {{--<li class="page-item">{{ $products->links() }}</li>--}}
                            {{--</ul>--}}
                        {{--</nav>--}}
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