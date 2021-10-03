@extends('admin.layouts.app')

@section('title','Edit Bazar List Item')

@push('css')
    @endpush



@section('content')
    <div class="col-md-12">
        <div class="tile">
            <div class="tile-body">
                <form action="{{ route('super.bazar.update',$list->id) }}" method="POST">
                    @csrf
                    @method('PUT')
                    <div class="form-group">
                        <label style="float: left;">
                            Product
                        </label>
                        <br>
                        <select name="product_id"
                                class="form-control"
                                id="listProductEdit"
                                style="width: 100%;">
                            <optgroup>
                                <option value="{{$list->product->id }}">
                                    {{ $list->product->product_name }}-- Price :
                                    {{ $list->product->unit_price }}
                                </option>
                                @php
                                    $products = DB::table('products')
                                    ->get();
                                @endphp
                                @foreach($products as
                                $product)
                                    <option value="{{$product->id }}">
                                        {{ $product->product_name }}-- Price :
                                        {{ $product->unit_price }}
                                    </option>
                                @endforeach
                            </optgroup>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="" style="float:left;">Quantity</label>
                        <input name="quantity" type="text" class="form-control"
                               placeholder="Quantity" value="{{ $list->quantity }}">
                    </div>

                    <button type="submit" class="btn btn-primary">Submit</button>
                    <a href="{{ route('super.bazar.index') }}" class="btn btn-danger"
                            data-dismiss="modal">Close
                    </a>
                </form>
            </div>
        </div>
    </div>
    @endsection


@push('js')
    <script>
        $('#listProductEdit').select2();
    </script>
    @endpush