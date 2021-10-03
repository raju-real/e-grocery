@extends('user.layouts.app')
@section('title','Our Campaigns' )
@push('css')
    <style>
        .blink {
            animation: blinker 1s linear infinite;
        }

        @keyframes blinker {
            50% {
                opacity: 0;
            }
        }
    </style>

@endpush

@section('category_menu')
    @include('user.layouts.hidden_category_menu')
@endsection

@section('content')
    <div class="featured_area">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="breadcrumb" style="font-weight: bold;font-size: 18px;">
                        <a href="{{ route('home') }}"><i class="fa fa-home"></i>Home</a>
                        <span class="navigation-pipe"><i class="fa fa-angle-right"></i></span>
                        <span class="navigation_page">Campaigns</span>
                        <span style="float: right;">
                                Total {{ $promotions->count() }} Campaigns Running
                        </span>
                    </div>
                </div>
            </div>
           
            <div class="row">
                <div class="featured_products without_tab">
                    <div class="banner_area two ">
                        <div class="container">
                            <div class="row">
                                @foreach($promotions as $promotion)
                                <div class="col-md-3" style="padding-top: 30px;">
                                    <a href="{{ route('campaign',$promotion->slug) }}">
                                        <img src="{{ asset('images/promotion/'
                                        .$promotion->image) }}" class="img-responsive"
                                             alt="Image" style="height: 400px;border-radius: 10px;">
                                    </a>
                                </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')

@endpush