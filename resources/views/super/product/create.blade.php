@extends('admin.layouts.app')
@section('title', 'Add New Product')

@push('css')
<style>
.button {
  padding: 15px 25px;
  font-size: 24px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>
@endpush

@section('page-title', 'Add New Product')

@section('content')
<div class="col-md-12">
	<div class="tile">
		<div class="tile-body">
			<form action="{{ route('super.product.store') }}" method="POST"
				  enctype="multipart/form-data" id="storeProduct"
				  onsubmit="return validate()">
				@csrf
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label for="" id="name_label">Product Name
								&nbsp;<i class="fa fa-star" style="color: red;"></i>
							</label>
							<input type="text" name="product_name" class="form-control"
								   id="product_name">
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label id="category_label">Category
								&nbsp;<i class="fa fa-star" style="color: red;"></i>
							</label>
							<select name="category_id" class="form-control" id="category"
									onchange="getSubcategory()">
								<optgroup>
									<option value="">Select  Category</option>
									@foreach ($categories as $category)
										<option value="{{ $category->id }}">
											{{ $category->name }}</option>
									@endforeach
								</optgroup>
							</select>
						</div>
					</div>

					<div class="col-md-2">
						<div class="form-group">
							<label>Sub Category</label>
							<select name="subcategory_id" class="form-control"
									id="subcategory" onchange="getSubSubcategory()">
								<optgroup>
									<option value="" >Select Sub Category</option>
									{{-- @foreach ($subcategories as $subcategory)
										<option value="{{ $subcategory->id }}">{{ $subcategory->name }}</option>
									@endforeach --}}
								</optgroup>
							</select>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label>Sub Sub Category</label>
							<select name="subsubcategory_id" class="form-control"
									id="subsubcategory">
								<optgroup>
									<option value="" >Select Sub Sub Category</option>
									{{-- @foreach ($subcategories as $subcategory)
										<option value="{{ $subcategory->id }}">{{ $subcategory->name }}</option>
									@endforeach --}}
								</optgroup>
							</select>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label id="company_label">Company
							</label>
							<select name="company_id" class="form-control" id="company">
								<optgroup>
									<option value="">Product From</option>
									@foreach ($companies as $company)
										<option value="{{ $company->id }}">
											{{ $company->company_name }}</option>
									@endforeach
								</optgroup>
							</select>
						</div>
					</div>
					<div class="col-md-1">
						<div class="form-group">
								<label>Sku</label>
								<select name="sku" class="form-control" id="sku">
									<option value="In Stock">In Stock</option>
									<option value="Out Of Stock">Out Of Stock</option>
								</select>
							</div>
					</div>
				</div>

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label id="details_label">Product Details
									&nbsp;<i class="fa fa-star" style="color: red;"></i>
								</label>
								<textarea name="product_details" class="form-control"
										  id="product_details"></textarea>
								<script>
                                    CKEDITOR.replace('product_details')
                            	</script>
							</div>
						</div>
						<div class="col-md-2">
							@php
								$units = App\Model\Unit::all();
							@endphp
							<div class="form-group">
								<label id="unit_label">Product Unit
									&nbsp;<i class="fa fa-star" style="color: red;"></i>
								</label>
								<select name="units[]" id="product_unit" class="form-control" multiple="" >
								<option value="" selected="">Select Unit</option>
									@foreach ($units as $unit)
										<option value="{{ $unit->id }}">{{ $unit->unit }}</option>
									@endforeach
								</select>
							</div>
							<div class="form-group">
								<label id="price_label">Product Price
									&nbsp;<i class="fa fa-star" style="color: red;"></i>
								</label>
								<input type="text" name="unit_price" class="form-control" placeholder="Unit Price" id="unit_price">
							</div>
							<div class="form-group">
								<label id="discount_price_label">Discount Price</label>
								<input type="text" name="discount_price" class="form-control" placeholder="Discount Price" id="discount_price">
							</div>
						</div>
						<div class="col-md-2">
							<div class="form-group">
								<label>Product Size</label>
								<select name="sizes[]" id="product_size" class="form-control" multiple="" >
								<option value="" selected="">Select Size</option>
								@php
									$sizes = App\Model\Size::all();
								@endphp
									@foreach ($sizes as $size)
										<option value="{{ $size->id }}">{{ $size->size }}</option>
									@endforeach
								</select>
							</div>
							<div class="form-group">
								<label id="weight_label">Unit Weight</label>
								<i class="fa fa-star" style="color: red;"></i>
								<input type="text" name="unit_weight" class="form-control" placeholder="Unit Weight" id="unit_weight">
							</div>
						</div>
						<div class="col-md-2">
							<div class="form-group">
								<label>Product Color</label>
								<select name="colors[]" id="product_color" class="form-control" multiple="" >
								<option value="" selected="">Select Color</option>
								@php
									$colors = App\Model\Color::all();
								@endphp
									@foreach ($colors as $color)
										<option value="{{ $color->id }}">{{ $color->color }}</option>
									@endforeach
								</select>
							</div>

							<div class="form-group">
							<label id="quantity_label">Quantity</label>
							<i class="fa fa-star" style="color: red;"></i>
							<input type="text" name="quantity" class="form-control"
								   id="quantity">
						</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label>Special Note</label>
								<textarea name="special_note" id="special_note" class="form-control" row="8" cols="8"></textarea>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label id="take_image">Short Video</label>
								<i class="fa fa-star" style="color: red;"></i>
								<input type="file" class="form-control" id="image"
									   name="video">
							</div>
						</div>
						<div class="col-md-6">

							<div class="form-group">
								<label id="image_label">Gallery Images
									&nbsp;<i class="fa fa-star" style="color: red;"></i>
								</label>
								<div class="input-group control-group increment" >
		                          <input type="file" multiple name="images[]"
										 class="form-control" id="product_image">
		                          <div class="input-group-btn">
		                            <button class="btn btn-success" type="button">
										<i class="fa fa-plus"></i></button>
		                          </div>
		                        </div>
		                        <div class="clone hide">
		                          <div class="control-group input-group" style="margin-top:10px">
		                            <input type="file" name="images[]"
										   class="form-control">
		                            <div class="input-group-btn">
		                              <button class="btn btn-danger btn-sm"
											  type="button"><i class="fa fa-remove">

										  </i> </button>
		                            </div>
		                          </div>
		                        </div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">

						</div>
						<div class="col-md-3"></div>
						<div class="col-md-3">
							<div class="form-group">
								<button type="submit"  class="button preview">Add Product</button>
							</div>
						</div>
					</div>
			</form>
		</div>

	</div>
	</div>
@endsection

@push('js')
{{--  For Validation  --}}

{{-- JS VALIDATION --}}
<script type="text/javascript">
	function validate(){
		var product_name = document.getElementById("product_name");
		var takenCategory = document.getElementById("category");
		var category = takenCategory.options[takenCategory.selectedIndex].value;
		var product_details = document.getElementById("product_details");
		var total_length = CKEDITOR.instances['product_details'].getData().replace(/<[^>]*>/gi, '').length;
		var takenUnit = document.getElementById("product_unit");
		var product_unit = takenUnit.options[takenUnit.selectedIndex].value;
		var unit_price = document.getElementById("unit_price");
		var discount_price = document.getElementById("discount_price");
        var unit_weight = document.getElementById('unit_weight');
        var quantity = document.getElementById('quantity').value;
        var product_image = document.getElementById("product_image");

		if(product_name.value.trim() == ""){
			$('#name_label').css({
				"color":"red"
			}).append("<span style='color:red;'>Required</span>");
			return false;
		} else if(category.trim() == ""){
			$('#category_label').css({
				"color":"red"
			}).append("<span style='color:red;'>Required</span>");
			return false;
		} else if(quantity.trim() == ""){
            $('#quantity_label').css({
                "color":"red"
            }).append("<span style='color:red;'>Required</span>");
            return false;
        }
		else if(total_length == 0){
			$('#details_label').css({
				"color":"red"
			}).append("<span style='color:red;'>Required</span>");
			return false;
		} else if(product_unit.trim() == ""){
			$('#unit_label').css({
				"color":"red"
			}).append("<span style='color:red;'>Required</span>");
			return false;
		} else if(unit_price.value.trim() == ""){
			$('#price_label').css({
				"color":"red"
			}).append("<span style='color:red;'>Required</span>");
			return false;
		} else if(unit_price.value <= 0){
			$('#price_label').css({
				"color":"red"
			}).append("<span style='color:red;'>Type More than 0</span>");
			return false;
		} else if((discount_price.value.length > 0) && (discount_price.value >= unit_price.value)){
			$('#discount_price_label').css({
				"color":"red"
			}).append("<span style='color:red;margin-left:10px;'>Can not more than Unit Price</span>");
			return false;
		} else if(unit_weight.value.trim() == "") {
            $('#weight_label').css({
                "color": "red"
            }).append("<span style='color:red;'>Required</span>");
            return false;
        }  else if(product_image.value.trim() == ""){
			$('#image_label').css({
				"color":"red"
			}).append("<span style='color:red;'>Required</span>");
			return false;
		} else {
			return true;
		}
	}
</script>

{{-- Empty Selected Value Remove From Dropdown --}}
<script type="text/javascript">
        $('#product_unit').on('change', function() {
            $("option[value='']").remove();

        });
         $('#product_size').on('change', function() {
            $("option[value='']").remove();

        });
          $('#product_color').on('change', function() {
            $("option[value='']").remove();

        });

</script>
{{-- For Multiple Image Add --}}
<script type="text/javascript">

    $(document).ready(function() {

      $(".btn-success").click(function(){
          var html = $(".clone").html();
          $(".increment").after(html);
      });

      $("body").on("click",".btn-danger",function(){
          $(this).parents(".control-group").remove();
      });

    });

</script>
{{-- For Select 2 --}}
<script type="text/javascript">
	$('#category').select2();
	$('#subcategory').select2();
	$('#subsubcategory').select2();
	$('#product_unit').select2();
	$('#product_size').select2();
	$('#product_color').select2();
	$('#company').select2();
</script>


{{-- Ajax Data Insert --}}

{{-- Ajax Api Call--}}
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
@endpush
