<div class="slider_area">
            <div class="container">
                <div class="row">
                    <div class="hidden-xs hidden-sm col-md-3"></div>
                    <div class="col-sm-12 col-md-9">
                        <div class="slider-area">
                            @php
                            $sliders = App\Model\Slider::where('status',1)->
                            latest()->get();
                            @endphp

                            <div id="ensign-nivoslider" class="slides">
                                @if(sizeof($sliders)>0)
                                @foreach($sliders as $slider)
                                <a href="{{ route('offers',$slider->slug) }}">
                                    <img src="{{ asset('images/slider/'.$slider->image) }}" class="img-responsive" alt="Image">
                                </a>
                                {{--<a href="{{ route('top_products',$slider->id) }}">--}}
                                    {{--<img src="{{ asset('images/slider/'.$slider->image) }}"--}}
                                         {{--alt=""--}}
                                         {{--title="#{{ $slider->id }}" />--}}
                                {{--</a>--}}
                                @endforeach

                            </div>
                            <!-- direction 1 -->
                            <div id="{{ $slider->id }}" class="nivo-html-caption
                            slider-caption-1">
                                <div class="container slider-height">
                                    <div class="row slider-height">
                                        <div class="col-md-12 slider-height">
                                            <div class="slide-text">
                                                {{--<div class="cap-title wow zoomInUp" data-wow-duration="0.8s" data-wow-delay="0.5s">--}}
                                                    {{--<h2>{{ $slider->title }}</h2>--}}
                                                {{--</div>--}}
                                                <div class="cap-tag wow zoomInUp" data-wow-duration="1s" data-wow-delay="0.8s">
                                                    <h2>
                                                        <span class="cap-before">
                                                            {{--<a href="{{ route('top_products',$slider->id) }}">--}}
                                                                {{--{{ $slider->title }}--}}
                                                            {{--</a>--}}
                                                        </span>
                                                    </h2>
                                                </div>
                                                {{--<div class="cap-style wow zoomInUp" data-wow-duration="1.2s" data-wow-delay="1s">--}}
                                                    {{--<h2>Sleeh design / USB and SD / MMC Ports</h2>--}}
                                                {{--</div>--}}
                                                {{--<div class="cap-shop wow zoomInUp" data-wow-duration="1.5s" data-wow-delay="1.5s">--}}
                                                    {{--<a href="#">Shopping now <i class="fa fa-caret-right"></i></a>--}}
                                                {{--</div>                                      --}}
                                            </div>
                                        </div>
                                    </div>
                                </div>  
                            </div>
                            <!-- direction 2 -->
                            @else
                                <img src="{{ asset('assets/images/for_slider.jpg') }}" class="img-responsive" alt="Image">
                            @endif
                        </div>  
                    </div>
                </div>
            </div>
        </div>