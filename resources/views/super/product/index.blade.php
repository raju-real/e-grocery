@extends('admin.layouts.app')
@section('title', 'Our Product List')

@push('css')
	{{-- expr --}}
@endpush

@section('page-title', 'Our Products')

@section('count-topbar')
	{{-- @include('admin.layouts.count_topbar') --}}
@endsection

@section('content')
	<div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        Search Product
                        <a  href="{{ route('super.product.create') }}" class="btn btn-primary btn-sm pull-right">
                            <i class="fa fa-plus"></i>
                            Add New Product
                        </a>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('super.product.index') }}" method="GET">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="">Product Name</label>
                                        <input type="text" 
                                            class="form-control"
                                            name="product_name" id=""
                                            placeholder="Product Name">
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        @php
                                            $categories = DB::table('categories')->get();
                                        @endphp
                                        <label>Select Category</label>
                                        <select name="category_id" id="category" class="form-control" onchange="getSubcategory()">
                                            <option value="">Select Category</option>
                                            @foreach ($categories as $category)
                                                <option value="{{ $category->id }}">
                                                    {{ $category->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                            <label>Sub Category</label>
                                            <select name="subcategory_id" class="form-control"
                                                    id="subcategory" onchange="getSubSubcategory()">
                                                <optgroup>
                                                    <option value="" >
                                                        Sub Category
                                                    </option>
                                                </optgroup>
                                            </select>
                                        </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                            <label>Sub Sub Category</label>
                                            <select name="subsubcategory_id"
                                                    class="form-control" id="subsubcategory">
                                                <optgroup>
                                                    <option value="" >
                                                        Sub Sub Category
                                                    </option>
                                                </optgroup>
                                            </select>
                                        </div>
                                </div>
                                <div class="col-md-1">
                                    <div class="form-group">
                                        <label for="status">Status</label>
                                        <select id="status" class="form-control" name="status">
                                        <option selected disabled>Select one</option>
                                        <option value="1">Active</option>
                                        <option value="0">In Active</option>
                                      </select>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label></label>
                                        <button type="submit" class="btn btn-info btn-block mt-2">Search</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>        
                </div>
            </div>

<div class="col-md-12 mt-2">
	<div class="tile">
		<div class="tile-body">
			<table id="product-table" class="table table-striped table-md table-bordered nowrap" style="width:100%">
				<thead>
		            <tr>
		                <th>Code</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Company</th>
		                <th>Cat & Sub Cat</th>
                        <th>Price</th>
                        <th>Product Images</th>
		                <th>Action</th>
		            </tr>
        		</thead>
        		<tbody>
            @foreach($products as $key=>$product)
            <tr>
                <td>{{ $product->product_code }}</td>
                <td>
                    {{ $product->product_name }}
                </td>
                <td>{{ $product->quantity }}</td>
                <td>
                    <a class="badge badge-info" data-toggle="modal" href="#company{{ $product->id }}"><i class="fa fa-eye"></i></a>
                    <div class="modal fade" id="company{{ $product->id }}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                </div>
                                <div class="modal-body">
                                    @if($product->company_id != null)
                                        @php
                                            $company = App\Model\Company::where('id',$product->company_id)->first();
                                        @endphp
                                        {{ $company? $company->company_name :'Personal' }}
                                    @else {{ '' }}
                                    @endif
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="badge badge-danger" data-dismiss="modal">Close</button>

                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->

                </td>
                <td>
                    <a class="badge badge-primary" data-toggle="modal"
                       href="#cat{{ $product->id }}"><i class="fa fa-eye"></i></a>
                    <div class="modal fade" id="cat{{ $product->id }}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                </div>
                                <div class="modal-body">
                        <h6>Category : {{ $product->category->name }}</h6>
                    @if($product->subcategory_id != null)
                        @php
    $subcategory = App\Model\Subcategory::where('id',$product->subcategory_id)->first();
                        @endphp
                        <h6>Sub Category : {{ $subcategory ? $subcategory->name : '' }}</h6>
                    @endif
                    @if($product->subsubcategory_id != null)
                        @php
    $subsubcategory = App\Model\Subsubcategory::where('id',$product->subsubcategory_id)->first();
                        @endphp
                        <h6>Sub Sub Category : {{ $subsubcategory ? $subsubcategory->name : '' }}</h6>
                    @endif
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="badge badge-danger"
                                            data-dismiss="modal">Close</button>

                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </td>
                <td>
                    <a class="badge badge-primary" data-toggle="modal"
                       href="#price{{ $product->id }}"><i class="fa fa-eye"></i></a>
                    <div class="modal fade" id="price{{ $product->id }}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                </div>
                                <div class="modal-body">
                                    <h6>Unit Price : {{ $product->unit_price }} tk</h6>
                                    <h6>Discount Price: {{ $product->discount_price != null ? $product->discount_price : '0' }} tk</h6>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="badge badge-danger"
                                            data-dismiss="modal">Close</button>

                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </td>

                <td>
                    <a class="badge badge-primary" data-toggle="modal" href='#product-images{{ $product->id }}' 
                    title="Product Images">
                        Images
                    </a>
                    <div class="modal fade" id="product-images{{ $product->id }}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <p>Images For -- {{ $product->product_name }}</p>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">

                                    <h4>Product Images</h4>
                                    <hr>
                                    @php
                                        $images = App\Model\ImageProduct::where('product_id',$product->id)->get();
                                    @endphp
                                    @foreach ($images as $image)
                                       <img src="{{ asset('images/product/'.$image->image) }}" class="img-responsive" alt="Image" style="height: 100px;width: 100px;margin-left: 10px;">
                                    @endforeach
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="badge badge-danger" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>

                <td>
                    <a href="{{ route('super.product.show',$product->id) }}" class="badge badge-info" title="Product Info">
                        <i class="fa fa-eye"></i>
                    </a>
                    <a href="{{ route('super.product.edit',$product->id) }}" class="badge badge-primary" title="Update Product">
                        <i class="fa fa-edit"></i>
                    </a>
                    <button class="badge badge-danger waves-effect" type="button" onclick="deleteProduct({{ $product->id }})" title="Delete Product">
                        <i class="fa fa-trash"></i>
                    </button>
                    <form id="delete-form-{{ $product->id }}"
                          action="{{ route('super.product.destroy',$product->id) }}"
                          method="POST" style="display: none;">
                        @csrf
                        @method('DELETE')
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <th>Code</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>Company</th>
                <th>Cat & Sub Cat</th>
                <th>Price</th>
                <th>Product Images</th>
                <th>Action</th>
            </tr>
        </tfoot>
			</table>
            {{--Pagination Start--}}
            {{ $products->links() }}
            {{--Paginaiton End--}}
		</div>
	</div>
</div>
@endsection

@push('js')
{{-- Validation Part --}}

<script type="text/javascript">
     function getSubcategory(){
        $('#subcategory') .find('option') .remove() .end() .append('<option value="">Select Sub Category</option>');
        var id = document.getElementById('category').value;

         axios.get(`/api/get_subcategory/${id}`)
        .then(function (response) {
            var list = response.data;
            var select = document.getElementById("subcategory");
            for(i = 0; i < list.length ;i ++){
                var el = document.createElement("option");
                var subcategorys = list[i];
                var subcategoryName = subcategorys.name;
                var subcategoryId = subcategorys.id;
                el.textContent = subcategoryName;
                el.value = subcategoryId;
                select.appendChild(el);
            }
        });
    }   
     function getSubSubcategory(){
        $('#subsubcategory') .find('option') .remove() .end() .append('<option value="">Select Sub Category</option>');
        var id = document.getElementById('subcategory').value;

         axios.get(`/api/get_subsubcategory/${id}`)
        .then(function (response) {
            var list = response.data;
            var select = document.getElementById("subsubcategory");
            for(i = 0; i < list.length ;i ++){
                var el = document.createElement("option");
                var subcategorys = list[i];
                var subcategoryName = subcategorys.name;
                var subcategoryId = subcategorys.id;
                el.textContent = subcategoryName;
                el.value = subcategoryId;
                select.appendChild(el);
            }
        });
    }   
</script>

{{-- Default JS Part --}}
<script>
  $(document).ready(function() {
    var table = $('#product-table').DataTable( {
        "paging": true,
          "lengthChange": false,
          "searching": false,
          "ordering": true,
          "info": true,
          "autoWidth": false,
          "responsive": true,
    });

    new $.fn.dataTable.FixedHeader( table );
} );
</script>
    <script type="text/javascript">
        function deleteProduct(id) {
            swal({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel!',
                confirmButtonClass: 'badge badge-success',
                cancelButtonClass: 'badge badge-danger',
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
<script>
    $('#category').select2();
    $('#subcategory').select2();
    $('#subsubcategory').select2();
</script>
@endpush