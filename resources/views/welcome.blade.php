@extends('user.layouts.app')
@section('title','Home Page')
@push('css')
	{{-- expr --}}
@endpush

	@section('slider')
		@include('user.layouts.slider')
	@endsection

    @section('category_menu')
        @include('user.layouts.category_menu')
    @endsection

@section('content')
 {{--On Sale Offer --}}
 @include('pages.on_sale_products')
 <span><br></span>

 {{--Today Offer --}}
@if(sizeof($todayOffers)>0)
    @include('pages.today_offer')
@endif
<span><br></span>

{{-- Weekly Offer --}}
{{-- @if(sizeof($weeklyOffers)>0)
    @include('pages.weekly_offer')
@endif
<span><br></span> --}}

 {{--On Sale Offer --}}
    @include('pages.organic_products')
 <span><br></span>

 {{--Top Category Area--}}
    @include('pages.top_categories')
 <span><br></span>

{{--All Product--}}
    @include('pages.all_product')

@endsection

@push('js')
     
@endpush

