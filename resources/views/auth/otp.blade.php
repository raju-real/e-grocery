@extends('user.layouts.app')
@section('title','Sign Up')
@push('css')
    <style>
        .employee-login{
            display: none;
        }
    </style>
@endpush

@section('category_menu')
    @include('user.layouts.hidden_category_menu')
@endsection

@section('content')
    <div id="opt">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="panel panel-info">
                    <div class="panel-heading" style="height: 60px;color :#ffffff;background-color: rgb(92 184 92 / 84%);border-color : #5cb85c;">
                        <h2 id="otp-header">@{{ heading }}</h2>
                    </div>
                    <div class="panel-body" style="otp_send_panle">
                        <div id="otp_form_send" style="display: inherit;">
                        <div class="alert alert-danger" style="display: none" id="alert">
                            {{--  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>  --}}
                            <span id="alert_message"></span>
                        </div>

                            <div class="form-group" id="mobile_div">
                                <label for=""></label>
                                <input type="text" class="form-control" v-model="mobile" @value="mobile" style="height: 40px;border-radius: 10px;" id="mobile_form">
                            </div>
                            <div class="form-group" style="display: none;" id="otp_form">
                                <label for=""></label>
                                <input type="text" class="form-control" v-model="typed_opt" style="height: 40px;border-radius: 10px;">
                            </div>
                                <br>
                            <button @click="sendOtp()" type="button" class="btn btn-success btn-lg" id="otp_send" style="width: 200px;background-color: rgb(92 184 92 / 84%)">Send Otp</button>

                            <button @click="checkOtp()" type="button" class="btn btn-success btn-lg" id="request_send" style="display: none;" v-model="typed_opt" style="width: 200px;background-color: rgb(92 184 92 / 84%)">Submit Otp</button>
                        </div>


{{----------------------------------------------------------------------------}}

                        <div id="registration_form" class="mt-10" style="display: none;">
                            <div class="form-group">
                                <label for="name" ><h4>{{ __('Name') }}</h4></label>
                                <span id="register_name_error" style="display: none;color: red;"></span>
                                <input id="register_name" type="text"
                                       class="form-control" name="name"
                                       v-model="registration_data.name"
                                       @keyup="hideRegisterNameError()"
                                       style="height: 40px;border-radius: 10px;">
                            </div>

                                {{--<div class="form-group" style="display: none">--}}
                                    {{--<label for="mobile" >--}}
                                        {{--{{ __('Mobile') }}--}}
                                    {{--</label>--}}

                                        {{--<span id="register_mobile_error" style="display: none;color: red;"></span>--}}
                                        {{--<input id="register_mobile" class="form-control" name="mobile"--}}
                                               {{--autocomplete="off"--}}
                                               {{--onkeyup="hideRegisterMobileError()"--}}
                                        {{--@value="response_mobile" v-once>--}}

                                        {{--@error('mobile')--}}
                                        {{--<span class="invalid-feedback" role="alert">--}}
                                        {{--<strong>{{ $message }}</strong>--}}
                                    {{--</span>--}}
                                        {{--@enderror--}}
                                {{--</div>--}}


                                <div class="form-group">
                                <label for="referral" >
                                    <h4>{{ __('Referral Code') }}</h4>
                                </label>
                                    <input id="referral" class="form-control"
                                           name="referral"
                                           placeholder="Optional"
                                            v-model="registration_data.referral"
                                            style="height: 40px;border-radius: 10px;">
                                </div>
                                <div class="form-group">
                                    <label for="password" >
                                        <h4>{{ __('Password') }}</h4>
                                    </label>
                                    <span id="register_password_error"
                                          style="display: none;color: red;">

                                    </span>
                                    <input id="register_password" type="password"
                                           class="form-control" name="password"
                                           v-model="registration_data.password"
                                           @keyup="hideRegisterPasswordError()"
                                           style="height: 40px;border-radius: 10px;">
                                </div>

                                <div class="form-group">
                                    <label for="password-confirm">
                                        <h4>{{ __('Confirm Password') }}</h4>
                                    </label>
                                        <span id="register_confirm_password_error"
                                              style="display: none;color: red;">

                                    </span>
                                    <input id="confirm_password" type="password"
                                           class="form-control"
                                           name="password_confirmation"
                                           v-model="registration_data.confirm_password"
                                           @keyup="hideRegisterConfirmPasswordError()"
                                           style="height: 40px;border-radius: 10px;">
                                </div>

                                <div class="form-group">
                                    <div class="">
                                        <button type="button" class="btn btn-success btn-lg"
                                        @click="registration" style="width: 200px;">
                                            {{ __('Register') }}
                                        </button>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
@endsection

