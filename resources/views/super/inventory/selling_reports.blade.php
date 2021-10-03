@extends('admin.layouts.app')
@section('title','Inventory Selling Reports')
@push('css')
    {{-- expr --}}
@endpush
@section('page-title','Selling Reports')
@section('content')
    <div class="col-md-6">
        <div class="tile">
            <div class="tile-body">
                <table class="table" style="border: none;" border="0">
                    <tbody>
                    <tr>
                        <td style="font-weight: bold;border: none;">Today Sell</td>
                        <td style="font-weight: bold;border: none;">:</td>
                        <td style="font-weight: bold;border: none;">
                            @php
                                $totalCost = 0;
                                $currency = "";
                                foreach($todayInventories as $inventory){
                                    $totalCost += $inventory->total_price;
                                    $currency = "BDT";
                                }
                            @endphp
                            {{ $totalCost }} {{ $currency }}
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;border: none;">Weekly Sell</td>
                        <td style="font-weight: bold;border: none;">:</td>
                        <td id="product_name" style="font-weight: bold;border: none;">
                            @php
                                $totalCost = 0;
                                $currency = "";
                                foreach($weeklyInventories as $inventory){
                                   $totalCost += $inventory->total_price;
                                    $currency = "BDT";
                                }
                            @endphp
                            {{ $totalCost }} {{ $currency }}
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;border: none;">Monthly Sell</td>
                        <td style="font-weight: bold;border: none;">:</td>
                        <td id="product_quantity" style="font-weight: bold;border: none;">
                            @php
                                $totalCost = 0;
                                $currency = "";
                                foreach($monthlyInventories as $inventory){
                                    $totalCost += $inventory->total_price;
                                    $currency = "BDT";
                                }
                            @endphp
                            {{ $totalCost }} {{ $currency }}
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="tile">
            <div class="tile-header">
                <h3>By Date Search</h3><hr>
            </div>
            <div class="tile-body">
            <form action="{{ route('super.selling_single_date') }}" method="post" role="form">
                @csrf
                <div class="form-group">
                    <label for="">Select Date</label>
                    <input autocomplete="off" id="datetimepicker3" type="text" name="date" class="form-control">
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="tile">
            <div class="tile-body">
                <div class="x_content">
                    <h4 class="text-center">Date Wise Search</h4>
                    <hr>
                    <form action="{{ route('super.selling_date_wise') }}" method="POST" class="form-horizontal form-label-left">
                        @csrf

                        <div class="item form-group">
                            <label class="" for="customer">From </label>
                            <div class="">
                                <input autocomplete="off" id="datetimepicker" type="text" name="from" class="form-control">
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="" for="customer">To</label>
                            <div class="">
                                <input autocomplete="off" id="datetimepicker2" type="text" name="to" class="form-control">
                            </div>
                        </div>
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="">
                                <button type="submit" class="btn btn-success">Submit</button>
                            </div>
                        </div>

                    </form>
                </div>

                <h4 class="text-center">Manual Search</h4>
                <hr>
                <a href="{{ route('super.today_selling_report') }}"
                   class="btn btn-info btn-block">Today Report</a>
                <a href="{{ route('super.weekly_selling_report') }}"
                   class="btn btn-success btn-block">Weekly Report</a>
                <a href="{{ route('super.monthly_selling_report') }}"
                   class="btn btn-primary btn-block">Monthly Report</a>
            </div>
            <br>
        </div>
    </div>

@endsection

@push('js')
    {{--  DataTable Jquery  --}}
    <script type="text/javascript">
        $(document).ready(function() {
            var table = $('#inventories').DataTable( {
                responsive: true
            } );

            new $.fn.dataTable.FixedHeader( table );
        } );
    </script>
    // Date Picker
    <script src="{{ asset('assets/admin/date/build/jquery.datetimepicker.full.min.js') }}"></script>
    <script>
        jQuery('#datetimepicker').datetimepicker({
            timepicker:false,
            format:'Y-m-d'
            //autoclose : true;
        });
    </script>
    <script>
        jQuery('#datetimepicker2').datetimepicker({
            timepicker:false,
            format:'Y-m-d'
        });
    </script>
    <script>
        jQuery('#datetimepicker3').datetimepicker({
            timepicker:false,
            format:'Y-m-d'
        });
    </script>
    <script src="https://unpkg.com/sweetalert2@7.19.1/dist/sweetalert2.all.js"></script>
    <script type="text/javascript">
        function deleteinventory(id) {
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
