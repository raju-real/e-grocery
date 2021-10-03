@extends('admin.layouts.app')
@section('title','Promotion Products')
@push('css')

@endpush

@section('page-title','Products on ---- '.$promotion->name)

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
    <div class="col-md-12">

        <a class="btn btn-success" data-toggle="modal" href='#popular_add' style="float: right;">
            <span><i class="fa fa-plus-circle"></i></span>
            Add Product On -- {{ $promotion->name }}
        </a>
        <div class="modal fade" id="popular_add">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 style="float: left;">Add Product On -- {{ $promotion->name }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="{{ route('super.promotion_product_store') }}"
                              method="POST"
                              onsubmit="return storeValidation()">
                            @csrf
                            <input type="hidden" name="promotion_id"
                                   value="{{ $promotion->id }}">
                            <div class="form-group">
                                <label>Take Product</label><br>
                                <select name="product_id" class="form-control" id="product" style="width: 100%;">
                                    <optgroup>
                                        <option value="">Select Product</option>
                                        @foreach ($products as $product)
                                            <option value="{{ $product->id }}">
                                                {{ $product->product_name }},----,
                                                Current Price : {{ $product->unit_price }}
                                            </option>
                                        @endforeach
                                    </optgroup>
                                </select>
                                <span id="product_error" style="display: none;"></span>
                            </div>

                            <div class="form-group">
                                <label for="">Price</label>
                                <input type="text" name="offer_price" id="promotionPrice"
                                       class="form-control">
                                <span id="price_error" style="display: none;"></span>
                            </div>

                            <div class="form-group">
                                <label for="">Status</label>
                                <select name="status" id="status" class="form-control">
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

    <div class="col-md-12 col-sm-12 col-lg-12" style="margin-top: 20px;">
        <div class="tile">
            <div class="tile-body">
                <table id="popular-table" class="table table-striped table-bordered nowrap" style="width:100%">
                    <thead>
                    <tr>
                        <th class="text-center">Sl.No</th>
                        <th class="text-center">Product Name</th>
                        <th class="text-center">Image</th>
                        <th class="text-center">Regular Price</th>
                        <th class="text-center">Promotion Price</th>
                        <th class="text-center">Status</th>
                        <th class="text-center">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach ($promotionProducts as $key=>$p_promotion)
                        <tr>
                            <td class="text-center">{{ $key+1 }}</td>
                            <td class="text-center">
                                {{ $p_promotion->product->product_name }}<br>
                            </td>
                            <td class="text-center">
                                <img src="{{ asset('images/product/'.$p_promotion->product->image) }}" class="img-responsive" alt="Image" style="height: 100px;width: 100px;">
                            </td>
                            <td class="text-center">
                                {{ $p_promotion->product->unit_price }} BDT
                            </td>
                            <td class="text-center">
                                {{ $p_promotion->offer_price }} BDT &nbsp;
                                <span style="color : darkgreen;font-weight: bold">
                                    ({{ $p_promotion->percentage }})
                                </span>
                            </td>
                            <td class="text-center">
                                {{ $p_promotion->status == 1?'Active':'In Active' }}
                            </td>
    <td class="text-center">
        <a class="btn btn-info" data-toggle="modal" href='#promotion_edit{{ $p_promotion->id }}'>
            <i class="fa fa-edit"></i></a>

        <button class="btn btn-danger waves-effect" type="button" onclick="deletepopular({{ $p_promotion->id }})">
            <i class="fa fa-trash"></i>
        </button>
        <form id="delete-form-{{ $p_promotion->id }}" action="{{ route('super.promotion_product_destroy',$p_promotion->id) }}" method="POST" style="display: none;">
            @csrf
            @method('DELETE')
        </form>
    </td>
                        </tr>
                        <div class="modal fade" id="promotion_edit{{ $p_promotion->id }}">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4>Edit popular&nbsp;&nbsp;-&nbsp;&nbsp;<span style="color: green;">
                                {{ $promotion->name }}</span></h4>
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="{{ route('super.promotion_product_update',$p_promotion->id) }}"
                                              method="POST" role="form" enctype="multipart/form-data">
                                            @csrf
                                            @method('PUT')
                                            <input type="hidden" name="promotion_id"
                                                   value="{{ $p_promotion->promotion_id }}">
                                            <div class="form-group">
                                                <label style="float: left;">
                                                    Take Product</label><br>
                                                <select name="product_id"
                                                        class="form-control"
                                                        id="product2" style="width: 80%;float: left;">
                                                    <optgroup>
                                                        <option value="{{ $p_promotion->product->id }}">
                                                            {{ $p_promotion->product->product_name }}
                                                            ({{ $p_promotion->product->unit_price }})
                                                        </option>
                                                        @foreach ($products as $product)
                                                            <option value="{{ $product->id }}">
                                                                {{ $product->product_name }}--
                                                                CR-- {{ $product->unit_price }}
                                                            </option>
                                                        @endforeach
                                                    </optgroup>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label for="" style="float: left;">Price</label>
                                                <input type="text" name="offer_price" id=""
                                                       class="form-control"
                                                       value="{{ $p_promotion->offer_price }}">
                                            </div>

                                            <div class="form-group">
                                                <label for="" style="float: left;">Status</label>
                                                <select name="status" id="" class="form-control">
                                                    <option value="1">Active</option>
                                                    <option value="0">In Active</option>
                                                </select>
                                            </div>

                                            <button type="submit" class="btn btn-primary" style="float: left;">Update</button>
                                            <button type="button" class="btn btn-danger" data-dismiss="modal"  style="float: right;">Close
                                            </button>
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
                        <th class="text-center">Product Name</th>
                        <th class="text-center">Image</th>
                        <th class="text-center">Regular Price</th>
                        <th class="text-center">Promotion Price</th>
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
    {{-- Form Validation Part --}}
    <script type="text/javascript">
        var takenName = document.getElementById("product");
        var takenPrice = document.getElementById('promotionPrice');
        function storeValidation(){
            var name = takenName;
            var price = takenPrice.value;
            if(name.value.trim() == ""){
                var message = document.getElementById("product_error");
                $('#product_error').show();
                message.innerHTML = "Select A Product";
                message.style.color = "red";
                name.style.border = "1px solid red";
                return false;
            } else if(price.trim() == ""){
                var message = document.getElementById("price_error");
                $('#price_error').show();
                message.innerHTML = "Price Need";
                message.style.color = "red";
                name.style.border = "1px solid red";
                return false;
            } else {
                return true;
            }
        }

        function hideStoreNameError(){
            $('#store_name_error').hide();
            var name = takenName;
            name.style.border = '1px solid black';
        }
    </script>

    {{-- Ajax Api Call--}}
    <script type="text/javascript">
        function getSubpopular(){
            $('#subpopular') .find('option') .remove() .end() .append('<option value="">Select Sub popular</option>').append('<option value="NULL">none</option>');
            var id = document.getElementById('popular').value;

            axios.get(`http://localhost/e_grocery/api/get_subpopular/${id}`)
                .then(function (response) {
                    var list = response.data;
                    var select = document.getElementById("subpopular");
                    for(i = 0; i < list.length ;i ++){
                        var el = document.createElement("option");
                        var subpopulars = list[i];
                        var subpopularName = subpopulars.name;
                        var subpopularId = subpopulars.id;
                        el.textContent = subpopularName;
                        el.value = subpopularId;
                        select.appendChild(el);
                    }
                });
        }
        function getSubSubpopular(){
            $('#subsubpopular') .find('option') .remove() .end() .append('<option value="">Select Sub Sub popular</option>').append('<option value="NULL">None</option>');
            var id = document.getElementById('subpopular').value;

            axios.get(`http://localhost/e_grocery/api/get_subsubpopular/${id}`)
                .then(function (response) {
                    var list = response.data;
                    var select = document.getElementById("subsubpopular");
                    for(i = 0; i < list.length ;i ++){
                        var el = document.createElement("option");
                        var subpopulars = list[i];
                        var subpopularName = subpopulars.name;
                        var subpopularId = subpopulars.id;
                        el.textContent = subpopularName;
                        el.value = subpopularId;
                        select.appendChild(el);
                    }
                });
        }
        function getProduct(){
            $('#product') .find('option') .remove() .end() .append('<option value="">Select  Product</option>');
            var popular_id = document.getElementById('popular').value;
            var subpopular_id = document.getElementById('subpopular').value;
            var subsubpopular = document.getElementById('subsubpopular').value;
            if(subsubpopular.trim() == ""){
                var subsubpopular_id = NULL;
            } else {
                var subsubpopular_id = subsubpopular;
            }


            axios.get(`http://localhost/e_grocery/api/get_product/${popular_id}/${subpopular_id}/${subsubpopular_id}`)
                .then(function (response) {
                    var list = response.data;
                    var select = document.getElementById("product");
                    for(i = 0; i < list.length ;i ++){
                        var el = document.createElement("option");
                        var products = list[i];
                        var productName = products.product_name;
                        var productId = products.id;
                        el.textContent = productName;
                        el.value = productId;
                        select.appendChild(el);
                    }
                });
        }
    </script>

    {{-- Default JS Part --}}
    <script type="text/javascript">
        $('#popular').select2();
        $('#subpopular').select2();
        $('#subsubpopular').select2();
        $('#product').select2();
        $('#product2').select2();
    </script>
    <script>
        $(document).ready(function() {
            var table = $('#popular-table').DataTable( {
                responsive: true
            } );

            new $.fn.dataTable.FixedHeader( table );
        } );
    </script>
    <script type="text/javascript">
        function deletepopular(id) {
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
