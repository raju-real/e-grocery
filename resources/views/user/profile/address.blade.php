<div id="address" class="panel-collapse collapse"
     role="tabpanel" aria-labelledby="headingThree">
    <div class="panel-body">
        <p class="panel-title">Your addresses are listed below. </p>
        <div class="row">
            @php
                $user = Auth::user();
                $homeAddress = App\Model\Homeaddress::with('division','district','upazila',
                'user')->where('user_id',$user->id)->first();
                $officeAddress = App\Model\Officeaddress::with('division','district','upazila',
                'user')->where('user_id',$user->id)->first();
                $giftAddress = App\Model\Giftaddress::with('division','district','upazila',
                'user')->where('user_id',$user->id)->first();
                $divisions = DB::table('divisions')->get();
                $districts = DB::table('districts')->get();
                $upazilas = DB::table('upazilas')->get();
            @endphp

            {{--Home Address Start--}}
            <div class="col-lg-4 col-md-4 col-sm-10 address">
                <ul class="address-information">

                    <li><h3>Home Address</h3></li>

                    <div id="homeAddress">
                        @if($homeAddress)
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th></th>
                                <th>:</th>
                                <th></th>
                                <th>{{ $user->name }}</th>
                            </tr>
                            <tr>
                                <th>Mobile</th>
                                <th></th>
                                <th>:</th>
                                <th></th>
                                <th>{{ $user->mobile }}</th>
                            </tr>
                            <tr>
                                <th>Division</th>
                                <th></th>
                                <th>:</th>
                                <th></th>
                                <th>
                                    {{ $homeAddress->division->division_name }}
                                </th>
                            </tr>
                            <tr>
                                <th>District</th>
                                <th></th>
                                <th>:</th>
                                <th></th>
                                <th>{{ $homeAddress->district->district_name  }}</th>
                            </tr>
                            <tr>
                                <th>Upzalia</th>
                                <th></th>
                                <th>:</th>
                                <th></th>
                                <th>{{ $homeAddress->upazila->upazila_name  }}</th>
                            </tr>
                            <tr>
                                <th>Address</th>
                                <th></th>
                                <th>:</th>
                                <th></th>
                                <th>{{ $homeAddress->address  }}</th>
                            </tr>
                            </thead>
                        </table>
                        @else
                        <h2>Not Added Yet :)</h2>
                        @endif
                    </div>
                    
                    <li class="address-update">
                        @if(!$homeAddress)
                            <a class="btn btn-warning btn-block" data-toggle="modal"
                               href="#home_address{{ $user->id }}"
                               style="float: right;">
                                Add Home Address
                            </a>
                        @else
                            <a class="btn btn-warning btn-block" data-toggle="modal"
                               href="#update_home_address{{ $user->id }}"
                               style="float: right;">
                                Update Home Address
                            </a>
                        @endif

                         {{--Home Address Add--}}
                        <div class="modal fade" id="home_address{{ $user->id }}">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close"
                                                data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                        <h4 class="modal-title">Add Your Home Address</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form
                                        action="{{ route('user.home_address_add',$user->id) }}"
                                        method="post">
                                            @csrf
                                        <div class="row">
                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                                control-label">
                                                    Division
                                                </label>
                                                <div class="col-md-12 col-sm-12">
                                                    <select name="division_id" id=""
                                                            class="form-control">
                                                    @foreach($divisions as $division)
                                                        <option value="{{ $division->id }}">
                                                            {{ $division->division_name }}
                                                        </option>
                                                    @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                                control-label">
                                                    District
                                                </label>
                                                <div class="col-md-12 col-sm-12">
                                                    <select name="district_id"
                                                            id="" class="form-control">
                                                    @foreach($districts as $district)
                                                        <option value="{{ $district->id }}">
                                                            {{ $district->district_name }}
                                                        </option>
                                                    @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                                control-label">
                                                    Upazila
                                                </label>
                                                <div class="col-md-12 col-sm-12">
                                                    <select name="upazila_id"
                                                            id="" class="form-control">
                                                    @foreach($upazilas as $upazila)
                                                        <option value="{{ $upazila->id }}">
                                                            {{ $upazila->upazila_name }}
                                                        </option>
                                                    @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group required">
                                                <label class="col-md-12 col-sm-12
                                                control-label">
                                                    Address</label>
                                                <div class="col-md-12 col-sm-12">
                                                    <textarea rows="" id="input-enquiry"
                                                              class="form-control"
                                                              name="address">
                                                    </textarea>
                                                </div>
                                            </div>
                                        <br>
                                        </div>
                                            <div class="form-group">
                                                <div class="col-md-12 col-sm-12">
                                                    <button type="submit" class="btn
                                                    btn-success">
                                                        Add
                                                    </button>
                                                    <button type="button" class="btn
                                                    btn-danger"
                                                            data-dismiss="modal">Close
                                                    </button>
                                                </div>

                                            </div>

                                        </form>
                                    </div>
                                    <div class="modal-footer">

                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
                        {{--Home Address Add End--}}

                        {{--Home Address Update--}}
                        <div class="modal fade" id="update_home_address{{ $user->id }}">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close"
                                                data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                        <h4 class="modal-title">Update Your Home Address</h4>
                                    </div>
                                    @if($homeAddress)
                                        <div class="modal-body">
                                            <form action="{{ route('user.home_address_update',$user->id) }}" method="post">
                                                @csrf
                                                @method('PUT')
                                                <div class="row">
                                                    <div class="form-group required">
                                                        <label class="col-md-12 col-sm-12
                                control-label">
                                                            Division
                                                        </label>
                                                        <div class="col-md-12 col-sm-12">
                                                            <select name="division_id" id=""
                                                                    class="form-control">
                                                                <option
                                                                        value="{{ $homeAddress->division->id }}">
                                                                    {{ $homeAddress->division->division_name }}
                                                                </option>
                                                                @foreach($divisions as $division)
                                                                    <option value="{{ $division->id }}">
                                                                        {{ $division->division_name }}
                                                                    </option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="form-group required">
                                                        <label class="col-md-12 col-sm-12
                                control-label">
                                                            District
                                                        </label>
                                                        <div class="col-md-12 col-sm-12">
                                                            <select name="district_id"
                                                                    id="" class="form-control">
                                                                <option
                                                                        value="{{ $homeAddress->district->id }}">
                                                                    {{ $homeAddress->district->district_name }}
                                                                </option>
                                                                @foreach($districts as $district)
                                                                    <option value="{{ $district->id }}">
                                                                        {{ $district->district_name }}
                                                                    </option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="form-group required">
                                                        <label class="col-md-12 col-sm-12
                                control-label">
                                                            Upazila
                                                        </label>
                                                        <div class="col-md-12 col-sm-12">
                                                            <select name="upazila_id"
                                                                    id="" class="form-control">
                                                                <option
                                                                        value="{{ $homeAddress->upazila->id }}">
                                                                    {{ $homeAddress->upazila->upazila_name }}
                                                                </option>
                                                                @foreach($upazilas as $upazila)
                                                                    <option value="{{ $upazila->id }}">
                                                                        {{ $upazila->upazila_name }}
                                                                    </option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="form-group required">
                                                        <label class="col-md-12 col-sm-12
                                control-label">
                                                            Address</label>
                                                        <div class="col-md-12 col-sm-12">
                                    <textarea rows="" id="input-enquiry"
                                              class="form-control"
                                              name="address">
                                        {{ $homeAddress->address }}
                                    </textarea>
                                                        </div>
                                                    </div>
                                                    <br>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-12 col-sm-12">
                                                        <button type="submit" class="btn
                                                btn-success">
                                                            Update
                                                        </button>
                                                        <button type="button" class="btn
                                                btn-danger"
                                                                data-dismiss="modal">Close
                                                        </button>
                                                    </div>

                                                </div>

                                            </form>
                                        </div>
                                    @endif

                                    <div class="modal-footer">

                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
                        {{--Home Address Update End--}}

                    </li>
                </ul>

            </div>
            {{--Home Address End--}}

            {{--Office Address Start--}}
            <div class="col-lg-4 col-md-4 col-sm-10 address">
                <ul class="address-information">

                    <li><h3>Office Address</h3></li>

                    <div id="officeAddress">
                        @if($officeAddress)
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Office Name</th>
                                <th></th>
                                <th>:</th>
                                <th></th>
                                <th>{{ $officeAddress->name }}</th>
                            </tr>
                            <tr>
                                <th>Office Mobile</th>
                                <th></th>
                                <th>:</th>
                                <th></th>
                                <th>{{ $officeAddress->mobile }}</th>
                            </tr>
                            <tr>
                                <th>Division</th>
                                <th></th>
                                <th>:</th>
                                <th></th>
                                <th>{{ $officeAddress->division->division_name }}</th>
                            </tr>
                            <tr>
                                <th>District</th>
                                <th></th>
                                <th>:</th>
                                <th></th>
                                <th>{{ $officeAddress->district->district_name  }}</th>
                            </tr>
                            <tr>
                                <th>Upzalia</th>
                                <th></th>
                                <th>:</th>
                                <th></th>
                                <th>{{ $officeAddress->upazila->upazila_name  }}</th>
                            </tr>
                            <tr>
                                <th>Address</th>
                                <th></th>
                                <th>:</th>
                                <th></th>
                                <th>{{ $officeAddress->address  }}</th>
                            </tr>
                            </thead>
                        </table>
                        @else
                        <h1>Not Added Yet :)</h1>
                        @endif
                    </div>

                    <li class="address-update">
                        @if(!$officeAddress)
                            <a class="btn btn-warning btn-block" data-toggle="modal"
                               href="#office_address{{ $user->id }}"
                               style="float: right;">
                                Add Office Address
                            </a>
                        @else
                            <a class="btn btn-warning btn-block" data-toggle="modal"
                               href="#update_office_address{{ $user->id }}"
                               style="float: right;">
                                Update Office Address
                            </a>
                        @endif

                        {{--Office Address Add--}}
                        <div class="modal fade" id="office_address{{ $user->id }}">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close"
                                                data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                        <h4 class="modal-title">Add Your Office Address</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form
                                                action="{{ route('user.office_address_add',$user->id) }}"
                                                method="post">
                                            @csrf
                                            <div class="row">
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        Office Name</label>
                                                    <div class="col-md-12 col-sm-12">
                                                    <input type="text" class="form-control"
                                                              name="name">
                                                    </input>
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        Office Mobile</label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <input type="text" class="form-control"
                                                               name="mobile">
                                                        </input>
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        Division
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="division_id" id=""
                                                                class="form-control">
                                                            @foreach($divisions as $division)
                                                                <option value="{{ $division->id }}">
                                                                    {{ $division->division_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        District
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="district_id"
                                                                id="" class="form-control">
                                                            @foreach($districts as $district)
                                                                <option value="{{ $district->id }}">
                                                                    {{ $district->district_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        Upazila
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="upazila_id"
                                                                id="" class="form-control">
                                                            @foreach($upazilas as $upazila)
                                                                <option value="{{ $upazila->id }}">
                                                                    {{ $upazila->upazila_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        Address</label>
                                                    <div class="col-md-12 col-sm-12">
                                                    <textarea rows="" id="input-enquiry"
                                                              class="form-control"
                                                              name="address">
                                                    </textarea>
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12 col-sm-12">
                                                    <button type="submit" class="btn
                                                    btn-success">
                                                        Add
                                                    </button>
                                                    <button type="button" class="btn
                                                    btn-danger"
                                                            data-dismiss="modal">Close
                                                    </button>
                                                </div>

                                            </div>

                                        </form>
                                    </div>
                                    <div class="modal-footer">

                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
                        {{--Office Address Add End--}}

                        {{--Office Address Update--}}
                        <div class="modal fade" id="update_office_address{{ $user->id }}">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close"
                                                data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                        <h4 class="modal-title">Update Your Home Address</h4>
                                    </div>
                                    @if($officeAddress)
                                    <div class="modal-body">
                                        <form action="{{ route('user.office_address_update',$user->id) }}" method="post">
                                            @csrf
                                            @method('PUT')
                                            <div class="row">
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        Office Name</label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <input type="text" class="form-control"
                                                               name="name"
                                                        value="{{ $officeAddress->name }}">
                                                        </input>
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        Office Mobile</label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <input type="text" class="form-control"
                                                               name="mobile"
                                                        value="{{ $officeAddress->mobile }}">
                                                        </input>
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        Division
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="division_id" id=""
                                                                class="form-control">
                                                            <option value="{{ $officeAddress->division->id }}">{{$officeAddress->division->division_name }}
                                                            </option>
                                                            @foreach($divisions as $division)
                                                                <option value="{{ $division->id }}">
                                                                    {{ $division->division_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        District
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="district_id"
                                                                id="" class="form-control">
                                                            <option
                                                                    value="{{ $officeAddress->district->id }}">
                                                                {{ $officeAddress->district->district_name }}
                                                            </option>
                                                            @foreach($districts as $district)
                                                                <option value="{{ $district->id }}">
                                                                    {{ $district->district_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        Upazila
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="upazila_id"
                                                                id="" class="form-control">
                                                            <option
                                                                    value="{{ $officeAddress->upazila->id }}">
                                                                {{ $officeAddress->upazila->upazila_name }}
                                                            </option>
                                                            @foreach($upazilas as $upazila)
                                                                <option value="{{ $upazila->id }}">
                                                                    {{ $upazila->upazila_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        Address</label>
                                                    <div class="col-md-12 col-sm-12">
                                    <textarea rows="" id="input-enquiry"
                                              class="form-control"
                                              name="address">
                                        {{ $officeAddress->address }}
                                    </textarea>
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12 col-sm-12">
                                                    <button type="submit" class="btn
                                                btn-success">
                                                        Update
                                                    </button>
                                                    <button type="button" class="btn
                                                btn-danger"
                                                            data-dismiss="modal">Close
                                                    </button>
                                                </div>

                                            </div>

                                        </form>
                                    </div>
                                    @endif
                                    <div class="modal-footer">

                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
                        {{--Home Address Update End--}}

                    </li>
                </ul>

            </div>
            {{--Office Address End--}}

            {{--Gift Address Start--}}
            <div class="col-lg-4 col-md-4 col-sm-10 address">
                <ul class="address-information">

                    <li><h3>Gift Address</h3></li>

                    <div id="officeAddress">
                        @if($giftAddress)
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Receiver Name</th>
                                    <th></th>
                                    <th>:</th>
                                    <th></th>
                                    <th>{{ $giftAddress->name }}</th>
                                </tr>
                                <tr>
                                    <th>Receiver Mobile</th>
                                    <th></th>
                                    <th>:</th>
                                    <th></th>
                                    <th>{{ $giftAddress->mobile }}</th>
                                </tr>
                                <tr>
                                    <th>Division</th>
                                    <th></th>
                                    <th>:</th>
                                    <th></th>
                                    <th>{{ $giftAddress->division->division_name }}</th>
                                </tr>
                                <tr>
                                    <th>District</th>
                                    <th></th>
                                    <th>:</th>
                                    <th></th>
                                    <th>{{ $giftAddress->district->district_name  }}</th>
                                </tr>
                                <tr>
                                    <th>Upzalia</th>
                                    <th></th>
                                    <th>:</th>
                                    <th></th>
                                    <th>{{ $giftAddress->upazila->upazila_name  }}</th>
                                </tr>
                                <tr>
                                    <th>Address</th>
                                    <th></th>
                                    <th>:</th>
                                    <th></th>
                                    <th>{{ $giftAddress->address  }}</th>
                                </tr>
                                </thead>
                            </table>
                        @else
                            <h1>Not Added Yet :)</h1>
                        @endif
                    </div>

                    <li class="address-update">
                        @if(!$giftAddress)
                            <a class="btn btn-warning btn-block" data-toggle="modal"
                               href="#gift_address{{ $user->id }}"
                               style="float: right;">
                                Add Gift Address
                            </a>
                        @else
                            <a class="btn btn-warning btn-block" data-toggle="modal"
                               href="#update_gift_address{{ $user->id }}"
                               style="float: right;">
                                Update Gift Address
                            </a>
                        @endif

                        {{--Gift Address Add--}}
                        <div class="modal fade" id="gift_address{{ $user->id }}">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close"
                                                data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                        <h4 class="modal-title">Add Your Gift Address</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form
                                                action="{{ route('user.gift_address_add',$user->id) }}"
                                                method="post">
                                            @csrf
                                            <div class="row">
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        Receiver Name</label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <input type="text" class="form-control"
                                                               name="name">
                                                        </input>
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        Receiver Mobile</label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <input type="text" class="form-control"
                                                               name="mobile">
                                                        </input>
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        Division
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="division_id" id=""
                                                                class="form-control">
                                                            @foreach($divisions as $division)
                                                                <option value="{{ $division->id }}">
                                                                    {{ $division->division_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        District
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="district_id"
                                                                id="" class="form-control">
                                                            @foreach($districts as $district)
                                                                <option value="{{ $district->id }}">
                                                                    {{ $district->district_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        Upazila
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="upazila_id"
                                                                id="" class="form-control">
                                                            @foreach($upazilas as $upazila)
                                                                <option value="{{ $upazila->id }}">
                                                                    {{ $upazila->upazila_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        Address</label>
                                                    <div class="col-md-12 col-sm-12">
                                                    <textarea rows="" id="input-enquiry"
                                                              class="form-control"
                                                              name="address">
                                                    </textarea>
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12 col-sm-12">
                                                    <button type="submit" class="btn
                                                    btn-success">
                                                        Add
                                                    </button>
                                                    <button type="button" class="btn
                                                    btn-danger"
                                                            data-dismiss="modal">Close
                                                    </button>
                                                </div>

                                            </div>

                                        </form>
                                    </div>
                                    <div class="modal-footer">

                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
                        {{--Gift Address Add End--}}

                        {{--Gift Address Update--}}
                        <div class="modal fade" id="update_gift_address{{ $user->id }}">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close"
                                                data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                        <h4 class="modal-title">Update Your Home Address</h4>
                                    </div>
                                    @if($giftAddress)
                                    <div class="modal-body">
                                        <form action="{{ route('user.gift_address_update',$user->id) }}" method="post">
                                            @csrf
                                            @method('PUT')
                                            <div class="row">
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        Office Name</label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <input type="text" class="form-control"
                                                               name="name"
                                                               value="{{ $giftAddress->name }}">
                                                        </input>
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                                control-label">
                                                        Office Mobile</label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <input type="text" class="form-control"
                                                               name="mobile"
                                                        value="{{ $giftAddress->mobile }}">
                                                        </input>
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        Division
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="division_id" id=""
                                                                class="form-control">
                                                            <option value="{{ $giftAddress->division->id }}">{{$giftAddress->division->division_name }}
                                                            </option>
                                                            @foreach($divisions as $division)
                                                                <option value="{{ $division->id }}">
                                                                    {{ $division->division_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        District
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="district_id"
                                                                id="" class="form-control">
                                                            <option
                                                                    value="{{ $giftAddress->district->id }}">
                                                                {{ $giftAddress->district->district_name }}
                                                            </option>
                                                            @foreach($districts as $district)
                                                                <option value="{{ $district->id }}">
                                                                    {{ $district->district_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        Upazila
                                                    </label>
                                                    <div class="col-md-12 col-sm-12">
                                                        <select name="upazila_id"
                                                                id="" class="form-control">
                                                            <option
                                                                    value="{{ $giftAddress->upazila->id }}">
                                                                {{ $giftAddress->upazila->upazila_name }}
                                                            </option>
                                                            @foreach($upazilas as $upazila)
                                                                <option value="{{ $upazila->id }}">
                                                                    {{ $upazila->upazila_name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-md-12 col-sm-12
                                control-label">
                                                        Address</label>
                                                    <div class="col-md-12 col-sm-12">
                                    <textarea rows="" id="input-enquiry"
                                              class="form-control"
                                              name="address">
                                        {{ $giftAddress->address }}
                                    </textarea>
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12 col-sm-12">
                                                    <button type="submit" class="btn
                                                btn-success">
                                                        Update
                                                    </button>
                                                    <button type="button" class="btn
                                                btn-danger"
                                                            data-dismiss="modal">Close
                                                    </button>
                                                </div>

                                            </div>

                                        </form>
                                    </div>
                                    @endif
                                    <div class="modal-footer">

                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
                        {{--Gift Address Update End--}}

                    </li>
                </ul>

            </div>
            {{--Gift Address End--}}


        </div>
    </div>
</div>

<script>
function showAddHomeAddress() {
   $('#homeAddressAdd').show();
   $('#homeAddress').hide();
}
</script>