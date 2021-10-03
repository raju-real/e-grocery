@extends('user.layouts.app')

@section('title','franchises')

@push('css')
@endpush

@section('category_menu')
    @include('user.layouts.hidden_category_menu')
@endsection

@section('content')
    <!--Contact Us Area Start-->
    <div class="contact-us-area">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="breadcrumb" style="font-weight: bold;font-size: 18px;">
                        <a href="{{ route('home') }}"><i class="fa fa-home"></i>Home</a>
                        <span class="navigation-pipe"><i class="fa fa-angle-right"></i></span>
                        <span class="navigation_page">Franchises</span>
                    </div>
                </div>
            </div>
            
            <div class="row">

                <div class="col-md-12" >
                    <form class="contact-form-box" action="{{ route('apply_franchises') }}"
                          method="post">
                        @csrf
                        <fieldset>
                            <h3 class="page-subheading">Franchises</h3>
                            @if(Session::has('message'))
                                <div class="alert alert-success">
                                    <h4 class="text-center">{{ Session::get('message') }}</h4>
                                </div>
                            @endif
                            <div class="row">
                                <div class="col-xs-12 col-md-12">
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <input type="text" name="name"
                                               class="form-control grey">
                                    </div>
                                    <div class="form-group">
                                        <label>Mobile</label>
                                        <input type="text" name="mobile"
                                               class="form-control grey">
                                    </div>
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input type="text" name="email"
                                               class="form-control grey">
                                    </div>
                                    <div class="form-group">
                                        <label>District</label>
                                        <input type="text" name="district"
                                               class="form-control grey">
                                    </div>
                                    <div class="form-group">
                                        <label>Thana</label>
                                        <input type="text" name="thana"
                                               class="form-control grey">
                                    </div>
                                    <div class="form-group">
                                        <label for="message">Current Business</label>
                                        <input name="current_business"
                                                  class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="message">Address</label>
                                        <textarea name="address" class="form-control" rows="5"
                                                  cols="5">
                                        </textarea>
                                    </div>

                                </div>
                            </div>
                            <div class="submit">
                                <button  type="submit"><span>Submit
                                        <i class="fa fa-chevron-right right"></i></span>
                                </button>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--End of Contact Us Area-->
@endsection


@push('js')
    <script>

    </script>
@endpush