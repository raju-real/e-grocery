<div id="order" class="panel-collapse collapse in"
     role="tabpanel" aria-labelledby="headingOne">

    <div class="panel panel-success" style="padding: 15px;">
        <div class="panel-body">
            @php
                $user = Auth::user();
                $orders = App\Model\Order::with('products')->where('user_id',$user->id)
                ->latest()->paginate(5);
            @endphp
            @if(sizeof($orders)>0)
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Sl.No</th>
                    <th>Date</th>
                    <th>Invoice</th>
                    <th>Amount</th>
                    <th>View Products</th>
                    <th>Invoice</th>
                    <th>Current Status</th>
                </tr>
                </thead>
                <tbody>
                @foreach($orders as $key=> $order)
                <tr>
                    <td>{{ $key+1 }}</td>
                    <td>{{ $order->updated_at->format('D M y') }}</td>
                    <td>{{ $order->invoice }}</td>
                    <td>{{ $order->total_price }} BDT</td>
                    <td>
                        <a class="btn btn-primary" data-toggle="modal"
                           href="#view_products{{ $order->id }}">
                            View Products
                        </a>
                        <div class="modal fade" id="view_products{{ $order->id }}">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close"
                                                data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                        <h4 class="modal-title">
                                            Envoice: {{ $order->invoice }}
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                                        @php
                                            $findOrder = App\Model\OrderProduct::with('product')
                                            ->where('order_id',$order->id)
                                            ->get();
                                        @endphp
                                        <table class="table table-hover">
                                            <thead>
                                            <tr>
                                                <th>Sl.No</th>
                                                <th>Image</th>
                                                <th>Product</th>
                                                <th>Quantity</th>
                                                <th>Total Price</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($findOrder as $key => $f_order)
                                            <tr>
                                                <td>{{ $key + 1 }}</td>
                                                <td>
                                            {{--@php--}}
                                                {{--$image = DB::table('image_products')--}}
                                                {{--->where('product_id',$f_order->product->id)--}}
                                                {{--->first();--}}
                                            {{--@endphp--}}
                                                    <img src="{{ asset('images/product/'
                                                    .$f_order->product->image) }}"
                                                         class="img-responsive" alt="Product"
                                                         style="height: 100px;
                                                    width:100px;">
                                                </td>
                                                <td>{{ $f_order->product->product_name }}</td>
                                                <td>{{ $f_order->quantity }}</td>
                                                <td>{{ $f_order->total_price }}</td>
                                            </tr>
                                            @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger"
                                                data-dismiss="modal">Close
                                        </button>

                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
                    </td>
                    <td>
                        <a target="_blank" class="btn btn-info" href="{{ route('user.invoice',$order->id) }}">Invoice</a>
                    </td>
                    <td>
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
                </tr>
                @endforeach
                </tbody>
            </table>
                {{--Pagination Start--}}
                <nav aria-label="Page navigation example" style="float: right;">
                    <ul class="pagination pagination-lg">
                        <li class="page-item">{{ $orders->links() }}</li>
                    </ul>
                </nav>
                {{--Paginaiton End--}}
             @else
                <h2 class="btn btn-danger">You haven't Any Order Yet :)</h2>
             @endif
        </div>
    </div>
</div>
