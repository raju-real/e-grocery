@extends('admin.layouts.app')
@section('title','Admin | Create Inventory')
@push('css')


@endpush

@section('content')
    {{-- Unit Part --}}
    <div class="col-md-6">
        <div class="tile">
            <div class="tile-body">
                <form action="{{ route('super.inventory_store') }}" method= "POST">
                    @csrf
                    <div class="item form-group">
                        <label class="" for="customer">Create Date </label>
                        <div class="">
                            <input autocomplete="off" onchange="setCreateDate()" id="datetimepicker" type="text" name="create_date" class="form-control">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="" for="name">Product
                            <span class="required">*</span>
                        </label>
                        <div class="">
                            <select id="set_product_name" onchange="setProductName()" name="product_id" class="selectpicker form-control" datasubt-show-ext="true" data-live-search="true">
                                <?php $products = DB::table('products')->get(); ?>
                                <option>Select Product</option>
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
                        <label class="" for="quantity">Quantity <span class="required">*</span></label>
                        <div class="">
                            <input onkeyup="setProductQuantity()" id="quantity" class="form-control" name="quantity" placeholder="Product Quantity" required="required" type="text">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="" for="buying_price">Buying Price <span class="required">*</span></label>
                        <div class="">
                            <input onkeyup="setBuyingPrice()" name="buying_price" type="text" id="buying_price" class="form-control" placeholder="Product Buying Price" required="required" >
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="" for="currency">Currency <span class="required">*</span></label>
                        <div class="">
                            <select name="currency" class=" form-control" id="currency">
                                <option>Select Currency</option>
                                <option value="BDT">BDT</option>
                                <option value="USD">USD</option>
                            </select>
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="" for="selling_unit_price">Selling Unit Price <span class="required">*</span></label>
                        <div class="">
                            <input onKeyup="setSsellingUnitPrice()" id="selling_unit_price" class="form-control" name="selling_unit_price" placeholder="Product Quantity" required="required" type="text">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <button type="submit" class="btn btn-primary">Add Inventory</button>
                            <button type="reset" class="btn btn-success">Reset</button>
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
                    <td id="product_create_date" style="font-weight: bold;border: none;"></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;border: none;">Product Name</td>
                    <td style="font-weight: bold;border: none;">:</td>
                    <td id="product_name" style="font-weight: bold;border: none;"></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;border: none;">Product Quantity</td>
                    <td style="font-weight: bold;border: none;">:</td>
                    <td id="product_quantity" style="font-weight: bold;border: none;">
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold;border: none;">Buying Price</td>
                    <td style="font-weight: bold;border: none;">:</td>
                    <td id="product_buying_price" style="font-weight: bold;border: none;"></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;border: none;">Unit Price</td>
                    <td style="font-weight: bold;border: none;">:</td>
                    <td id="product_buying_unit_price" style="font-weight: bold;border: none;"></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;border: none;">Selling Unit Price</td>
                    <td style="font-weight: bold;border: none;">:</td>
                    <td id="product_selling_unit_price" style="font-weight: bold;border: none;"></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;border: none;">Total Selling  Price</td>
                    <td style="font-weight: bold;border: none;">:</td>
                    <td id="product_selling_price" style="font-weight: bold;border: none;"></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;border: none;">Probably Profit</td>
                    <td style="font-weight: bold;border: none;">:</td>
                    <td id="product_probably_profit" style="font-weight: bold;border: none;"></td>
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
        var productBuyingPrice;
        var productQuantity;
        var sellingUnitPrice;

        function setCreateDate(){
            var createDate = document.getElementById("datetimepicker").value;
            document.getElementById("product_create_date").innerHTML = createDate;
        }
        function setProductName(){
            //var productName = document.getElementById("set_product_name").value;
            var product = document.getElementById("set_product_name");
            var productName = product.options[product.selectedIndex].text;
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
            var takeCurrency = document.getElementById("currency");
            var currency = takeCurrency.options[takeCurrency.selectedIndex].text;
            var totalSellingPrice = sellingUnitPrice * productQuantity;
            document.getElementById("product_selling_price").innerHTML = totalSellingPrice;
            if(totalSellingPrice){
                var probablyProfit = totalSellingPrice - productBuyingPrice;
                var profit = document.getElementById("product_probably_profit");
                profit.innerHTML = probablyProfit + " " + currency;
            }

        }
    </script>

     {{-- Date Picker --}}
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

