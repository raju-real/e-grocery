@extends('admin.layouts.app')
@section('title','Sub Sub Category')
@push('css')
 
@endpush

@section('page-title','All Sub Sub Category')

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
<div class="col-md-12">
    {{-- <a href="{{ route('admin.category.create') }}" class="btn-lg btn btn-primary" style="float: right;">Add New Category</a> --}}
    <a class="btn btn-primary" data-toggle="modal" href='#category_add' style="float: right;">
        <span><i class="fa fa-plus-circle"></i></span>
    Add New Sub Category
</a>
    <div class="modal fade" id="category_add">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 style="float: left;">Create A New Sub Sub Category</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                   <form action="{{ route('super.subsubcategory.store') }}" method="POST" enctype="multipart/form-data" onsubmit="return storeValidation()">
                    @csrf
                        <div class="form-group">
                    <label>Sub Category</label><br>
                    <select name="subcategory_id" class="form-control" id="categorySelect" style="width: 100%;">
                        <optgroup>
                      <option value="">Select Sub Category</option>
                      @php
                          $categories = DB::table('subcategories')->get();
                      @endphp
                            @foreach($categories as $category)
                                <option value="{{ $category->id }}">
                                    {{ $category->name }}</option>
                             @endforeach
                        </optgroup>
                    </select>
                  <span id="category_error" style="display: none;"></span>
                  </div>

                       <div class="form-group">
                           <label for="">Sub Sub Category Name</label>
                           <input name="name" type="text" class="form-control" id="store_name" placeholder="Sub Sub Category Name">
                           <span id="store_name_error" style="display: none;"></span>
                       </div>

                       <div class="form-group">
                           <label for="">Sub Sub Category Image</label>
                           <input name="image" type="text" class="form-control" id="store_image" >
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
            <table id="category-table" class="table table-striped table-bordered nowrap" style="width:100%">
        <thead>
            <tr>
                <th class="text-center">Sl.No</th>
                <th class="text-center">Sub Sub Category</th>
                <th class="text-center">Image</th>
                <th class="text-center">View Product</th>
                <th class="text-center">Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach($subcategories as $key=>$sub_category)
            <tr>
                <td class="text-center">{{ $key+1 }}</td>
                <td class="text-center">
                    {{ $sub_category->name }}<br>
                    Under : <span style="color: green;">
                        <b>{{ $sub_category->subcategory->name }}</b>
                    </span>
                </td>
                <td class="text-center">
                    <img src="{{ asset('images/subsubcategory/'.$sub_category->image) }}"
                         class="img-responsive" alt="Image"
                         style="height: 100px;width: 100px;">
                </td>
                <td class="text-center">
                    <a href="{{ route('super.subsubcategory.show',$sub_category->id) }}" class="btn btn-primary">
                        View Product ({{ $sub_category->products->count() }})
                    </a>
                </td>
                <td class="text-center">
                    <a class="btn btn-info" data-toggle="modal" href='#category_edit{{ $sub_category->id }}'>
                        <i class="fa fa-edit"></i></a>
                    <div class="modal fade" id="category_edit{{ $sub_category->id }}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4>Edit Sub Category&nbsp;&nbsp;-&nbsp;&nbsp;<span style="color: green;">{{ $sub_category->name }}</span></h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">
                                   <form action="{{ route('super.subsubcategory.update',$sub_category->id) }}" method="POST" role="form" enctype="multipart/form-data">
                                    @csrf
                                       @method('PUT')
                                    <div class="form-group">
                                           <label for="" style="float: left;">Sub Sub Category Name</label>
                                           <select name="subcategory_id" id="" 
                                           class="sub form-control" style="width: 50%;">
                                               <option value="{{ $sub_category->subcategory->id }}">{{ $sub_category->subcategory->name }}</option>
                                               @php
                                                   $categories = DB::table('subcategories')->get();
                                               @endphp
                                               @foreach ($categories as $category)
                                                   <option value="{{ $category->id }}">{{ $category->name }}</option>
                                               @endforeach
                                           </select>
                                       </div>

                                       <div class="form-group">
                                           <label for="" style="float: left;">Sub Category Name</label>
                                           <input name="name" type="text" class="form-control" value="{{ $sub_category->name }}">
                                       </div>

                                       <div class="form-group">
                                           <label for="" style="float: left;">Current Image</label><br>
                                           <img src="{{ asset('images/subsubcategory/'.$sub_category->image) }}" class="img-responsive" alt="Image" style="height: 200px;width: 250px;">
                                       </div>

                                       <div class="form-group">
                                           <label for="" style="float: left;">Sub Category Name</label>
                                           <input name="image" type="file" class="form-control" >
                                       </div>
                                       
                                       <button type="submit" class="btn btn-primary">Submit</button>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                   </form> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button class="btn btn-danger waves-effect" type="button" onclick="deleteCategory({{ $sub_category->id }})">
                                        <i class="fa fa-trash"></i>
                                    </button>
                                    <form id="delete-form-{{ $sub_category->id }}" action="{{ route('super.subsubcategory.destroy',$sub_category->id) }}" method="POST" style="display: none;">
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
                <th class="text-center">Sub Sub Category Name</th>
                <th class="text-center">Image</th>
                <th class="text-center">View Product</th>
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
        var takenImage = document.getElementById("store_image");
        var takenCategory = document.getElementById("categorySelect");
        var SelectCategoryValue =  takenCategory.options[takenCategory.selectedIndex].value;;
        var name = takenName;
        var image = takenImage;

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
        } else if(image.value.trim() == ""){
            var message = document.getElementById("store_image_error");
            $('#store_image_error').show();
            message.innerHTML = "Image Field Is Required";
            message.style.color = "red";
            takenName.style.border = "1px solid red";
            return false;
        } else {
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
    $('.sub').select2();

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
