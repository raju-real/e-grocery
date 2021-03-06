@extends('user.layouts.app')

@section('title','About Us')

@push('css')
@endpush

@section('category_menu')
    @include('user.layouts.hidden_category_menu')
@endsection

@section('content')
    <!--About Area Start-->
    <div class="home-hello-info">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="f-title text-center">
                        <h3 class="title text-uppercase">About Us</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-7 col-sm-12 col-xs-12">
                    <div class="about-page-cntent">
                        <h3>The standard lorem ipsum passage</h3>
                        <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, ullam, commodi consequatur?</p>
                        <blockquote>
                            <p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur</p>
                        </blockquote>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent eu nisi ac mi malesuada vestibulum. Phasellus tempor nunc eleifend cursus molestie. Mauris lectus arcu, pellentesque at sodales sit amet, condimentum id nunc. Donec ornare mattis suscipit. Praesent fermentum accumsan vulputate.</p>
                    </div>
                </div>
                <div class="col-md-5 col-sm-12 col-xs-12">
                    <div class="img-element">
                        <a class="white-hover" href="#">
                            <img alt="banner1" src="{{ asset('assets/user/img/about/ab.jpg') }}">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End of ABout ARea-->
    <!--Our Team Start-->
    <div class="home-our-team section-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="f-title text-center">
                        <h3 class="title text-uppercase">Meet the team</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-4">
                    <div class="item-team text-center">
                        <div class="team-info">
                            <div class="team-img">
                                <img width="250" height="250" alt="team1" class="img-responsive" src="assets/user/img/about/ab-team1.jpg">
                                <div class="mask">
                                    <div class="mask-inner">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h4>Havier Macherano</h4>
                        <h5>Developer</h5>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4">
                    <div class="item-team text-center">
                        <div class="team-info">
                            <div class="team-img">
                                <img width="250" height="250" alt="team2" class="img-responsive" src="assets/user/img/about/ab-team2.jpg">
                                <div class="mask">
                                    <div class="mask-inner">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h4>Salim Rana</h4>
                        <h5>Reviewer</h5>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4">
                    <div class="item-team text-center">
                        <div class="team-info">
                            <div class="team-img">
                                <img width="250" height="250" alt="team3" class="img-responsive" src="assets/user/img/about/ab-team3.jpg">
                                <div class="mask">
                                    <div class="mask-inner">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h4>Anzo Perez</h4>
                        <h5>Designer</h5>
                    </div>
                </div>
                <div class="col-md-3 hidden-sm">
                    <div class="item-team text-center">
                        <div class="team-info">
                            <div class="team-img">
                                <img width="250" height="250" alt="team4" class="img-responsive" src="assets/user/img/about/ab-team4.jpg">
                                <div class="mask">
                                    <div class="mask-inner">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h4>Martin Demichelis</h4>
                        <h5>PHP Developer</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End of Our Team-->
@endsection


@push('js')

    @endpush