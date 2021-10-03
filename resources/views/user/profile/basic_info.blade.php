<div id="information" class="panel-collapse collapse in"
     role="tabpanel" aria-labelledby="headingFour">
    <div id="varify">
        <div class="panel-body">
            <div class="row">
                @php
                $user = Auth::user();
                @endphp
                {{--Basic Info Part--}}
                <div class="personal-info col-lg-6 col-md-6 col-sm-10">
                    @if($user)
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            Your Basic Information
                        </div>
                        <div class="panel-body" style="padding: 20px;" id="userInfo">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Profile Picture</th>
                                    <th>:</th>
                                    <th>
                                        @if($user->image != null)
                                            <img src="{{ asset('images/user/'.$user->image) }}"
                                                 class="img-responsive" alt="Image"
                                                 style="height: 100px;width:100px;">
                                        @else
                                            <img src="{{ asset('assets/user/images/avatar.png') }}"
                                                 class="img-responsive" alt="Image"
                                                 style="height: 100px;width:100px;">
                                        @endif
                                    </th>
                                </tr>
                                <tr>
                                    <th>Full Name</th>
                                    <th>:</th>
                                    <th>{{ $user->name }}</th>
                                </tr>
                                <tr>
                                    <th>Mobile</th>
                                    <th>:</th>
                                    <th>
                                        {{ $user->mobile }}
                                        @if($user->mobileVarified == 1)
                                            <span style="color: blue;">({{ "Varified" }})</span>
                                        @else 
                                            <span style="color: red;">(Unvarified)</span>
                                            <button style="color: blue;" @click="openBox">Varify Mobile</button>
                                        @endif
                                    </th>
                                </tr>
                                <tr>
                                    <th>Email</th>
                                    <th>:</th>
                                    <th>{{ $user->email }}</th>
                                </tr>
                                <tr>
                                    <th>Gender</th>
                                    <th>:</th>
                                    <th>{{ $user->gender }}</th>
                                </tr>
                                @if($user->user_id != null)
                                    <tr>
                                        <th>Registered Under</th>
                                        <th>:</th>
                                        <th>{{ $user->user->name }}</th>
                                    </tr>
                                @endif
                                <tr>
                                    <th>Referral Code</th>
                                    <th>:</th>
                                    <th>{{ $user->referral_code }}</th>
                                </tr>

                                <tr>
                                    <th>Your Referral,Total</th>
                                    <th>:</th>
                                    <th>
                                        {{ $user->referrals ? $user->referrals->count() : '0' }}
                                    </th>
                                </tr>
                                <tr>
                                    <th>Total Earning Points</th>
                                    <th>:</th>
                                    <th style="color: green;">{{ $user->points }}</th>
                                </tr>
                                </thead>
                            </table>
                            <br>
                            <br>
                            <a class="btn btn-warning btn-block" data-toggle="modal"
                               href="#user_info_update{{ $user->id }}">
                                Update Your Basic Information
                            </a>
                            <div class="modal fade" id="user_info_update{{ $user->id }}">
                                <form action="{{ route('user.user_info_update',$user->id) }}"
                                      method="post" enctype="multipart/form-data">
                                    @csrf
                                    @method('PUT')
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">
                                                    &times;
                                                </button>
                                                <h4 class="modal-title">Update Your Information</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="form-group">
                                                        <label class="col-md-12 col-sm-12
                                            control-label">Full Name</label>
                                                        <div class="col-md-12 col-sm-12">
                                                            <input type="text" class="form-control"
                                                                   id="input-payment-fname"
                                                                   value="{{ $user->name }}"
                                                                   name="name">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-12 col-sm-12
                                            control-label">Email</label>
                                                        <div class="col-md-12 col-sm-12">
                                                            <input type="text" class="form-control"
                                                                   id="email"
                                                                   value="{{ $user->email }}"
                                                                   name="email">
                                                        </div>
                                                    </div>
                                                    <div class="form-group fix no-margin">
                                                        <label class="col-md-3 col-sm-3 col-xs-5
                                            control-label">
                                                            Gender
                                                        </label>
                                                        <div class="col-md-9 col-sm-9 col-xs-7">
                                                            <div class="radio no-margin">
                                    <span class="social_title">
                                        <input type="radio" name="gender" value="Male"
                                               @if(old('gender',$user->gender)=="Male")
                                               checked @endif>
                                        Male
                                    </span>
                                                                <span class="social_title">
                                        <input type="radio" name="gender" value="Female"
                                               @if(old('gender',$user->gender)=="Female")
                                               checked @endif>
                                         Female
                                    </span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-md-12 col-sm-12 control-label">
                                                            Picture
                                                        </label>
                                                        <div class="col-md-12 col-sm-12">
                                                            <input type="file" class="form-control"
                                                                   name="image">
                                                        </div>
                                                    </div>



                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-primary">
                                                    Update Information</button>
                                                <button type="button" class="btn btn-danger"
                                                        data-dismiss="modal">Close</button>
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </form>
                            </div>
                            <!-- /.modal -->
                            
                            <!-- /.Mobile Varified Modal -->
                             <div class="modal fade" id="varifyMobile">
                                @php
                                    $is_read = true;
                                @endphp
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <h3>Your Mobile</h3><hr>
                                                <div id="alert" class="alert alert-info" style="display: none;">
                                                    <span id="alert_message"></span>
                                                </div>
                                                <div class="form-group">
                                                  <input id="user-mobile" type="text" value="{{ $user->mobile }}"  class="form-control" {{ $is_read ? 'readonly': '' }}>
                                                  
                                                </div>
                                                <div class="form-group" id="otp" style="display: none;">
                                                    <input type="text" class="form-control" v-model="typed_otp">
                                                </div>
                                                <br>
                                                <div class="form-group" id="sendOtp">
                                                  <button  type="button" class="btn btn-primary" @click="sendOtp">
                                                      Send Otp
                                                  </button>
                                                </div>
                                                <div class="form-group" id="submitOtp" style="display: none;">
                                                  <button type="button" class="btn btn-primary" @click="submitOtp">
                                                      Submit Otp
                                                  </button>
                                                </div>
                                            </div>                                            
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                            </div>
                        </div>
                </div>
                    @endif
            
                {{--Basic Info Part End--}}

                {{--Password And Mobile Part Start--}}
                <div class="personal-info col-lg-6 col-md-6 col-sm-10" >
                    <div class="panel panel-info">
                        <div class="panel-heading">Change Your Mobile Number</div>
                        <div class="panel-body" style="padding: 20px;">
                            <form action="{{ route('user.change_mobile_no',$user->id) }}"
                                  method="post" role="form">
                            @csrf
                                <div class="form-group">
                                    <label for=""></label>
                                    <input type="text" class="form-control" name="mobile"
                                           placeholder="Your Mobile Number">
                                </div>
                                <br>
                                <button type="submit" class="btn btn-primary">Change</button>
                            </form>
                        </div>
                    </div>
                    <hr>
                    <div class="panel panel-info">
                        <div class="panel-heading">Change Your Password</div>
                        <div class="panel-body" style="padding: 20px;">
                            <form action="{{ route('user.update_password',$user->id) }}"
                                  method="post" role="form">
                                @csrf
                                <div class="form-group">
                                    <label for="">Old Password</label>
                                    <input type="text" class="form-control" name="old_password"
                                           id=""
                                           placeholder="Old Password">
                                </div>
                                <div class="form-group">
                                    <label for="">New Password</label>
                                    <input type="text" class="form-control" name="password"
                                           id=""
                                           placeholder="New Password">
                                </div>
                                <div class="form-group">
                                    <label for="">Confirm Password</label>
                                    <input type="text" class="form-control" name="confirm_password"
                                           id=""
                                           placeholder="Confirm Password">
                                </div>
                                <br>
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
                {{--Password And Mobile Part End--}}
                </div>
        </div>
    </div>
    
