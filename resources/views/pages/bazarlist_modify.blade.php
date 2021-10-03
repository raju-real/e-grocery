@extends('user.layouts.app')
@section('title','Modify Bazar List')
@push('css')
    {{-- expr --}}
@endpush

@section('category_menu')
    @include('user.layouts.hidden_category_menu')
@endsection

@section('content')

    <!--Cart Main Area Start-->
    <div class="cart-main-area area-padding">
        <div class="container">
             <div class="row">
                <div class="col-xs-12">
                    <div class="breadcrumb" style="font-weight: bold;font-size: 18px;">
                        <a href="{{ route('home') }}"><i class="fa fa-home"></i>Home</a>
                        <span class="navigation-pipe"><i class="fa fa-angle-right"></i></span>
                        <span class="navigation_page">Modify Bazar List</span>
                         <a class="btn btn-primary" data-toggle="modal" href='#bazar_list_add' style="float: right;margin-bottom: 30px;background-color: green;color:white;">
                            <span><i class="fa fa-plus-circle"></i></span>
                            Add New Item On Bazar List
                        </a>

                    </div>
                </div>
            </div>
            <div class="modal fade" id="bazar_list_add">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 style="float: left;">Add New Item On Bazar List</h4>
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-hidden="true">&times;
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="{{ route('add_bazar_list') }}"
                                              method="POST">
                                            @csrf
                                            <div class="form-group">
                                                <label>Product</label><br>
                                                <select name="product_id"
                                                        class="form-control"
                                                        id="productSelect" style="width: 100%;">
                                                    <option value="">
                                                        Select Product
                                                    </option>
                                                    @php
                                                        $products = DB::table('products')->get();
                                                    @endphp
                                                    @foreach($products as $product)
                                                        <option
                                                                value="{{ $product->id }}">
                                                            {{ $product->product_name }}
                                                            ---- Price :
                                                            {{ $product->discount_price!= null ? $product->discount_price : $product->unit_price }}
                                                        </option>
                                                    @endforeach
                                                </select>

                                            </div>

                                            <div class="form-group">
                                                <label for="">Quantity</label>
                                                <input name="quantity" type="text"
                                                       class="form-control"
                                                       id="quantity"
                                                       placeholder="Set Quantity">

                                            </div>

                                            <button type="submit"
                                                    class="btn btn-primary">
                                                Submit</button>
                                            <button type="button" class="btn btn-danger"
                                                    data-dismiss="modal">Close</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">

                    <form action="#">
                        <div class="cart-table table-responsive">
                            @if(sizeof($lists) > 0)
                            <table>
                                <thead>
                                <tr>
                                    <th class="p-image">Product Image</th>
                                    <th class="p-name">Product Name</th>
                                    <th class="p-amount">Unit Price</th>
                                    <th class="p-quantity">Qty</th>
                                    <th class="p-total">SubTotal</th>
                                    <th class="p-times"></th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($lists as $list)
                                @php
                                    if($list->product->discount_price != null){
                                        $price =  $list->product->discount_price; }
                                    else{
                                         $price = $list->product->unit_price ;
                                    }
                                $is_read = true;
                                @endphp
                                        <tr>
                                            <td class="p-image">
                                                <a>
                                                    <img alt="" src="{{ asset('images/product/'
                                         .$list->product->image) }}" class="floatleft"
                                                         style="height: 70px;width: 95px;">
                                                </a>
                                            </td>
                                            <td class="p-name">
                                                {{ $list->product->product_name }}

                                            </td>

                                            <td class="p-amount">
                                                <i class="fb-taka"></i>
                                                {{ $list->unit_price }}
                                            </td>
                                            <td>
                                                {{--<input maxlength="12" type="text"--}}
                                                       {{--value="{{ $list->quantity }}"--}}
                                                       {{--name="quantity">--}}
                                                <a href="{{ route('decrement_list_quantity',$list->id,$product->id) }}"
                                                   class="btn btn-danger">
                                                    -
                                                </a>
                                                <p class="btn btn-warning">{{ $list->quantity }}</p>
                                                <a href="{{ route('increment_list_quantity',$list->id) }}"
                                                   class="btn btn-danger">
                                                    +
                                                </a>
                                            </td>
                                            <td class="p-total">
                                                {{ $list->total_price }}
                                            </td>
                                            <td class="p-action">
                                        <a href="{{ route('delete_bazarlist_item',$list->id) }}">
                                            <i class="fa fa-times"></i>
                                        </a>
                                            </td>
                                        </tr>
                                @endforeach
                                </tbody>
                            </table>
                            @else
                                <h2>No Item Added On Your Bazar List</h2>
                            @endif
                            <div class="all-cart-buttons">

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">

                            </div>
                            <div class="col-md-4">

                            </div>
                            <div class="col-md-4">
                                <div class="amount-totals">
                                    <p class="total">
                                        Subtotal
                                        @php
                                            $totalPrice = 0;
                                            foreach($lists as $list){
                                                $totalPrice += $list->total_price;
                                            }
                                        @endphp
                                        <span>
                                            <i class="fb-taka"></i>
                                         {{ $totalPrice }}
                                     </span>
                                    </p>

                                    <button class="button" type="button">
                                        <span><a href="{{ route('checkout',2) }}"
                                                 style="color: white;">
                                             Procced to checkout
                                         </a></span>
                                    </button>
                                    <div class="clearfix"></div>
                                    <p class="floatright">Checkout with multiples address</p>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--End of Cart Main Area-->
@endsection

@push('js')
    <script type="text/javascript">
        $('#productSelect').select2();
    </script>
@endpush
