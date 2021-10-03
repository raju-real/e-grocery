@extends('admin.layouts.app')
@section('title','Weekly offer Management')
@push('css')

@endpush

@section('page-title','Weekly offer Management')

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header"></div>
                    <div class="card-body">
                        <form action="{{ route('super.weekly_offer_search') }}" method="POST">
                            @csrf
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                       <label for="demoDate">Start Date</label>
                                        <input autocomplete="off" id="datetimepicker" type="text"
                                               name="start_date" class="form-control">
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="demoDate">End Date</label>
                                        <input autocomplete="off" id="datetimepicker1" type="text"
                                               name="end_date" class="form-control">
                                    </div>
                                </div>
                                
                                
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label></label>
                                        <button type="submit" class="btn btn-info
                                        btn-block">Search Product</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>        
                </div>
            </div>
            <div class="col-md-2">
                <a href="{{ route('super.weekly_offer.create') }}" class="btn btn-primary
                btn-block">
                    <i class="fa fa-plus"></i>
                    Add Offer
                </a>
            </div>
        </div>
    </div><hr>

    <div class="col-md-12" style="margin-top: 20px;">
        <div class="tile">
            <div class="tile-body">
                <table id="offer-table" class="table table-striped table-bordered nowrap" style="width:100%">
                    <thead>
                    <tr>
                        <th class="text-center">Sl.No</th>
                        <th class="text-center">Status</th>
                        <th class="text-center">Start Date</th>
                        <th class="text-center">End Date</th>
                        <th class="text-center">Product Name</th>
                        <th class="text-center">Regular Price</th>
                        <th class="text-center">Discount Price</th>
                        <th class="text-center">View Product</th>
                        <th class="text-center">Action</th>
                    </tr>
                    </thead>
                    <tbody>

                    @foreach($offers as $key=>$offer)
                        <tr>
                            <td class="text-center">{{ $key+1 }}</td>
                            <td class="text-center">
                                @if($offer->status == 1)
                                    <button class="btn btn-success">Active</button>
                                @elseif($offer->status == 2)
                                    <button class="btn btn-danger">In Active</button>

                                @endif
                            </td>
                            <td class="text-center">{{ $offer->start_date }}</td>
                            <td class="text-center">{{ $offer->end_date }}</td>
                            <td class="text-center">
                                {{ $offer->product->product_name }}
                            </td>
                            <td class="text-center">
                                {{ $offer->product->unit_price }}
                            </td>
                            <td class="text-center">
                                {{ $offer->offer_price }}
                            </td>
                            <td class="text-center">
                                <a href="{{ route('super.product.show',$offer->product->id) }}" class="btn btn-primary" target="new">View Product</a>
                            </td>
                            <td class="text-center">
                                <a class="btn btn-info"  href="{{ route('super.weekly_offer.edit',$offer->id) }}">
                                    <i class="fa fa-edit"></i></a>
                                
                                <button class="btn btn-danger waves-effect" type="button" onclick="deleteCategory({{ $offer->id }})">
                                    <i class="fa fa-trash"></i>
                                </button>
                                <form id="delete-form-{{ $offer->id }}" action="{{ route('super.weekly_offer.destroy',$offer->id) }}" method="POST" style="display: none;">
                                    @csrf
                                    @method('DELETE')
                                </form>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                    <tfoot>
                    <tr>
                        <th class="text-center">Sl.No</th>
                        <th class="text-center">Status</th>
                        <th class="text-center">Start Date</th>
                        <th class="text-center">End Date</th>
                        <th class="text-center">Product Name</th>
                        <th class="text-center">Regular Price</th>
                        <th class="text-center">Discount Price</th>
                        <th class="text-center">View Product</th>
                        <th class="text-center">Action</th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
@endsection

@push('js')

    {{-- Default JS Part --}}
    <script>
        $(document).ready(function() {
            var table = $('#offer-table').DataTable( {
                responsive: true
            } );

            new $.fn.dataTable.FixedHeader( table );
        } );
    </script>
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
            //autoclose : true;
        });
    </script>
 

    <script type="text/javascript">
        $('#categorySelect').select2();
        $('.editProductSelect').select2();
    </script>


    <script type="text/javascript">
        function deleteCategory(id) {
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
