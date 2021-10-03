@extends('user.layouts.app')
@section('title','Register')
@section('category_menu')
    @include('user.layouts.hidden_category_menu')
@endsection
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">

            <div class="panel panel-info">
                <div class="panel-heading">
                    Register
                </div>
                <div class="panel-body">
                    <form method="POST" action="{{ route('register-user') }}"
                          onsubmit="return registerValidation()">
                        @csrf

                        <div class="form-group row">
                            <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Name') }}</label>

                            <div class="col-md-6">
                                <span id="register_name_error" style="display: none;color: red;"></span>
                                <input id="register_name" type="text" class="form-control"
                                       name="name" value="{{ old('name') }}"
                                       onkeyup="hideRegisterNameError()">

                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="mobile" class="col-md-4 col-form-label text-md-right">
                                {{ __('Mobile') }}
                            </label>

                            <div class="col-md-6">
                                <span id="register_mobile_error" style="display: none;color: red;"></span>
                                <input id="register_mobile" class="form-control" name="mobile"
                                        autocomplete="off"
                                       onkeyup="hideRegisterMobileError()">

                                @error('mobile')
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="referral" class="col-md-4 col-form-label text-md-right">
                                {{ __('Referral Code') }}
                            </label>

                            <div class="col-md-6">
                                <input id="referral" class="form-control" name="referral"
                                       value="{{ old('referral') }}" placeholder="Optional">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="password" class="col-md-4 col-form-label text-md-right">
                                {{ __('Password') }}
                            </label>

                            <div class="col-md-6">
                                <span id="register_password_error" style="display: none;color: red;"></span>
                                <input id="register_password" type="password" class="form-control" name="password" onkeyup="hideRegisterPasswordError()">

                                @error('password')
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password-confirm"
                                   class="col-md-4 col-form-label text-md-right">
                                {{ __('Confirm Password') }}
                            </label>

                            <div class="col-md-6">
                                <span id="register_confirm_password_error" style="display: none;color: red;"></span>
                                <input id="confirm_password" type="password" class="form-control" name="password_confirmation"
                                       onkeyup="hideRegisterConfirmPasswordError()">
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Register') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>


        </div>
    </div>
</div>
@endsection

@push('js')
    <script>
        function registerValidation(){
            var name = document.getElementById('register_name');
            var mobile = document.getElementById('register_mobile');
            var password = document.getElementById('register_password');
            var confirmPassword = document.getElementById('confirm_password');
            var phone = /^\d{11}$/;
            if(name.value.trim() == ""){
                name.style.border = '1px solid red';
                var error = document.getElementById("register_name_error");
                $('#register_name_error').show();
                error.innerHTML = "Name Field Is Required";
                return false;
            } else if(mobile.value.trim() == ""){
                mobile.style.border = '1px solid red';
                var error = document.getElementById("register_mobile_error");
                $('#register_mobile_error').show();
                error.innerHTML = "Mobile Field Is Required";
                return false;
            } else if(!mobile.value.match(phone)){
                mobile.style.border = '1px solid red';
                var error = document.getElementById("register_mobile_error");
                $('#register_mobile_error').show();
                error.innerHTML = "Invalid Mobile Number";
                return false;
            } else if(password.value.trim() == ""){
                password.style.border = '1px solid red';
                var error = document.getElementById("register_password_error");
                $('#register_password_error').show();
                error.innerHTML = "Password Field Is Required";
                return false;
            } else if(confirmPassword.value.trim() == ""){
                confirmPassword.style.border = '1px solid red';
                var error = document.getElementById("register_confirm_password_error");
                $('#register_confirm_password_error').show();
                error.innerHTML = "Confirm Password Field Is Required";
                return false;
            } else if(confirmPassword.value != password.value){
                confirmPassword.style.border = '1px solid red';
                var error = document.getElementById("register_confirm_password_error");
                $('#register_confirm_password_error').show();
                error.innerHTML = "Confirm Password Not Matched";
                return false;
            }else {
                return true;
            }
        }

        function hideRegisterConfirmPasswordError(){
            $('#register_confirm_password_error').hide();
            var password = document.getElementById('register_password');
            var confirmPassword = document.getElementById('confirm_password');

            if(confirmPassword.value == password.value) {
                var error = document.getElementById('register_confirm_password_error');
                $('#register_confirm_password_error').show();
                error.style.color = 'green';
                password.style.border = '1px solid green';
                confirmPassword.style.border = '1px solid green';
                error.innerHTML = "Password Match";
            } else {
                var error = document.getElementById('register_confirm_password_error');
                $('#register_confirm_password_error').show();
                password.style.border = '1px solid red';
                error.innerHTML = "Password Not Match";
                error.style.color = 'red';
            }
        }

        function hideRegisterNameError(){
            var name = document.getElementById('register_name');
            name.style.border = '1px solid green';
            $('#register_name_error').hide();
        }

        function hideRegisterMobileError(){
            var name = document.getElementById('register_mobile');
            name.style.border = '1px solid green';
            $('#register_mobile_error').hide();
        }
        function hideRegisterPasswordError(){
            var name = document.getElementById('register_password');
            name.style.border = '1px solid green';
            $('#register_password_error').hide();
        }
    </script>
@endpush
