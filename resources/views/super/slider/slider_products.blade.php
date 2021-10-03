@extends('admin.layouts.app')
@section('title','Slider Products')
@push('css')

@endpush

@section('page-title','Products on ---- '.$slider->title)

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
    <div class="col-md-12">
        {{-- <a href="{{ route('admin.popular.create') }}" class="btn-lg btn btn-primary" style="float: right;">Add New popular</a> --}}
        <a class="btn btn-success" data-toggle="modal" href='#popular_add' style="float: right;">
            <span><i class="fa fa-plus-circle"></i></span>
            Add Product On -- {{ $slider->title }}
        </a>
        <div class="modal fade" id="popular_add">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 style="float: left;">Add Product On -- {{ $slider->title }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="{{ route('super.slider_product_store') }}"
                              method="POST"
                              onsubmit="return storeValidation()">
                            @csrf
                            <input type="hidden" name="slider_id"
                                   value="{{ $slider->id }}">
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
                                <label for="">Price(Optional)</label>
                                <input type="text" name="offer_price" id="sliderPrice"
                                       class="form-control">
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

    <div class="col-md-12" style="margin-top: 20px;">
        <div class="tile">
            <div class="tile-body">
                <table id="popular-table" class="table table-striped table-bordered nowrap" style="width:100%">
                    <thead>
                    <tr>
                        <th class="text-center">Sl.No</th>
                        <th class="text-center">Product Name</th>
                        <th class="text-center">Image</th>
                        <th class="text-center">Regular Price</th>
                        <th class="text-center">Offer Price</th>
                        <th class="text-center">Status</th>
                        <th class="text-center">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach ($sliderProducts as $key=>$p_slider)
                        <tr>
                            <td class="text-center">{{ $key+1 }}</td>
                            <td class="text-center">
                                {{ $p_slider->product->product_name }}<br>
                                Current Price :{{ $p_slider->product->unit_price }} BDT
                            </td>
                            <td class="text-center">
                                <img src="{{ asset('images/product/'.$p_slider->product->image) }}" class="img-responsive" alt="Image" style="height: 100px;width: 100px;">
                            </td>
                            <td class="text-center">
                                 @if($p_slider->product->discount_price != null)
                                    {{ $p_slider->product->discount_price }} BDT
                                 @else
                                    {{ $p_slider->product->unit_price }} BDT
                                @endif
                            </td>
                            <td class="text-center">
                                {{ $p_slider->offer_price != null ? $p_slider->offer_price : '0'}} BDT
                            </td>
                            <td class="text-center">
                                {{ $p_slider->status == 1?'Active':'In Active' }}
                            </td>
                            <td class="text-center">
                                <a class="btn btn-info" data-toggle="modal"
                                   href='#slider_edit{{ $p_slider->id }}'>
                                    <i class="fa fa-edit"></i></a>
                                <div class="modal fade" id="slider_edit{{ $p_slider->id }}">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4>Edit product&nbsp;&nbsp;-&nbsp;&nbsp;
                                                    <span style="color: green;">
                                                        {{ $slider->title }}
                                                    </span>
                                                </h4>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">&times;</button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="{{ route('super.slider_product_update',$p_slider->id) }}"
                                                      method="POST" role="form" enctype="multipart/form-data">
                                                    @csrf
                                                    @method('PUT')
                                                    <input type="hidden" name="slider_id"
                                                    value="{{ $p_slider->slider_id }}">
                                                    <div class="form-group">
                                                        <label style="float: left;">
                                                            Take Product</label><br>
                                                        <select name="product_id"
                                                                class="form-control"
                                                                id="product2" style="width: 80%;float: left;">
                                                            <optgroup>
                                                                <option value="
{{ $p_slider->product->id }}">{{ $p_slider->product->product_name }}
                                                                    ({{ $p_slider->product->unit_price }})
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
                                                        <label for="" style="float: left;">Price
                                                        (Optional)</label>
                                                        <input type="text" name="offer_price" id=""
                                                               class="form-control" value="{{ $p_slider->offer_price }}">
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
                                <button class="btn btn-danger waves-effect" type="button" onclick="deletepopular({{ $p_slider->id }})">
                                    <i class="fa fa-trash"></i>
                                </button>
                                <form id="delete-form-{{ $p_slider->id }}" action="{{ route('super.slider_product_destroy',$p_slider->id) }}" method="POST" style="display: none;">
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
                        <th class="text-center">Product Name</th>
                        <th class="text-center">Image</th>
                        <th class="text-center">Regular Price</th>
                        <th class="text-center">Offer Price</th>
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
