<div class="featured_area">
    <div class="container">
        
        <div class="row">
            <div class="col-xs-12">
                <div class="section_title">
                    <h3>
                        <span class="angle">
                        <i class="fa fa-clock-o"></i>
                        </span>Best Choice
                    </h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="featured_products without_tab">
                <div class="banner_area two ">
                    <div class="container">
                        <div class="row">
                            @foreach($promotions as $promotion)
                                <div class="col-xs-12 col-sm-6">
                                    <div class="single_banner">
                                        <a href="{{ route('promotion',$promotion->id) }}">
                                            <img src="{{ asset('images/promotion/'.$promotion->image) }}" alt="" style="padding-top: 10px;">
                                        </a>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

