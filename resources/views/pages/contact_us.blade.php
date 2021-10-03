@extends('user.layouts.app')

@section('title','Contact Us')

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
                        <span class="navigation_page">Customer service - Contact Us</span>
                    </div>
                </div>
            </div>
            <div class="row">
                
                <div class="col-md-12">
                    <form class="contact-form-box" action="{{ route('send_message') }}"
                          method="post" id="sendMessage" onsubmit="return validate()">
                        @csrf
                        <fieldset>
                            <h3 class="page-subheading">send a message</h3>
                            @if(Session::has('message'))
                                <p class="text-center alert {{ Session::get('alert-class', 'alert-success') }}" style="color: darkgreen;">{{ Session::get('message') }}</p>
                            @endif
                            <div class="row">
                                <div class="col-xs-12 col-md-12">
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <input type="text"  id="name" name="name"
                                               class="form-control grey"
                                        onkeypress="hideNameError()">
                                        <span id="name_error" style="display: none;"></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Subject</label>
                                        <input type="text"  id="subject" name="subject"
                                               class="form-control grey"
                                               onkeypress="hideSubjectError()">
                                        <span id="subject_error" style="display: none;"></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Mobile</label>
                                        <input type="text"  id="mobile" name="mobile"
                                               class="form-control grey"
                                               onkeypress="hideMobileError()">
                                        <span id="mobile_error" style="display: none;"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="message">Message</label>
                                        <textarea name="message" id="message"
                                                  class="form-control" rows="5" cols="5"
                                        onkeypress="hideMessageError()">

                                        </textarea>
                                        <span id="message_error" style="display: none;"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="submit">
                                <button class="" id="submitMessage" name="submitMessage" type="submit"><span>Send<i class="fa fa-chevron-right right"></i></span>
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
        function validate() {
            var name = document.getElementById("name");
            var subject = document.getElementById("subject");
            var mobile = document.getElementById("mobile");
            var validPhone = /^\d{11}$/;
            var message = document.getElementById("message");
            if(name.value.trim()==""){
                $('#name_error').show();
                var error = document.getElementById("name_error");
                error.innerHTML = "Name Field Is Required";
                error.style.color = "red";
                name.style.border = "1px solid red";
                return false;
            } else if(subject.value.trim()==""){
                $('#subject_error').show();
                var error = document.getElementById("subject_error");
                error.innerHTML = "Subject Field Is Required";
                error.style.color = "red";
                subject.style.border = "1px solid red";
                return false;
            } else if(mobile.value.trim()==""){
                $('#mobile_error').show();
                var error = document.getElementById("mobile_error");
                error.innerHTML = "Mobile Field Is Required";
                error.style.color = "red";
                mobile.style.border = "1px solid red";
                return false;
            } else if(!mobile.value.match(validPhone)){
                $('#mobile_error').show();
                var error = document.getElementById("mobile_error");
                error.innerHTML = "Enter 11 Digit valid Mobile";
                error.style.color = "red";
                mobile.style.border = "1px solid red";
                return false;
            }else if(message.value.trim()==""){
                $('#message_error').show();
                var error = document.getElementById("message_error");
                error.innerHTML = "Message Field Is Required";
                error.style.color = "red";
                message.style.border = "1px solid red";
                return false;
            } else {
                return true;
            }
        }
        function hideNameError() {
            var name = document.getElementById('name');
            name.style.border = "none";
            $('#name_error').hide();
        }
        function hideSubjectError() {
            var subject = document.getElementById('subject');
            subject.style.border = "none";
            $('#subject_error').hide();
        }
        function hideMobileError() {
            var mobile = document.getElementById('mobile');
            mobile.style.border = "none";
            $('#mobile_error').hide();
        }
        function hideMessageError() {
            var message = document.getElementById('message');
            message.style.border = "none";
            $('#message_error').hide();
        }
    </script>
@endpush