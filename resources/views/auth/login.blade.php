@extends('user.layouts.app')
@section('title','Log in')
@push('css')

@endpush
@section('category_menu')
    @include('user.layouts.hidden_category_menu')
@endsection
@section('content')

<div id="login">
    <div class="container" style="margin-top: 20px;">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="panel panel-success">
                    <div class="panel-heading" style="height: 60px;color :#ffffff;background-color: #5cb85c;border-color : #5cb85c;"><h2>Login</h2></div>
                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif
                    <br>
                    <div class="panel-body">
                        <div class="alert alert-danger" id="alert" style="display: none">
                            {{--  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>  --}}
                            <span id="alert_message"></span>
                        </div>
                        <div id="login_div">
                            <div class="form-group{{ $errors->has('mobile') ? ' has-error' : '' }}">
                                <label for="mobile" ><h4>Mobile</h4></label>
                                <span style="display: none" id="mobile_error"></span>
                                    <input id="mobile" class="form-control" name="mobile" value="{{ old('mobile') }}" v-model="mobile" @keyup="hideMobileError" style="height: 40px;border-radius: 10px;">

                                    @if ($errors->has('mobile'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('mobile') }}</strong>
                                    </span>
                                    @endif
                            </div>

                            <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                                <label for="password" ><h4>Password</h4></label>
                                    <span style="display: none" id="password_error"></span>
                                    <input id="password" type="password" class="form-control" name="password" v-model="password" @keyup="hidePasswordError" style="height: 40px;border-radius: 10px;">

                                    @if ($errors->has('password'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                    @endif
                            </div>

                            <div class="form-group">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> Remember Me
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                    <button type="button" class="btn btn-success btn-lg" @click="login" style="width: 200px;">
                                        Sign In
                                    </button>

                                    <a class="btn btn-link"
                                       href="{{ route('reset-password') }}" style="float: right;color: #5cb85c;text-decoration: none">
                                        Forgot Your Password?
                                    </a>
                            </div>
                            <br>
                            <br>
                            <h4 class="text-center">Don't have an account?
                                <br>
                            <a class="btn btn-link"
                                       href="{{ route('user-register') }}" style="font-size: 20px;color: #5cb85c;text-decoration: none">
                                        Sign up now
                                    </a></h4>

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
            el : '#login',
            data (){
                return {
                    message : '',
                    mobile : '',
                    password : '',
                    form : {
                        mobile : '',
                        password : ''
                    },
                    submitMode : false,
                }
            },
            methods: {
                login(){
                    this.form.mobile = this.mobile;
                    this.form.password = this.password;
                    let phone = /^\d{11}$/;
                    let mobile = this.form.mobile;
                    let password = this.form.password;
                    if(!mobile.length && !mobile.match(phone)){
                        $('#mobile').css('border','1px solid red');
                        $('#mobile_error').show().html("Mobile Required").css('color','red');
                        this.submitMode = false;
                    }else if(!password.length){
                        $('#password').css('border','1px solid red');
                        $('#password_error').show().html("Password Required").css('color','red');
                        this.submitMode = false;
                    } else {
                        let data = {
                            mobile : mobile,
                            password : password
                        };
                        axios.post('/user-login',data)
                            .then(response=>{
                                if(response.data.message){
                                    $('#alert').show();
                                    $('#alert_message').html(response.data.message);
                                } else {
                                    window.location.href = response.data.redirect;
                                }
                            })
                            .catch(error=>{
                            console.log(error);
                        });
                    }
                },
                hideMobileError(){
                    $('#mobile_error').hide();
                    $('#mobile').css('border','1px solid green');
                },
                hidePasswordError(){
                    $('#password_error').hide();
                    $('#password').css('border','1px solid green');
                }
            }
        });
    </script>
@endpush
