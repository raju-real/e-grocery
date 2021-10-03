@extends('admin.layouts.app')
@section('title','Admin | Edit Inventory')
@push('css')


@endpush

@section('content')
    {{-- Unit Part --}}
    <div class="col-md-6">
        <div class="tile">
            <div class="tile-body">
                <form action="{{ route('super.inventory_update',$inventory->id) }}" method= "POST" class="form-horizontal form-label-left" >
                    @csrf
                    @method('PUT')
                    <input type="hidden" name="company_id">
                    <div class="item form-group">
                        <label class="" for="customer">Create Date </label>
                        <div class="">
                            <input onchange="setCreateDate()"
                                   value="{{ $inventory->create_date }}"
                                   id="datetimepicker" type="text"
                                   name="create_date" class="form-control">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="" for="name">Product
                            <span class="required">*</span></label>
                        <div class="">
                            <select id="set_product_name" onchange="setProductName()"
                                    name="product_id" class=" form-control"
                                    datasubt-show-ext="true" data-live-search="true">

                                <option value="{{ $inventory->product->id }}">
                                    {{ $inventory->product->product_name }}
                                </option>
                                <?php $products = DB::table('products')->get(); ?>
                                @foreach($products as $product)
                                    <option label= {{ $product->product_name }}
                                            value="{{ $product->id }}">
                                        {{ $product->product_name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="" for="quantity">Quantity
                            <span class="required">*</span></label>
                        <div class="">
                            <input onkeyup="setProductQuantity()" id="quantity"
                                   value="{{ $inventory->quantity }}"
                                   class="form-control"
                                   name="quantity" placeholder="Product Quantity"
                                   required="required" type="text">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="" for="buying_price">Buying Price
                            <span class="required">*</span></label>
                        <div class="">
                            <input onkeyup="setBuyingPrice()" name="buying_price"
                                   value="{{ $inventory->buying_price }}" type="text"
                                   id="buying_price" class="form-control"
                                   placeholder="Product Buying Price" required="required" >
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="" for="currency">Currency
                            <span class="required">*</span></label>
                        <div class="">
                            <select name="currency" class="selectpicker form-control">
                                <option value="{{ $inventory->currency }}">
                                    {{ $inventory->currency }}</option>
                                <option value="BDT">BDT</option>
                                <option value="USD">USD</option>
                            </select>
                        </div>
                    </div>


                    <div class="item form-group">
                        <label class="" for="selling_unit_price">Selling Unit Price
                            <span class="required">*</span></label>
                        <div class="">
                            <input onKeyup="setSsellingUnitPrice()" id="selling_unit_price"
                                   class="form-control"
                                   name="selling_unit_price"
                                   value="{{ $inventory->selling_unit_price }}"
                                   placeholder="Product Quantity" required="required"
                                   type="text">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="">
                            <button type="submit" class="btn btn-primary"
                                    onclick="alert('Are you Suer??')">
                                Update Inventory</button>
                            <a href="{{ route('super.inventory') }}"
                               class="btn btn-danger">Back</a>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>

    {{-- Size Part --}}
    <div class="col-md-6">
        <div class="tile">
            <table class="table" style="border: none;" border="0">
                <tbody>
                <tr>
                    <td style="font-weight: bold;border: none;">Product Create Date</td>
                    <td style="font-weight: bold;border: none;">:</td>
                    <td id="product_create_date" style="font-weight: bold;border: none;">
                        {{ $inventory->create_date }}
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold;border: none;">Product Name</td>
                    <td style="font-weight: bold;border: none;">:</td>
                    <td id="product_name" style="font-weight: bold;border: none;">
                        {{ $inventory->product->product_name }}
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold;border: none;">Product Quantity</td>
                    <td style="font-weight: bold;border: none;">:</td>
                    <td id="product_quantity" style="font-weight: bold;border: none;">
                        {{ $inventory->quantity }}
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold;border: none;">Buying Price</td>
                    <td style="font-weight: bold;border: none;">:</td>
                    <td id="product_buying_price" style="font-weight: bold;border: none;">
                        {{ $inventory->buying_price }}
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold;border: none;">Unit Price</td>
                    <td style="font-weight: bold;border: none;">:</td>
                    <td id="product_buying_unit_price" style="font-weight: bold;border: none;">
                        {{ $inventory->buying_unit_price }}
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold;border: none;">Selling Unit Price</td>
                    <td style="font-weight: bold;border: none;">:</td>
                    <td id="product_selling_unit_price" style="font-weight: bold;border: none;">
                        {{ $inventory->selling_unit_price }}
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold;border: none;">Total Selling  Price</td>
                    <td style="font-weight: bold;border: none;">:</td>
                    <td id="product_selling_price" style="font-weight: bold;border: none;">

                        {{ $inventory->selling_price }}
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold;border: none;">Probably Profit</td>
                    <td style="font-weight: bold;border: none;">:</td>
                    <td id="product_probably_profit" style="font-weight: bold;border: none;">
                        @php
                            $totalSellingPrice = $inventory->quantity * $inventory->selling_unit_price;
                            $profit = $totalSellingPrice - $inventory->buying_price;
                        @endphp
                        {{ $profit }}
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
@endsection

@push('js')

    <script type="text/javascript">
        $(document).ready(function() {
        });
        var productBuyingPrice = "<?php echo $inventory->buying_unit_price ?>";
        var productQuantity = "<?php echo $inventory->quantity ?>";
        var sellingUnitPrice= "<?php echo $inventory->selling_price ?>";

        function setCreateDate(){
            var createDate = document.getElementById("datetimepicker").value;
            document.getElementById("product_create_date").innerHTML = createDate;
        }

        function setProductName(){
            var productName = document.getElementById("set_product_name").value;

            document.getElementById("product_name").innerHTML= productName;
        }

        function setProductQuantity(){
            productQuantity = document.getElementById("quantity").value;
            document.getElementById("product_quantity").innerHTML= productQuantity;
            if(productBuyingPrice != undefined && productQuantity != undefined){
                getUnitPrice();
            }
            if(sellingUnitPrice != undefined && productQuantity != undefined){
                setTotalSellingPrice();
            }
        }

        function setBuyingPrice(){
            productBuyingPrice = document.getElementById("buying_price").value;
            document.getElementById("product_buying_price").innerHTML= productBuyingPrice;
            if(productBuyingPrice != undefined && productQuantity != undefined){
                getUnitPrice();
            }
        }

        function getUnitPrice(){
            var unitPrice = productBuyingPrice / productQuantity;
            document.getElementById("product_buying_unit_price").innerHTML =  unitPrice.toFixed(2);
        }

        function setSsellingUnitPrice(){
            sellingUnitPrice = document.getElementById("selling_unit_price").value;
            console.log(sellingUnitPrice);
            document.getElementById("product_selling_unit_price").innerHTML = sellingUnitPrice;
            if(sellingUnitPrice != undefined && productQuantity != undefined){
                if(sellingUnitPrice){
                    setTotalSellingPrice();
                }  else{
                    document.getElementById("product_probably_profit").innerHTML = "";
                    document.getElementById("product_selling_price").innerHTML = "";
                }
            }
        }

        function setTotalSellingPrice(){
            var totalSellingPrice = sellingUnitPrice * productQuantity;
            document.getElementById("product_selling_price").innerHTML = totalSellingPrice;
            if(totalSellingPrice){
                var probablyProfit = totalSellingPrice - productBuyingPrice;
                document.getElementById("product_probably_profit").innerHTML = probablyProfit;
            }

        }
    </script>

    // Date Picker
    <script src="{{ asset('assets/admin/date/build/jquery.datetimepicker.full.min.js') }}"></script>

    <script>
        $('#set_product_name').select2();
    </script>

    <script>
        jQuery('#datetimepicker').datetimepicker({
            timepicker:false,
            format:'Y-m-d'
            //autoclose : true;
        });
    </script>

@endpush

