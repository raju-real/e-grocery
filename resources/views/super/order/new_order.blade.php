@extends('admin.layouts.app')
@section('title','New Order')
@push('css')

@endpush

@section('page-title','New Order')

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
    <div class="col-md-12" style="margin-top: 20px;">
        <div class="tile">
            <div class="tile-body">
                <table id="order-table" class="table table-striped table-bordered nowrap" style="width:100%">
                    <thead>
                    <tr>
                        <th class="text-center">Order No</th>
                        <th class="text-center">Order From</th>
                        <th class="text-center">Invoice</th>
                        <th class="text-center">User</th>
                        <th class="text-center">Payment On</th>
                        <th class="text-center">Total Amount</th>
                        <th class="text-center">Status</th>
                        <th class="text-center">Show</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($orders as $key=>$order)
                        <tr>
                            <td class="text-center">{{ $order->order_number }}</td>
                            <td class="text-center" style="color: brown;">
                                @if ($order->status == 1)
                                    {{ "Regular Order" }}
                                @elseif($order->status == 2)    
                                    {{ "Bazar List Order" }}
                                @endif
                            </td>
                            <td class="text-center">{{ $order->invoice }}</td>
                            <td class="text-center">
                                <a class="btn btn-info" data-toggle="modal" href='#user{{ $order->user->id }}'>View User</a>
                                <div class="modal fade" id="user{{ $order->user->id }}">
                                    <div class="modal-dialog">
                                        <div class="modal-content" style="width: 1000px;">
                                            
                                            <div class="modal-body">
                                                <table class="table table-hover">
                                                    <thead>
                                                    <tr>
                                                        <th>Order Date</th>
                                                        <th>:</th>
                                                        <th>{{ $order->created_at->format('D M Y') }}</th>
                                                    </tr>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>:</th>
                                                            <th>{{ $order->user->name }}</th>
                                                        </tr>
                                                        <tr>
                                                            <th>Mobile</th>
                                                            <th>:</th>
                                                            <th>{{ $order->user->mobile }}</th>
                                                        </tr>
                                                        <tr>
                                                            <th>Address</th>
                                                            <th>:</th>
                                                            <th>{{ $order->address }}</th>
                                                        </tr>
                                                    </thead>
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="text-center">
                                {{ $order->payment }}
                            </td>
                            <td class="text-center">
                                {{ $order->total_price }}
                            </td>
                            <td class="text-center">
                                 @if($order->status == 1)
                                     <button class="btn btn-danger">
                                         Pending
                                     </button>
                                 @elseif ($order->status == 2)
                                    <button class="btn btn-info">
                                        Received
                                    </button>
                                 @elseif($order->status == 3)
                                    <button class="btn btn-success">
                                        On Process
                                    </button>

                                     @elseif($order->status == 4)
                                         <button class="btn btn-success">
                                             Delivered
                                         </button>
                                     @endif
                            </td>
                            <td class="text-center">
                                <a href="{{ route('super.order_view',$order->id) }}"
                                   class="btn btn-primary">
                                    <i class="fa fa-eye"></i>
                                </a>

                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                    <tfoot>
                    <tr>
                        <th class="text-center">Order No</th>
                        <th class="text-center">Order From</th>
                        <th class="text-center">Invoice</th>
                        <th class="text-center">User</th>
                        <th class="text-center">Payment On</th>
                        <th class="text-center">Total Amount</th>
                        <th class="text-center">Status</th>
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
            var table = $('#order-table').DataTable( {
                responsive: true
            } );

            new $.fn.dataTable.FixedHeader( table );
        } );
    </script>

@endpush
