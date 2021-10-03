<div class="banner_area section-padding">
    <div class="container">
        <div class="row">
            <h1 class="text-center">Our Top Categories</h1>
            <hr>
            @php
            $categories = App\Model\Category::inRandomOrder()->limit(9)->get();
            @endphp
            @foreach($categories as $category)
            <div class="col-md-4">
                <div class="thumbnail" style="height: 80px;">
                    <a href="{{ route('subcategories',$category->slug) }}">
                        <span style="float: left;padding: 20px;font-size: 18px;
                        color: green;width:70%">
                            <b>{{ $category->name }}</b>
                        </span>
                        <span style="float: right;padding: 15px;width: 30%">
                            @if($category->icon != null)
                            <img src="{{ asset('images/category/'.$category->icon) }}"
                                 class="img-responsive" alt="Image">
                            @else
                                <img src="{{ asset('assets/images/grocery.png') }}"
                                     class="img-responsive" alt="Image">
                            @endif
                        </span>
                    </a>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</div>

{{--<div class="banner_area section-padding">--}}
    {{--<div class="container">--}}
        {{--<div class="row">--}}
            {{--<h1 class="text-center">Our Top Categories</h1>--}}
            {{--<hr>--}}
            {{--@php--}}
            {{--$categories = App\Model\Category::inRandomOrder()->limit(6)->get();--}}
            {{--@endphp--}}
            {{--@foreach($categories as $category)--}}
            {{--<div class="col-xs-12 col-sm-4">--}}
                {{--<div class="single_banner">--}}
                    {{--<a href="{{ route('subcategories',$category->id) }}">--}}
                        {{--<img src="{{ asset('images/category/'.$category->image) }}" alt=""--}}
                        {{--style="margin-top: 20px;">--}}
                    {{--</a>--}}
                {{--</div>--}}
            {{--</div>--}}
            {{--@endforeach--}}
        {{--</div>--}}
    {{--</div>--}}
{{--</div>--}}
\

{{--<div class="container">--}}
    {{--<div class="row">--}}
        {{--<div class="col-md-12">--}}
            {{--<div class="top_categories">--}}
                {{--<h1 class="text-center">Our Top Categories</h1>--}}
                {{--<hr>--}}
                {{--@php--}}
                    {{--$categories = App\Model\Category::inRandomOrder()->limit(9)->get();--}}
                {{--@endphp--}}
                {{--@foreach($categories as $category)--}}
                {{--<div class="col-md-4">--}}
                    {{--<button class="btn btn-default btn-block" style="margin-top: 20px;">--}}
                        {{--<a href="">--}}
                            {{--<img src="{{ asset('assets/images/file.jpg') }}"--}}
                                     {{--class="img-responsive" alt="Image"--}}
                                     {{--style="height: 150px;width: 100%;">--}}
                        {{--</a>--}}
                    {{--</button>--}}
                {{--</div>--}}
                {{--@endforeach--}}
            {{--</div>--}}
        {{--</div>--}}
    {{--</div>--}}
{{--</div>--}}