@extends('admin.layouts.app')
@section('title','View Order'.'---'.$order->order_number)
@push('css')

@endpush

@section('page-title','View Order'.'---'.$order->order_number.'***'.'Order Date --'.$order->created_at->format('D M Y'))

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
    <div class="col-md-12" style="margin-top: 20px;">
        <div class="tile">
            <div class="tile-body">
                <table id="order-view-table" class="table table-striped table-bordered
                nowrap" style="width:100%">
                    <thead>
                    <tr>
                        <th class="text-center">Image</th>
                        <th class="text-center">Name</th>
                        <th class="text-center">Quantity</th>
                        <th class="text-center">Unit Price</th>
                        <th class="text-center">Order Price</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($findOrder as $key=>$f_order)
                        @php
                            $products = App\Model\Product::where('id',
                            $f_order->product_id)->get();
                        @endphp
                        @foreach($products as $product)
                        <tr>
                            <td class="text-center">
                                @php
                                    $image = DB::table('image_products')
                                    ->where('product_id',$product->id)->first();
                                @endphp
                                <img src="{{ asset('images/product/'.$image->image) }}"
                                     class="img-responsive" alt="Image"
                                     style="height: 50px;width: 50px;">
                            </td>
                            <td class="text-center">
                                {{ $product->product_name }} {{ " " }} 
                            </td>
                            <td class="text-center">
                                {{ $f_order->quantity }} 
                                 {{--@foreach ($product->units as $unit)--}}
                                    {{--{{ $unit->unit }}--}}
                                {{--@endforeach--}}
                            </td>

                            <td class="text-center">
                                {{ $f_order->unit_price }}
                            </td>
                            <td class="text-center">
                                {{ $f_order->total_price }}
                            </td>
                        </tr>
                    @endforeach
                        @endforeach
                    </tbody>
                    <tfoot>
                    <tr>
                        <th class="text-center">Image</th>
                        <th class="text-center">Name</th>
                        <th class="text-center">Quantity</th>
                        <th class="text-center">Unit Price</th>
                        <th class="text-center">Order Price</th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>

    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h2>Manage Order--
                    <span style="color: green;">
                       Current Status :
                        @if($order->status == 1)
                            <button class="btn btn-info">Pending</button>
                        @elseif($order->status == 2)
                            <button class="btn btn-primary">Received</button>
                        @elseif($order->status == 3)
                            <button class="btn btn-success">On Process</button>
                        @elseif($order->status == 4)
                            <button class="btn btn-warning">Delivered</button>
                        @elseif($order->status == 5)
                            <button class="btn btn-danger">Cancelled</button>
                        @endif
                    </span>
                <button class="btn btn-danger waves-effect"
                        type="button"
                        onclick="deleteOrder({{ $order->id }})" style="float: right;">
                    <i class="fa fa-trash"></i> Delete Order
                </button>
                </h2>
                <form
                        id="delete-form-{{ $order->id }}"
                        action="{{ route('super.delete_order',$order->id) }}"
                        method="POST"
                        style="display: none;">
                    @csrf
                    @method('DELETE')
                </form>
            </div>
            <div class="card-body">
                @if($order->status == 2 || $order->status == 3 || $order->status == 4)
                    <button class="btn btn-danger btn-lg"
                            style="float: left;background: black" disabled>
                        Receive Order
                    </button>

                    @else
                    <a href="{{ route('super.receive_order',$order->id) }}"
                       class="btn btn-warning btn-lg"
                       style="float: left;">
                        Rceive Order
                    </a>
                @endif

                @if($order->status == 1 || $order->status == 3 || $order->status == 4 )
                        <button class="btn btn-danger btn-lg"
                                style="float: left;margin-left: 10px;background: black"
                                disabled>
                            Process Order
                        </button>

                    @else
                        <a href="{{ route('super.process_order',$order->id) }}"
                           class="btn btn-primary btn-lg"
                           style="float: left;margin-left: 50px;">
                            Process Order
                        </a>

                    @endif

                    @if($order->status == 5 )
                        <button class="btn btn-danger btn-lg"
                                style="float: left;margin-left: 10px;background: black"
                                disabled>
                            Canclled Order
                        </button>
                    @else
                        <a href="{{ route('super.cancel_order',$order->id) }}"
                           class="btn btn-danger btn-lg"
                           style="float: left;margin-left: 50px;">
                            Cancle Order
                        </a>

                    @endif

                    @if($order->status == 1 || $order->status == 2 || $order->status == 4 || $order->status == 5)
                        <button class="btn btn-danger btn-lg"
                                style="float: left;margin-left: 10px;background: black"
                                disabled>
                            Make Invoice
                        </button>

                    @else
                        <a href="{{ route('super.make_invoice',$order->id) }}"
                           class="btn btn-info btn-lg"
                           style="float: left;margin-left: 50px;"  target="_blank">
                            Make Invioce
                        </a>

                    @endif

                    @if($order->status == 1 || $order->status == 2 || $order->status == 4 || $order->status == 5)
                        <button class="btn btn-danger btn-lg"
                                style="float: left;margin-left: 10px;background: black"
                                disabled>
                            Deliver Order
                        </button>
                    @else
                        <a href="{{ route('super.deliver_order',$order->id) }}"
                           class="btn btn-success btn-lg"
                           style="float: left;margin-left: 50px;">
                            Deliver Order
                        </a>
                @endif
            </div>
        </div>
    </div>
@endsection

@push('js')

    {{-- Default JS Part --}}
    <script>
        $(document).ready(function() {
            var table = $('#order-view-table').DataTable( {
                responsive: true
            } );

            new $.fn.dataTable.FixedHeader( table );
        } );
    </script>
    <script type="text/javascript">
        function deleteOrder(id) {
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
