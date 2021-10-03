@extends('admin.layouts.app')
@section('title', 'Product Attributes')

@push('css')
	{{-- expr --}}
@endpush

@section('page-title', 'Product Attributes')

@section('count-topbar')
	{{-- @include('admin.layouts.count_topbar') --}}
@endsection

@section('content')
		{{-- Unit Part --}}
        <div class="col-md-4">
          <div class="tile">
            <h3 class="tile-title" style="float: left;">Products Unit</h3>
            <a class="btn btn-primary" data-toggle="modal" href='#unit-modal' style="float: right;">Add New</a>
            <div class="modal fade" id="unit-modal">
            	<div class="modal-dialog">
            		<div class="modal-content">
            			<div class="modal-header"><h5>Add New Unit</h5></div>
            			<div class="modal-body">
            				<form action="{{ route('super.unit.store') }}" method="POST" role="form" id="unitAdd">
            				@csrf
            					<div class="form-group">
            						<label for="" id="unit_label">Unit</label>
            						<input type="text" name="unit" class="form-control" id="unit" placeholder="Unit">
            					</div>
            					<button type="submit" class="btn btn-primary">Add Unit</button>
            				</form>
            			</div>
            			<div class="modal-footer">
            				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            			</div>
            		</div>
            	</div>
            </div>
            <table class="table">
              <thead>
                <tr>
                  <th>Sl. No</th>
                  <th>Unit Name</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody id="showUnit">
              	@php
                  $units = App\Model\Unit::all();
                @endphp
                @foreach($units as $unit)
                  <tr>
                    <td>{{ $loop->index + 1 }}</td>
                    <td>{{ $unit->unit }}</td>
                    <td>
                      <a class="btn btn-primary" data-toggle="modal" href='#unit-edit{{ $unit->id }}'><i class="fa fa-edit"></i></a>
                      <a href="{{ route('super.unit.destroy',$unit->id) }}" class="btn btn-danger" onclick="confirm('Are You Sure ?')"><i class="fa fa-trash"></i></a>
                  <div class="modal fade" id="unit-edit{{ $unit->id }}">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header"><h5>Edit Unit</h5></div>
                        <div class="modal-body">
                          <form action="{{ route('super.unit.update',$unit->id) }}" method="POST" role="form">
                          @csrf
                          @method('PUT')
                            <div class="form-group">
                              <label for="">Unit</label>
                              <input type="text" name="unit" class="form-control" id="" value="{{ $unit->unit }}">
                            </div>
                            <button type="submit" class="btn btn-primary">Update Unit</button>
                          </form>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                      </div>
                    </div>
                  </div>
                    </td>
                  </tr>
                  @endforeach
              </tbody>
            </table>
          </div>
        </div>

        {{-- Size Part --}}
        <div class="col-md-4">
          <div class="tile">
            <h3 class="tile-title" style="float: left;">Products Size</h3>
            <a class="btn btn-primary" data-toggle="modal" href='#size-modal' style="float: right;">Add New</a>
            <div class="modal fade" id="size-modal">
            	<div class="modal-dialog">
            		<div class="modal-content">
            			<div class="modal-header"><h5>Add New Size</h5></div>
            			<div class="modal-body">
            				<form action="{{ route('super.size.store') }}" method="POST" role="form" id="sizeStore">
            				@csrf
            					<div class="form-group">
            						<label for="">Size</label>
            						<input type="text" name="size" class="form-control" id="size" placeholder="Size">
            					</div>
            					<button type="submit" class="btn btn-primary">Add Size</button>
            				</form>
            			</div>
            			<div class="modal-footer">
            				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            			</div>
            		</div>
            	</div>
            </div>
            <table class="table">
              <thead>
                <tr>
                  <th>Sl. No</th>
                  <th>Unit Name</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
              	@php
              		$sizes = App\Model\Size::all();
              	@endphp
              	@foreach($sizes as $size)
	                <tr>
	                  <td>{{ $loop->index + 1 }}</td>
	                  <td>{{ $size->size }}</td>
	                  <td>
	                  	<a class="btn btn-primary" data-toggle="modal" href='#size-edit{{ $size->id }}'><i class="fa fa-edit"></i></a>
	                  	<a href="{{ route('super.size.destroy',$size->id) }}" class="btn btn-danger" onclick="confirm('Are You Sure ?')"><i class="fa fa-trash"></i></a>
			            <div class="modal fade" id="size-edit{{ $size->id }}">
			            	<div class="modal-dialog">
			            		<div class="modal-content">
			            			<div class="modal-header"><h5>Edit Size</h5></div>
			            			<div class="modal-body">
			            				<form action="{{ route('super.size.update',$size->id) }}" method="POST" role="form">
			            				@csrf
			            				@method('PUT')
			            					<div class="form-group">
			            						<label for="">Size</label>
			            						<input type="text" name="size" class="form-control" id="" value="{{ $size->size }}">
			            					</div>
			            					<button type="submit" class="btn btn-primary">Update Size</button>
			            				</form>
			            			</div>
			            			<div class="modal-footer">
			            				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			            			</div>
			            		</div>
			            	</div>
			            </div>
	                  </td>
	                </tr>
	            @endforeach
              </tbody>
            </table>
          </div>
        </div>

		{{-- Color Part --}}
        <div class="clearfix"></div>

        <div class="col-md-4">
          <div class="tile">
            <h3 class="tile-title" style="float: left;">Products Color</h3>
            <a class="btn btn-primary" data-toggle="modal" href='#color-modal' style="float: right;">Add New</a>
            <div class="modal fade" id="color-modal">
            	<div class="modal-dialog">
            		<div class="modal-content">
            			<div class="modal-header"><h5>Add New Color</h5></div>
            			<div class="modal-body">
            				<form action="{{ route('super.color.store') }}" method="POST" role="form" id="colorStore">
            				@csrf
            					<div class="form-group">
            						<label for="">Color</label>
            						<input type="text" name="color" class="form-control" id="color" placeholder="Color">
            					</div>
            					<button type="submit" class="btn btn-primary">Add Color</button>
            				</form>
            			</div>
            			<div class="modal-footer">
            				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            			</div>
            		</div>
            	</div>
            </div>
            <table class="table">
              <thead>
                <tr>
                  <th>Sl. No</th>
                  <th>Color Name</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
              	@php
              		$colors = App\Model\Color::all();
              	@endphp
              	@foreach($colors as $color)
	                <tr>
	                  <td>{{ $loop->index + 1 }}</td>
	                  <td>{{ $color->color }}</td>
	                  <td>
	                  	<a class="btn btn-primary" data-toggle="modal" href='#color-edit{{ $color->id }}'><i class="fa fa-edit"></i></a>
	                  	<a href="{{ route('super.color.destroy',$color->id) }}" class="btn btn-danger" onclick="confirm('Are You Sure ?')"><i class="fa fa-trash"></i></a>
			            <div class="modal fade" id="color-edit{{ $color->id }}">
			            	<div class="modal-dialog">
			            		<div class="modal-content">
			            			<div class="modal-header"><h5>Edit Color</h5></div>
			            			<div class="modal-body">
			            				<form action="{{ route('super.color.update',$color->id) }}" method="POST" role="form">
			            				@csrf
			            				@method('PUT')
			            					<div class="form-group">
			            						<label for="">Color</label>
			            						<input type="text" name="color" class="form-control" id="" value="{{ $color->color }}">
			            					</div>
			            					<button type="submit" class="btn btn-primary">Update Color</button>
			            				</form>
			            			</div>
			            			<div class="modal-footer">
			            				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			            			</div>
			            		</div>
			            	</div>
			            </div>
	                  </td>
	                </tr>
	            @endforeach
              </tbody>
            </table>
          </div>
        </div>

        <div class="clearfix"></div>
        <div class="col-md-12">
          <div class="tile">
            <h3 class="tile-title">Responsive Table</h3>
            <div class="table-responsive">
              <table class="table">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                  <tr>
                    <td>4</td>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
