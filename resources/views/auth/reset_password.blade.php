@extends('user.layouts.app')
@section('title','Reset Password')
@push('css')

@endpush
@section('category_menu')
    @include('user.layouts.hidden_category_menu')
@endsection

@section('content')

<div id="password-reset">
    <div class="container" style="margin-top: 20px;">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="panel panel-success">
                    <div class="panel-heading" style="height: 60px;color :#ffffff;background-color: #5cb85c;border-color : #5cb85c;">
                        <h2>@{{ heading }}</h2>
                    </div>

                    <br>
                    <div class="panel-body">
                        <div class="alert alert-danger" id="alert" style="display: none">
                            {{--  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>  --}}
                            <span id="alert_message"></span>
                        </div>
                        <div id="login_div">
                            <div class="form-group" id="type-mobile">
                                <label for="mobile" ><h4>Mobile</h4></label>
                                <span style="display: none" id="mobile_error"></span>
                                    <input id="mobile" class="form-control" name="mobile" v-model="mobile"  style="height: 40px;border-radius: 10px;">
                            </div>

                            <div class="form-group">
                                <button type="button" class="btn btn-success btn-lg" @click="sendOtp" style="width: 200px;" id="otp-send-button">
                                        Send Code
                            </button>

                            <div class="form-group" id="type-otp" style="display: none;">
                                <span style="display: none" id="mobile_error"></span>
                                    <input id="type_otp" class="form-control"  v-model="typed_opt" style="height: 40px;border-radius: 10px;">
                            </div>
                            <button type="button" class="btn btn-success btn-lg" @click="checkOtp" style="width: 200px;display: none" id="otp-check-button">
                                Check Otp
                            </button>
                            </div>
                            <br>
                            <br>
                        </div>
                        <div id="password-change" style="display: none;">
                            <div class="form-group">
                                <label id="password-label"><h4>New Password</h4></label>
                                <input type="password" v-model="password.password" class="form-control" id="password" style="height: 40px;border-radius: 10px;"
                                >
                            </div>
                            <div class="form-group">
                                <label id="confirm-password-label"><h4>Confirm Password</h4></label>
                                <input type="password" v-model="password.confirm_password" class="form-control" id="confirm_password" style="height: 40px;border-radius: 10px;" >
                            </div>
                            <button type="button" class="btn btn-success btn-lg" @click="resetPassword" style="width: 200px;" id="otp-check-button">
                                Reset Password
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')
    <script type="text/javascript">
        var app = new Vue({
            el : '#password-reset',
            data (){
                return {
                    heading : 'Type Your Registered Mobile',
                    message : '',
                    mobile : '',
                    response_mobile : '',
                    otp : '',
                    form : {
                        password : '',
                        confirmpassword : ''
                    },
                    password : {
                        password : '',
                        confirm_password : '',
                    },
                    typed_opt : '',
                    submitMode : false,
                }
            },
            methods: {
                sendOtp(){
                    this.form.mobile = this.mobile;
                    let vm = this;
                    let mobile = this.mobile;
                    let phone = /^\d{11}$/;
                    if(mobile.length > 0 && mobile.match(phone)){
                        let data = {
                            mobile : mobile
                        };
                        axios.post('/api/reset_password_otp',data)
                            .then(response=>{
                                if(response.data.message == "Invalid User"){
                                    $('#alert').show();
                                    var alert = document.getElementById('alert_message');
                                    alert.innerHTML = response.data.message;
                                    document.getElementById("mobile_form").value.reset();
                                } else {
                                    this.heading = 'Type Otp Code';
                                    $('#type-mobile').hide();
                                    $('#otp-send-button').hide();
                                    $('#type-otp').show();
                                    $('#otp-check-button').show();
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
                    if(vm.typed_opt.length &&vm.typed_opt == vm.otp && vm.mobile == this.response_mobile ){
                       $('#alert').hide();
                        $('#login_div').hide();
                        $('#password-change').show();
                        this.heading = 'Varified, Reset Password';
                        $('#otp-header').css('color','#800064');
                        this.submitMode = true;
                    }else{
                        $('#alert').show();
                        var alert = document.getElementById('alert_message');
                        alert.innerHTML = "Invalid Otp Code";
                    }
                },

                resetPassword(){
                    let new_password = this.password.password;
                    let confirm_password = this.password.confirm_password;
                    let mobile = this.response_mobile;
                    if(!new_password.length && new_password.length < 6){
                        $('#password-label').css('color','red');
                    } else if(!confirm_password.length){
                        $('#confirm-password-label').css('color','red');
                    } else if(confirm_password != new_password){
                         $('#confirm-password-label').css('color','red');
                    } else {
                        let data = {
                            mobile : mobile,
                            password : confirm_password
                        };
                        axios.post('/api/reset_password',data).then(response=>{
                            window.location = response.data.redirect;
                        }).catch(error=>{
                            console.log(error);
                        });
                    }
                },


            }
        });
    </script>
@endpush
