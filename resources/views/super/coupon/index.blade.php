@extends('admin.layouts.app')
@section('title','Coupon Management')
@push('css')
 
@endpush

@section('page-title','Coupon Management')

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
<div class="col-md-12">
    {{-- <a href="{{ route('admin.category.create') }}" class="btn-lg btn btn-primary" style="float: right;">Add New Category</a> --}}
    <a class="btn btn-primary" data-toggle="modal" href='#category_add' style="float: right;">
        <span><i class="fa fa-plus-circle"></i></span>
    Create New Coupon
    </a>
    <div class="modal fade" id="category_add">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 style="float: left;">Add New Coupon</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                   <form action="{{ route('super.coupon.store') }}" method="POST" role="form">
                    @csrf
                      <div class="form-group">
                         <label for="">Coupon Code</label>
                         <input name="coupon_code" type="text" class="form-control">
                      </div>
                       <div class="form-group">
                           <label for="">Coupon Type</label>
                           <select name="coupon_type" class="form-control">
                             <option value="1"> Direct Amount</option>
                             <option value="2"> Percentage</option>
                           </select>
                       </div>
                       <div class="form-group">
                           <label for="">User Type</label>
                           <select name="coupon_type" class="form-control">
                             <option value="1">All User</option>
                             <option value="2">New User</option>
                             <option value="3">In Active User</option>
                           </select>
                       </div>
                       <div class="form-group">
                           <label for="">Discount</label>
                           <input name="discount_amount" type="text" class="form-control">
                       </div>
                       <div class="form-group">
                           <label for="">Minimum Cost</label>
                           <input name="minimum_cost" type="text" class="form-control">
                       </div>
                       <div class="form-group">
                          <label for="demoDate">Start Date</label>
                          <input autocomplete="off" id="datetimepicker" type="text" name="start_date" class="form-control">
                      </div>

                      <div class="form-group">
                          <label for="demoDate">End Date</label>
                          <input autocomplete="off" id="datetimepicker1" type="text" name="end_date" class="form-control">
                      </div>
                      <div class="form-group">
                        <label for="">Status</label>
                        <select name="status" class="form-control">
                          <option value="1">Active</option>
                          <option value="0">In Active</option>
                        </select>
                      </div>
                       <button type="submit" class="btn btn-primary">Submit</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                   </form>
                </div>
            </div>
        </div>
    </div>
</div><hr>