@push('js')
    <script>
        var app = new Vue({
            el: '#opt',
            data() {
                return {
                    heading : 'Mobile Number',
                    route : '',
                    message : '',
                    mobile: '',
                    otp : '',
                    typed_opt : '',
                    response_mobile : '',
                    mobile_varified : '',
                    form : {
                        mobile : '',
                    },
                    registration_data : {
                        name : '',
                        mobile : '',
                        referral : null,
                        password : '',
                        confirm_password : '',
                        mobile_varified : '',
                    },
                    submit_mode : false,
                }
            },
            methods : {
                sendOtp(){
                    this.form.mobile = this.mobile;
                    let vm = this;
                    let mobile = this.mobile;
                    let phone = /^\d{11}$/;
                    if(mobile.length > 0 && mobile.match(phone)){
                        let data = {
                            mobile : mobile
                        };
                        axios.post('/api/send_otp',data)
                            .then(response=>{
                                if(response.data.message == "You Are Already Registered"){
                                    $('#alert').show();
                                    var alert = document.getElementById('alert_message');
                                    alert.innerHTML = response.data.message;
                                    document.getElementById("mobile_form").value.reset();
                                } else {
                                    this.heading = 'Type Otp Code';
                                    $('#mobile_div').hide();
                                    $('#otp_form').show();
                                    $('#otp_send').hide();
                                    $('#request_send').show();
                                    this.otp = response.data.otp_code;
                                    this.response_mobile = response.data.mobile;
                                    $('#alert').show();
                                    var alert = document.getElementById('alert_message');
                                    alert.innerHTML = response.data.message;
                                }

                            }).catch(error=>{

                        });
                    } else {
                        $('#alert').show();
                        let alert = document.getElementById('alert_message');
                        alert.innerHTML = "Invalid Mobile";
                    }
                },

                checkOtp(){
                    let vm = this;
                    if(vm.typed_opt == vm.otp && vm.mobile == this.response_mobile ){
                        this.response_mobile = this.response_mobile;
                        this.mobile_varified = 1;
                        vm.route = "{{ route('register-user') }}";
                        $('#otp_form_send').hide();
                        $('#registration_form').show();
                        this.heading = 'Varified, Sign Up Now';
                        $('#otp-header').css('color','#800064');
                    }else{
                        $('#alert').show();
                        var alert = document.getElementById('alert_message');
                        alert.innerHTML = "Invalid Otp Code";
                    }
                },

                registration(){
                    let vm = this;
                    vm.registration_data.mobile = vm.response_mobile;
                    vm.registration_data.mobile_varified = vm.mobile_varified;
                    let name = vm.registration_data.name;
                    let mobile = vm.registration_data.mobile;
                    let referral = vm.registration_data.referral;
                    let password = vm.registration_data.password;
                    let confirmPassword = vm.registration_data.confirm_password;
                    let mobileVarified = vm.registration_data.mobile_varified;
                    if(!name.length){
                        var error = document.getElementById("register_name_error");
                        $('#register_name_error').show();
                        error.innerHTML = "Name Field Is Required";
                        $('#register_name').css('border',"1px solid red");
                        this.submit_mode = false;
                    } else if(!password.length ){
                        $('#register_password').css('border',"1px solid red");
                        var error = document.getElementById("register_password_error");
                        $('#register_password_error').show();
                        error.innerHTML = "Password Field Is Required";
                        this.submit_mode = false;
                    } else if(!confirmPassword.length){
                        $('#confirm_password').css('border',"1px solid red");
                        var error = document.getElementById("register_confirm_password_error");
                        $('#register_confirm_password_error').show();
                        error.innerHTML = "Confirm Password Field Is Required";
                        this.submit_mode = false;
                    } else if(confirmPassword != password){
                        $('#confirm_password').css('border',"1px solid red");
                        var error = document.getElementById("register_confirm_password_error");
                        $('#register_confirm_password_error').show();
                        error.innerHTML = "Confirm Password Not Matched";
                        this.submit_mode = false;
                    } else {
                        this.submit_mode = true;
                    }

                    if(this.submit_mode){
                        let data = {
                            name : name,
                            mobile : mobile,
                            referral : referral,
                            password : password,
                            confirm_password : confirmPassword,
                            mobileVarified : mobileVarified,
                        };
                        axios.post('/register-user',data)
                            .then(response=>{
                                window.location = response.data.redirect;
                        }).catch(error=>{
                            console.log(error)
                        });
                    }
                },

                hideRegisterConfirmPasswordError(){
                    $('#register_confirm_password_error').hide();
                    let password = document.getElementById('register_password');
                    let confirmPassword = document.getElementById('confirm_password');

                    if(confirmPassword.value == password.value) {
                        let error = document.getElementById('register_confirm_password_error');
                        $('#register_confirm_password_error').show();
                        error.style.color = 'green';
                        password.style.border = '1px solid green';
                        confirmPassword.style.border = '1px solid green';
                        error.innerHTML = "Password Match";
                    } else {
                        let error = document.getElementById('register_confirm_password_error');
                        $('#register_confirm_password_error').show();
                        password.style.border = '1px solid red';
                        error.innerHTML = "Password Not Match";
                        error.style.color = 'red';
                    }
        },

                hideRegisterNameError(){
                    let name = document.getElementById('register_name');
                    name.style.border = '1px solid green';
                    $('#register_name_error').hide();
                },

                hideRegisterMobileError(){
                    let name = document.getElementById('register_mobile');
                    name.style.border = '1px solid green';
                    $('#register_mobile_error').hide();
                },

                hideRegisterPasswordError(){
                    let password = document.getElementById('register_password');
                     if(password.value.length < 6){
                         let error = document.getElementById("register_password_error");
                         $('#register_password_error').show();
                         error.innerHTML = "Password Must Be At Least 6 Character";
                     } else {
                         password.style.border = '1px solid green';
                         $('#register_password_error').hide();
                     }

                },
            }
        })
    </script>


    @endpush
