@extends('admin.layouts.app')
@section('title','Popular Item')
@push('css')
 
@endpush

@section('page-title','All Popular Item')

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
<div class="col-md-12">
    {{-- <a href="{{ route('admin.popular.create') }}" class="btn-lg btn btn-primary" style="float: right;">Add New popular</a> --}}
    <a class="btn btn-primary" data-toggle="modal" href='#popular_add' style="float: right;">
        <span><i class="fa fa-plus-circle"></i></span>
    Add New Popular Item
    </a>
    <div class="modal fade" id="popular_add">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 style="float: left;">Create A New Popular Item</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('super.popular.store') }}" method="POST" 
                    onsubmit="return storeValidation()">
                        @csrf
                        {{-- <div class="form-group">
                            <label>Select popular</label><br>
                            <select name="product_id" class="form-control" id="popular" style="width: 100%;" onchange="getSubpopular()">
                                <optgroup>
                                    <option value="">Select popular</option>
                                    @foreach ($categories as $popular)
                                        <option value="{{ $popular->id }}">
                                            {{ $popular->name }}
                                        </option>
                                    @endforeach
                                </optgroup>
                            </select>
                        </div> --}}

                        {{-- <div class="form-group">
                            <label>Select Sub popular</label><br>
                            <select name="subpopular_id" class="form-control" id="subpopular" style="width: 100%;" onchange="getSubSubpopular()">
                                <optgroup>
                                    <option value="NULL" selected>Select Sub popular</option>
                                </optgroup>
                            </select>
                        </div> --}}

                        {{-- <div class="form-group">
                            <label>Select Sub Sub popular</label><br>
                            <select name="product_id" class="form-control" id="subsubpopular" style="width: 100%;" onchange="getProduct()">
                                <optgroup>
                                    <option value="NULL" selected>Select Sub Sub popular</option>
                                </optgroup>
                            </select>
                        </div> --}}

                        <div class="form-group">
                            <label>Take Product</label><br>
                            <select name="product_id" class="form-control" id="product" style="width: 100%;">
                                <optgroup>
                                    <option value="">Select Product</option>
                                    @foreach ($products as $product)
                                        <option value="{{ $product->id }}">
                                            {{ $product->product_name }}
                                        </option>
                                    @endforeach
                                </optgroup>
                            </select>
                            <span id="product_error" style="display: none;"></span>
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
                        <th class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($populars as $key=>$popular)
                        <tr>
                            <td class="text-center">{{ $key+1 }}</td>
                            <td class="text-center">{{ $popular->product->product_name }}</td>
                            <td class="text-center">
                                <img src="{{ asset('images/product/'.$popular->product->image) }}" class="img-responsive" alt="Image" style="height: 100px;width: 100px;">
                            </td>
                            <td class="text-center">
                    <a class="btn btn-info" data-toggle="modal" href='#popular_edit{{ $popular->id }}'>
                        <i class="fa fa-edit"></i></a>
                    <div class="modal fade" id="popular_edit{{ $popular->id }}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4>Edit popular&nbsp;&nbsp;-&nbsp;&nbsp;<span style="color: green;">{{ $popular->name }}</span></h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">
                                   <form action="{{ route('super.popular.update',$popular->id) }}" method="POST" role="form" enctype="multipart/form-data">
                                    @csrf
                                    @method('PUT')
                                       <div class="form-group">
                                            <label style="float: left;">Take Product</label><br>
                                            <select name="product_id" class="form-control" id="product2" style="width: 80%;float: left;">
                                                <optgroup>
                                                    <option value="{{ $popular->product->id }}">    {{ $popular->product->product_name }}
                                                    </option>
                                                    @foreach ($products as $product)
                                                        <option value="{{ $product->id }}">
                                                            {{ $product->product_name }}
                                                        </option>
                                                    @endforeach
                                                </optgroup>
                                            </select>
                                            <span id="product_error" style="display: none;"></span>
                                        </div>

                                       <button type="submit" class="btn btn-primary" style="float: left;">Update</button>
                                       <button type="button" class="btn btn-danger" data-dismiss="modal"  style="float: right;">Close
                                        </button>
                                   </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-danger waves-effect" type="button" onclick="deletepopular({{ $popular->id }})">
                        <i class="fa fa-trash"></i>
                    </button>
                    <form id="delete-form-{{ $popular->id }}" action="{{ route('super.popular.destroy',$popular->id) }}" method="POST" style="display: none;">
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
    function storeValidation(){
        var name = takenName;
        if(name.value.trim() == ""){
            var message = document.getElementById("product_error");
            $('#product_error').show();
            message.innerHTML = "Select A Product";
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