@endsection

@push('js')
<script type="text/javascript">
  $.ajaxSetup({
  headers: {
    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
  }
});
</script>
<script type="text/javascript">
  $(document).ready(function(){
    // Unit Add
    $('#unitAdd').on("submit",function(event){
      event.preventDefault();
      var unit = $('#unit').val();
      var url = $(this).attr("action");
      var method = $(this).attr("method");
      if(unit == ""){
        $('#unit_label').css({
        "color":"red"
      }).append("<span style='color:red;'>Required</span>");
        return false;
      } else {
        $.ajax({
          url : url,
          type : method,
          data : {unit:unit},
          dataType : 'json',
          success : function (message){
            unit = $('#unit').val("");
            swal("Success",message,"success");
          },
          error : function (data){
            swal("Opps ! ","Faild","error");
          }
        });

      }
    }); // Unit Insert End

    $('#sizeStore').on("submit",function(event){
      event.preventDefault();
      var size = $('#size').val();
      var url = $(this).attr("action");
      var method = $(this).attr("method");
      if(size == ""){
        $('#size_label').css({
        "color":"red"
      }).append("<span style='color:red;'>Required</span>");
        return false;
      } else {
        $.ajax({
          url : url,
          type : method,
          data : {size:size},
          dataType : 'json',
          success : function (message){
            size = $('#size').val("");
            swal("Success",message,"success");
          },
          error : function (data){
            swal("Opps ! ","Faild","error");
          }
        });

      }
    }); // Size Insert End

    $('#colorStore').on("submit",function(event){
      event.preventDefault();
      var color = $('#color').val();
      var url = $(this).attr("action");
      var method = $(this).attr("method");
      if(color == ""){
        $('#color_label').css({
        "color":"red"
      }).append("<span style='color:red;'>Required</span>");
        return false;
      } else {
        $.ajax({
          url : url,
          type : method,
          data : {color:color},
          dataType : 'json',
          success : function (message){
            size = $('#color').val("");
            swal("Success",message,"success");
          },
          error : function (data){
            swal("Opps ! ","Faild","error");
          }
        });

      }
    }); // Color Insert End

    // View Data
    // function getUnit(){
    //   var url = '{{ route("super.attributes.get_unit") }}';
    //   $.get(url,function(data){
    //     var sl = 1;
    //     data.forEach( function(value) {
    //       var tr = $("<tr/>");
    //           tr.append($("<td/>",{
    //             text: sl++
    //           })).append($("<td/>",{
    //             text : value.unit
    //           })).append($("<td/>",{
    //             html: '<div class="btn-group"><button id="unitView" class="btn btn-info" data-id="`+value.id+`"><i class="fa fa-eye"></i></button>&nbsp;<button id="unitEdit" class="btn btn-primary" data-id="`+value.id+`"><i class="fa fa-edit"></i></button>&nbsp;<button id="unitDelete" class="btn btn-danger" data-id="`+value.id+`"><i class="fa fa-trash"></i></button></div> '
    //           }));


    //           $('#showUnit').append(tr);
    //     });
    //   });
    // }

    window.onload = getUnit();

     $('#showUnit').delegate("#unitView","click",function(){
          var id = $(this).data("id");
          console.log(id);
        });

    $('#showUnit').delegate("#unitEdit","click",function(){
      var id = $(this).data("id");
      console.log(id);
    });

      $('#showUnit').delegate("#unitDelete","click",function(){
      var id = $(this).data("id");
      console.log(id);
    });


  });
</script>

@endpush
