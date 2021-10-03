@extends('admin.layouts.app')
@section('title','Bazar List')
@push('css')

@endpush

@section('page-title','Bazar List')

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
    <div class="col-md-12">
        {{-- <a href="{{ route('admin.category.create') }}" class="btn-lg btn btn-primary" style="float: right;">Add New Category</a> --}}
        <a class="btn btn-primary" data-toggle="modal" href='#bazar_list_add' style="float: right;">
            <span><i class="fa fa-plus-circle"></i></span>
            Add New Item On Bazar List
        </a>
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
                        <form action="{{ route('super.bazar.store') }}" method="POST" enctype="multipart/form-data" onsubmit="return storeValidation()">
                            @csrf
                            <div class="form-group">
                                <label>Product</label><br>
                                <select name="product_id" class="form-control" id="categorySelect" style="width: 100%;">
                                    <optgroup>
                                        <option value="">Select Product</option>
                                        @php
                                            $products = DB::table('products')->where('discount_price',null)->get();
                                        @endphp
                                        @foreach($products as $product)
                                            <option value="{{ $product->id }}">
                                                {{ $product->product_name }} -- Price :
                                                {{ $product->unit_price }}
                                            </option>
                                        @endforeach
                                    </optgroup>
                                </select>
                                <span id="category_error" style="display: none;"></span>
                            </div>

                            <div class="form-group">
                                <label for="">Quantity</label>
                                <input name="quantity" type="text" class="form-control" id="store_name" placeholder="Quantity">
                                <span id="store_name_error" style="display: none;"></span>
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
                <table id="category-table" class="table table-striped table-bordered nowrap" style="width:100%">
                    <thead>
                    <tr>
                        <th class="text-center">Sl.No</th>
                        <th class="text-center">Product Name</th>
                        <th class="text-center">Image</th>
                        <th class="text-center">Current Price</th>
                        <th class="text-center">Quantity</th>
                        <th class="text-center">Total Price</th>
                        <th class="text-center">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($bazarLists as $key=>$list)
                        <tr>
                            <td class="text-center">{{ $key+1 }}</td>
                            <td class="text-center">{{ $list->product->product_name }}</td>
                            <td class="text-center">
                                <img src="{{ asset('images/product/'.$list->product->image) }}"
                                     class="img-responsive" alt="Image"
                                     style="height: 100px;width: 100px;">
                            </td>
                            <td class="text-center">
                                {{ $list->unit_price }}
                            </td>
                            <td class="text-center">
                                {{ $list->quantity }}
                            </td>
                            <td class="text-center">
                                {{ $list->total_price }}
                            </td>
                            <td class="text-center">
                                <a class="btn btn-info"
                                   href="{{ route('super.bazar.edit',$list->id) }}">
                                    <i class="fa fa-edit"></i></a>

                                <button class="btn btn-danger waves-effect" type="button"
                                        onclick="deleteList({{ $list->id }})">
                                    <i class="fa fa-trash"></i>
                                </button>
                                <form id="delete-form-{{ $list->id }}"
                                      action="{{ route('super.bazar.destroy',
                                      $list->id) }}" method="POST" style="display: none;">
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
                        <th class="text-center">Current Price</th>
                        <th class="text-center">Quantity</th>
                        <th class="text-center">Total Price</th>
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
        function storeValidation(){
            var takenName = document.getElementById("store_name");
            var takenCategory = document.getElementById("categorySelect");
            var SelectCategoryValue =  takenCategory.options[takenCategory.selectedIndex].value;;
            var name = takenName;

            if(SelectCategoryValue.trim() == ""){
                var message = document.getElementById("category_error");
                $('#category_error').show();
                message.innerHTML = "Category Field Is Required";
                message.style.color = 'red';
                return false;
            } else if(name.value.trim() == ""){
                var message = document.getElementById("store_name_error");
                $('#store_name_error').show();
                message.innerHTML = "Name Field Is Required";
                message.style.color = "red";
                takenName.style.border = "1px solid red";
                return false;
            }  else {
                return true;
            }
        }
    </script>

    {{-- Default JS Part --}}
    <script>
        $(document).ready(function() {
            var table = $('#category-table').DataTable( {
                responsive: true
            } );

            new $.fn.dataTable.FixedHeader( table );
        } );
    </script>
    <script type="text/javascript">
        $('#categorySelect').select2();
        $('#listProductEdit').select2();

    </script>
    <script type="text/javascript">
        function deleteList(id) {
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
