@extends('admin.layouts.app')
@section('title','Category')
@push('css')
 
@endpush

@section('page-title','All Category')

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
<div class="col-md-12">
    {{-- <a href="{{ route('admin.category.create') }}" class="btn-lg btn btn-primary" style="float: right;">Add New Category</a> --}}
    <a class="btn btn-primary btn-sm" data-toggle="modal" href='#category_add' style="float: right;">
        <span><i class="fa fa-plus-circle"></i></span>
    Add New Category
    </a>
    <div class="modal fade" id="category_add">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 style="float: left;">Create A New Category</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                   <form action="{{ route('super.category.store') }}" method="POST" role="form" enctype="multipart/form-data" onsubmit="return storeValidation()">
                    @csrf
                       <div class="form-group">
                           <label for="">Category Name</label>
                           <input name="name" type="text" class="form-control" id="store_name" placeholder="Category Name" onkeypress="hideStoreNameError()">
                           <span id="store_name_error" style="display: none;"></span>
                       </div>
                       <div class="form-group">
                           <label for="">Category Icon</label>
                           <input name="icon" type="file" class="form-control" id="store_icon" onclick="hideStoreIconError()">
                           <span id="store_icon_error" style="display: none;"></span>
                       </div>
                       <div class="form-group">
                           <label for="">Category Image</label>
                           <input name="image" type="file" class="form-control" id="store_image" onclick="hideStoreImageError()">
                           <span id="store_image_error" style="display: none;"></span>
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
            <table id="category-table" class="table table-md table-striped table-bordered nowrap" style="width:100%">
        <thead>
            <tr>
                <th>Sl.No</th>
                <th>Name</th>
                <th>Sub Category</th>
                <th>Icon</th>
                <th>View Product</th>
                <th>Image</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach($categories as $key=>$category)
            <tr>
                <td>{{ $key+1 }}</td>
                <td>{{ $category->name }}</td>
                <td>
                    <a class="badge badge-info" data-toggle="modal"
                       href="#category_subcategory{{ $category->id }}">
                        Sub Categories ({{ $category->subcategories->count() }})
                    </a>
                    <div class="modal fade" id="category_subcategory{{ $category->id }}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" style="float: left;">
                                        Sub Categories Under 
                                        <span style="color: lawngreen;">
                                            {{ $category->name }}
                                        </span>
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <ul style="float: left;">
                                        @foreach($category->subcategories as $subcategory)
                                        <li>{{ $subcategory->name }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger"
                                            data-dismiss="modal">Close</button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </td>
                <td>
                    <img src="{{ asset('images/category/'.$category->icon) }}"
                         class="img-responsive" alt="Image" style="height: 80px;width: 100px;">
                </td>
                <td>
                    <a href="{{ route('super.category.show',$category->id)}}"
                       class="badge badge-primary">
                        View Product ({{ $category->products->count() }})
                    </a>
                </td>
                <td>
                    <img src="{{ asset('images/category/'.$category->image) }}"
                         class="img-responsive" alt="Image" style="height: 80px;width: 100px;">
                </td>
                <td>
                    <a class="badge badge-info" data-toggle="modal"
                       href='#category_edit{{ $category->id }}'>
                        <i class="fa fa-edit"></i></a>
                    <div class="modal fade" id="category_edit{{ $category->id }}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4>Edit Category&nbsp;&nbsp;-&nbsp;&nbsp;<span style="color: green;">
                                            {{ $category->name }}</span>
                                    </h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">
                                   <form action="{{ route('super.category.update',$category->id) }}" method="POST" role="form" enctype="multipart/form-data">
                                    @csrf
                                    @method('PUT')
                                       <div class="form-group">
                                           <label for="" style="float: left;">Category Name</label>
                                           <input name="name" type="text" class="form-control" id="" value="{{ $category->name }}">
                                       </div>

                                       <div class="form-group">
                                           <label for="" style="float: left;">
                                               Current Icon</label><br>
                                           <img src="{{ asset('images/category/'.$category->icon) }}" class="img-responsive" alt="Image" style="height: 200px;width: 250px;">
                                       </div>

                                       <div class="form-group">
                                           <label for="" style="float: left;">Change Icon</label>
                                           <input name="icon" type="file" class="form-control" id="">
                                       </div>

                                       <div class="form-group">
                                           <label for="" style="float: left;">Current Image</label><br>
                                           <img src="{{ asset('images/category/'.$category->image) }}" class="img-responsive" alt="Image" style="height: 200px;width: 250px;">
                                       </div>

                                       <div class="form-group">
                                           <label for="" style="float: left;">Change Image</label>
                                           <input name="image" type="file" class="form-control" id="">
                                       </div>

                                       <button type="submit" class="btn btn-primary" style="float: left;">Update</button>
                                       <button type="button" class="btn btn-danger" data-dismiss="modal"  style="float: right;">Close
                                        </button>
                                   </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="badge badge-danger waves-effect" type="button" onclick="deleteCategory({{ $category->id }})">
                        <i class="fa fa-trash"></i>
                    </button>
                    <form id="delete-form-{{ $category->id }}" action="{{ route('super.category.destroy',$category->id) }}" method="POST" style="display: none;">
                        @csrf
                        @method('DELETE')
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <th>Sl.No</th>
                <th>Name</th>
                <th>Sub Category</th>
                <th>Icon</th>
                <th>View Product</th>
                <th>Image</th>
                <th>Action</th>
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
    var takenName = document.getElementById("store_name");
    var takenImage = document.getElementById("store_image");
    var takenIcon = document.getElementById("store_icon");
    function storeValidation(){
        var name = takenName;
        var image = takenImage;
        var icon = takenIcon;
        if(name.value.trim() == ""){
            var message = document.getElementById("store_name_error");
            $('#store_name_error').show();
            message.innerHTML = "Name Field Is Required";
            message.style.color = "red";
            name.style.border = "1px solid red";
            return false;
        } else if(icon.value.trim() == ""){
            var message = document.getElementById("store_icon_error");
            $('#store_icon_error').show();
            message.innerHTML = "Icon Field Is Required";
            message.style.color = 'red';
            image.style.border = "1px solid red";
            return false;
        } else if(image.value.trim() == ""){
            var message = document.getElementById("store_image_error");
            $('#store_image_error').show();
            message.innerHTML = "Image Field Is Required";
            message.style.color = 'red';
            image.style.border = "1px solid red";
            return false;
        }  else {
            return true;
        }
    }

    function hideStoreNameError(){
        $('#store_name_error').hide();
        var name = takenName;
        name.style.border = '1px solid black';
    }
     function hideStoreImageError(){
        $('#store_image_error').hide();
        var image = tekenImage;
        image.style.border = '1px solid black';
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
        function deleteCategory(id) {
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
