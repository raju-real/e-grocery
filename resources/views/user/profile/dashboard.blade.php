@extends('user.layouts.app')
@section('title','User Dashboard')

@push('css')

    @endpush

@section('category_menu')
    @include('user.layouts.hidden_category_menu')
@endsection


@section('content')
    <!-- Account Area start -->
    <div class="account-area area-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="account-link-list">
                        <div class="page-title">
                            <h1>My Account
                                <span style="float: right;">
                                     <a class="dropdown-item" href="{{ route('logout') }}"
                                        onclick="event.preventDefault();
                                                     document.getElementById('logout-form')
                                                     .submit();" style="color: #black;">
                                {{ __('Logout') }}
                            </a></li>

                                    <form id="logout-form" action="{{ route('logout') }}"
                                          method="POST" style="display: none;">
                                @csrf
                            </form>
                                </span>
                            </h1>

                        </div>
                        <p class="account-info">
                            Welcome to your account. Here you can manage all of your personal
                            information and orders.</p>

                        <div class="panel-group" id="accordion" role="tablist"
                             aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse"
                                           data-parent="#accordion" href="#order">
                                            <i class="fa fa-list-ol"></i>
                                            <span>Order history and details</span>
                                        </a>
                                    </h4>
                                </div>

                                @include('user.profile.user_order')

                            </div>

                            {{--Address Update Tab--}}
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingThree">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button"
                                           data-toggle="collapse" data-parent="#accordion"
                                           href="#address">
                                            <i class="fa fa-building"></i>
                                            <span>My addresses</span>
                                        </a>
                                    </h4>
                                </div>

                                @include('user.profile.address')

                            </div>

                            {{--Personal Information Update Tab--}}
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingFour">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button"
                                           data-toggle="collapse" data-parent="#accordion"
                                           href="#information">
                                            <i class="fa fa-user"></i>
                                            <span>My personal information</span>
                                        </a>
                                    </h4>
                                </div>

                                @include('user.profile.basic_info')
                            </div>

                            {{--Another Tab--}}
                            {{--<div class="panel panel-default">--}}
                                {{--<div class="panel-heading" role="tab" id="headingTwo">--}}
                                    {{--<h4 class="panel-title">--}}
                                        {{--<a class="collapsed" role="button"--}}
                                           {{--data-toggle="collapse" data-parent="#accordion"--}}
                                           {{--href="#credit">--}}
                                            {{--<i class="fa fa-file-o"></i>--}}
                                            {{--<span>My credit slips</span>--}}
                                        {{--</a>--}}
                                    {{--</h4>--}}
                                {{--</div>--}}
                                {{--<div id="credit" class="panel-collapse collapse"--}}
                                     {{--role="tabpanel" aria-labelledby="headingTwo">--}}
                                    {{--<div class="panel-body">--}}
                                        {{--<p class="panel-title">Credit slips you have received--}}
                                            {{--after canceled orders. </p>--}}
                                        {{--<div id="order-history">--}}
                                            {{--<p class="warning">You have not received any credit--}}
                                                {{--slips.</p>--}}
                                        {{--</div>--}}
                                    {{--</div>--}}
                                {{--</div>--}}
                            {{--</div>--}}

                        </div>
                    </div>
                </div>
                <div class="col-md-12">

                </div>
            </div>
        </div>
    </div>
    <!--End of Account Area-->
@endsection

@push('js')

@endpush