<div class="col-md-12" style="margin-top: 20px;">
  <div class="tile">
    <div class="tile-body">
        <table id="category-table" class="table table-striped table-bordered nowrap" style="width:100%">
        <thead>
            <tr>
                <th class="text-center">Sl.No</th>
                <th class="text-center">Coupon Code</th>
                <th class="text-center">Coupon Type</th>
                <th class="text-center">User Type</th>
                <th class="text-center">Discount</th>
                <th class="text-center">Min Amount</th>
                <th class="text-center">Start Date</th>
                <th class="text-center">Expire Date</th>
                <th class="text-center">Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach($coupons as $key=>$coupon)
            <tr>
                <td class="text-center">{{ $key+1 }}</td>
                <td class="text-center">{{ $coupon->coupon_code }}</td>
                <td class="text-center">
                    @if($coupon->coupon_type == 1)
                      {{ 'Direct Amount' }}
                    @elseif($coupon->coupon_type == 2)
                      {{ 'Percentage' }}
                    @endif  
                </td>
                <td class="text-center">
                  @if($coupon->user_type == 1)
                    {{ 'All User' }}
                  @elseif($coupon->user_type == 2)
                      {{ 'New User' }}
                  @elseif($coupon->user_type == 3)
                    {{ 'In Active User' }}
                  @endif
                </td>
                <td class="text-center">
                    {{ $coupon->discount_amount }}
                </td>
                <td class="text-center">
                    {{ $coupon->minimum_cost }}
                </td>
                <td class="text-center">
                    {{ $coupon->start_date }}
                </td>
                <td class="text-center">
                    {{ $coupon->end_date }}
                </td>
                <td class="text-center">
                  <a class="btn btn-primary" data-toggle="modal" href='#edit_coupon{{ $coupon->id }}'><i class="fa fa-edit"></i></a>
                  
                    <button class="btn btn-danger waves-effect" type="button" onclick="deleteCoupon({{ $coupon->id }})">
                        <i class="fa fa-trash"></i>
                    </button>
                    <form id="delete-form-{{ $coupon->id }}" action="{{ route('super.coupon.destroy',$coupon->id) }}" method="POST" style="display: none;">
                        @csrf
                        @method('DELETE')
                    </form>
                </td>
            </tr>
            <div class="modal fade" id="edit_coupon{{ $coupon->id }}">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h4 style="float: left;">Edit Coupon</h4>
                        </div>
                        <div class="modal-body">
                          <form action="{{ route('super.coupon.update',$coupon->id) }}" method="POST" role="form">
                            @csrf
                            @method('PUT')
                            <div class="form-group">
                               <label for="" style="float: left;">Coupon Code</label>
                               <input value="{{ $coupon->coupon_code }}" name="coupon_code" type="text" class="form-control">
                            </div>
                               <div class="form-group">
                                   <label for="" style="float: left;">Coupon Type</label>
                                   <select name="coupon_type" class="form-control">
                                    <option value="{{ $coupon->coupon_type }}">
                                      @if($coupon->coupon_type ==1 )
                                        {{ 'Direct Amount' }}
                                        @elseif($coupon->coupon_type == 2)
                                        {{ 'Percentage' }}
                                      @endif
                                    </option>
                                     <option value="1"> Direct Amount</option>
                                     <option value="2"> Percentage</option>
                                   </select>
                               </div>
                               <div class="form-group">
                                   <label for="">User Type</label>
                                   <select name="user_type" class="form-control">
                                      <option value="{{ $coupon->user_type }}">
                                        @if($coupon->user_type == 1)
                                          {{ 'All User' }}
                                          @elseif($coupon->user_type == 2)
                                            {{ 'New User' }}
                                         @elseif($coupon->user_type == 3)
                                          {{ 'In Active User' }}
                                         @endif
                                      </option>
                                      <option value="1">All User</option>
                                      <option value="2">New User</option>
                                      <option value="3">In Active User</option>
                                   </select>
                               </div>
                               <div class="form-group">
                                   <label for="" style="float: left;">Discount</label>
                                   <input value="{{ $coupon->discount_amount }}" name="discount_amount" type="text" class="form-control">
                               </div>
                               <div class="form-group">
                                   <label for="" style="float: left;">Minimum Cost</label>
                                   <input value="{{ $coupon->minimum_cost }} "name="minimum_cost" type="text" class="form-control">
                               </div>
                               <div class="form-group">
                                  <label for="demoDate" style="float: left;">Start Date</label>
                                  <input value="{{ $coupon->start_date }}" autocomplete="off" id="datetimepicker3" type="text" name="start_date" class="form-control">
                              </div>

                              <div class="form-group">
                                  <label for="demoDate" style="float: left;">End Date</label>
                                  <input value="{{ $coupon->end_date }}" autocomplete="off" id="datetimepicker4" type="text" name="end_date" class="form-control">
                              </div>
                              <div class="form-group">
                                <label for="" style="float: left;">Status</label>
                                <select name="status" class="form-control">
                                  <option value="{{ $coupon->status }}">
                                    {{ $coupon->status == 1 ? 'Active' : 'In Active' }}
                                  </option>
                                  <option value="1">Active</option>
                                  <option value="0">In Active</option>
                                </select>
                              </div>
                               <button type="submit" class="btn btn-primary">Update</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                           </form>
                        </div>
                      </div>
                    </div>
                  </div>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <th class="text-center">Sl.No</th>
                <th class="text-center">Coupon Code</th>
                <th class="text-center">Coupon Type</th>
                <th class="text-center">User Type</th>
                <th class="text-center">Discount</th>
                <th class="text-center">Min Amount</th>
                <th class="text-center">Start Date</th>
                <th class="text-center">Expire Date</th>
                <th class="text-center">Action</th>
            </tr>
        </tfoot>
        </table>
      </div>
  </div>
</div>
@endsection

@push('js')


{{-- Date Picker --}}
    <script src="{{ asset('assets/admin/date/build/jquery.datetimepicker.full.min.js') }}"></script>

    <script>
        jQuery('#datetimepicker').datetimepicker({
            timepicker:false,
            format:'Y-m-d'
            //autoclose : true;
        });

        jQuery('#datetimepicker1').datetimepicker({
            timepicker:false,
            format:'Y-m-d'
            //format:'Y-m-d H:m:s'
            //autoclose : true;
        });
         jQuery('#datetimepicker3').datetimepicker({
            timepicker:false,
            format:'Y-m-d'
            //autoclose : true;
        });

        jQuery('#datetimepicker4').datetimepicker({
            timepicker:false,
            format:'Y-m-d'
            //format:'Y-m-d H:m:s'
            //autoclose : true;
        });
    </script>

{{-- Default JS Part --}}
<script>
  $(document).ready(function() {
    var table = $('#category-table').DataTable( {
        responsive: true
    } );

    new $.fn.dataTable.FixedHeader( table );
} );
</script>
    <script type="text/javascript">
        function deleteCoupon(id) {
            swal({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel!',
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false,
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    event.preventDefault();
                    document.getElementById('delete-form-'+id).submit();
                } else if (
                    // Read more about handling dismissals
                    result.dismiss === swal.DismissReason.cancel
                ) {
                    swal(
                        'Cancelled',
                        'Your data is safe :)',
                        'error'
                    )
                }
            })
        }
    </script>
@endpush
