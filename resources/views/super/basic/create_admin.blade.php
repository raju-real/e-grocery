@extends('admin.layouts.app')
@section('title','Our Admins')
@push('css')

@endpush

@section('page-title','Our Admins')

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
    <div class="col-md-12" style="margin-top: 20px;">
        <div class="tile">
            <div class="tile-body">
                <form action="{{ route('super.admin.store') }}" method="POST"
                      role="form" enctype="multipart/form-data">
                    @csrf
                    <div class="form-group">
                        <label for="">Job Status</label>
                        <select name="job_status" class="form-control">
                            <option value="1">Job Running</option>
                            <option value="0">Job Not Running</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">Admin Name</label>
                        <input name="name" type="text" class="form-control"
                               placeholder="Admin Name">
                    </div>
                    <div class="form-group">
                        <label for="">Admin Email</label>
                        <input name="email" type="text" class="form-control"
                               placeholder="Admin Email">
                    </div>
                    <div class="form-group">
                        <label for="">Admin Mobile</label>
                        <input name="mobile" type="text" class="form-control"
                               placeholder="Admin Mobile">
                    </div>
                    <div class="form-group">
                        <label for="">Admin Designation</label>
                        <input name="designation" type="text" class="form-control"
                               placeholder="Admin Designation">
                    </div>
                    {{--<div class="form-group">--}}
                        {{--<label>Admin Permission</label>--}}
                        {{--<select name="roles[]" id="admin_roles" class="form-control"--}}
                                {{--multiple="" >--}}
                            {{--<option value="" selected="">Select Role</option>--}}
                            {{--@foreach ($roles as $role)--}}
                                {{--<option value="{{ $role->id }}">--}}
                                    {{--{{ $role->name }}--}}
                                {{--</option>--}}
                            {{--@endforeach--}}
                        {{--</select>--}}
                    {{--</div>--}}
                    <div class="row">
                        <div class="col-md-3 form-group">
                            <label for="">Product Management</label>
                            <select name="product_management" id="" class="form-control">
                                <option value="no">No</option>
                                <option value="yes">Yes</option>
                            </select>
                        </div>
                        <div class="col-md-3 form-group">
                            <label for="">Inventory Management</label>
                            <select name="inventory_management" id="" class="form-control">
                                <option value="no">No</option>
                                <option value="yes">Yes</option>
                            </select>
                        </div>
                        <div class="col-md-3 form-group">
                            <label for="">Order Management</label>
                            <select name="order_management" id="" class="form-control">
                                <option value="no">No</option>
                                <option value="yes">Yes</option>
                            </select>
                        </div>
                        <div class="col-md-3 form-group">
                            <label for="">Offer Management</label>
                            <select name="offer_management" id="" class="form-control">
                                <option value="no">No</option>
                                <option value="yes">Yes</option>
                            </select>
                        </div>
                        <div class="col-md-3 form-group">
                            <label for="">Coupon Management</label>
                            <select name="coupon_management" id="" class="form-control">
                                <option value="no">No</option>
                                <option value="yes">Yes</option>
                            </select>
                        </div>
                        <div class="col-md-3 form-group">
                            <label for="">BazarList Management</label>
                            <select name="bazarlist_management" id="" class="form-control">
                                <option value="no">No</option>
                                <option value="yes">Yes</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="">Admin Password</label>
                        <input name="password" type="text" class="form-control"
                               placeholder="Admin Password">
                    </div>
                    <div class="form-group">
                        <label for="">Admin Image</label>
                        <input name="image" type="file" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <a href="{{ route('super.admin.index') }}" class="btn btn-danger">Back</a>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('js')

    <script type="text/javascript">
        $('#admin_roles').select2();
        $('#admin_roles').on('change', function() {
            $("option[value='']").remove();

        });
    </script>
@endpush