</div>

<script type="text/javascript">
    var app = new Vue({
        el : '#varify',
        data (){
            return {
                mobile : '',
                typed_otp : '',
                response_otp : '',
                form : {
                  mobile : '',
                },
                submitForm : {
                    mobile : '',
                }
            }
        },
        methods : {
            openBox(){
                $('#varifyMobile').modal('show');
            },
            sendOtp(){
                let userMobile = document.getElementById('user-mobile').value;
                this.form.mobile = userMobile;
                let mobile = userMobile;
                let data = {
                    mobile : mobile
                };
                axios.post('/api/old_user_otp',data).then(response=>{
                    console.log(response.data.otp_code);
                    $('#user-mobile').hide();
                    $('#sendOtp').hide();
                    $('#otp').show();
                    $('#submitOtp').show();
                    $('#alert').show();
                    $('#alert_message').html(response.data.message);
                    this.mobile = response.data.mobile;
                    this.response_otp = response.data.otp_code;
                }).catch(error=>{
                    console.log(error)
                });
            },
            submitOtp(){
                let mobile = this.mobile;
                let userMobile = document.getElementById('user-mobile').value; 
                let responseOtp = this.response_otp;
                let typedOtp = this.typed_otp;
                if(typedOtp == responseOtp && mobile == userMobile){
                    let data = {
                        mobile : mobile
                    };
                    axios.post('/api/varify_mobile',data).then(response=>{
                        $('#varifyMobile').modal('hide');
                        $('#userInfo').load(document.URL +  ' #userInfo');
                        // location.reload(true); // Full Page Reload
                    }).catch(error=>{
                        console.log(error);
                    });
                } else{
                    $('#alert').show();
                    $('#alert_message').html("Invalid Otp Code");
                }
            }
        }
    });
</script>
