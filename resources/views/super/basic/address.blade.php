@extends('admin.layouts.app')
@section('title', 'Address')

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
            <h3 class="tile-title" style="float: left;">Division List</h3>
            <a class="btn btn-primary" data-toggle="modal" href='#unit-modal' style="float: right;">
                Add New
            </a>
            <div class="modal fade" id="unit-modal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header"><h5>Add New Division</h5></div>
                        <div class="modal-body">
                            <form action="{{ route('super.division.store') }}"
                                  method="POST" role="form">
                                @csrf
                                <div class="form-group">
                                    <label for="" id="unit_label">Division Name</label>
                                    <input type="text" name="division_name" class="form-control"
                                            placeholder="Division">
                                </div>
                                <button type="submit" class="btn btn-primary">
                                    Add Division
                                </button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table">
                <thead>
                <tr>
                    <th>Sl. No</th>
                    <th>Division Name</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody id="showUnit">
                @php
                    $divisions = App\Model\Division::all();
                @endphp
                @foreach($divisions as $division)
                    <tr>
                        <td>{{ $loop->index + 1 }}</td>
                        <td>{{ $division->division_name }}</td>
                        <td>
                            <a class="btn btn-primary" data-toggle="modal" href='#division-edit{{ $division->id }}'><i class="fa fa-edit"></i></a>
                            <a href="{{ route('super.division.destroy',$division->id) }}" class="btn btn-danger" onclick="confirm('Are You Sure ?')"><i class="fa fa-trash"></i></a>
                            <div class="modal fade" id="division-edit{{ $division->id }}">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header"><h5>Edit Division</h5></div>
                                        <div class="modal-body">
                                            <form action="{{ route('super.division.update',$division->id) }}" method="POST" role="form">
                                                @csrf
                                                @method('PUT')
                                                <div class="form-group">
                                                    <label for="">Division</label>
                                                    <input type="text" name="division_name" class="form-control" id="" value="{{ $division->division_name }}">
                                                </div>
                                                <button type="submit" class="btn btn-primary">Update Division</button>
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

    {{-- District Part --}}
    <div class="col-md-8">
        <div class="tile">
            <h3 class="tile-title" style="float: left;">Our District List</h3>
            <a class="btn btn-primary" data-toggle="modal" href='#size-modal' style="float: right;">Add New</a>
            <div class="modal fade" id="size-modal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header"><h5>Add New District</h5></div>
                        <div class="modal-body">
                            <form action="{{ route('super.district.store') }}" method="POST"
                                  role="form">
                                @csrf
                                <div class="form-group">
                                    <label for="">Division Name</label>
                                    <Select name="division_id" id=""
                                            class="form-control">
                                        <option value="">Select District</option>
                                        @foreach($divisions as $division)
                                            <option value="{{ $division->id }}">
                                                {{ $division->division_name }}
                                            </option>
                                            @endforeach
                                    </Select>
                                </div>
                                <div class="form-group">
                                    <label for="">District Name</label>
                                    <input type="text" name="district_name"
                                           placeholder="District Name" class="form-control">
                                </div>
                                <button type="submit" class="btn btn-primary">
                                    Add District</button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table">
                <thead>
                <tr>
                    <th>Sl. No</th>
                    <th>Division Name</th>
                    <th>District Name</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                @php
                    $districts = App\Model\District::all();
                @endphp
                @foreach($districts as $district)
                    <tr>
                        <td>{{ $loop->index + 1 }}</td>
                        <td>{{ $district->division->division_name }}</td>
                        <td>{{ $district->district_name }}</td>
                        <td>
                            <a class="btn btn-primary" data-toggle="modal"
                               href='#district-edit{{ $district->id }}'>
                                <i class="fa fa-edit"></i></a>
                            <a href="{{ route('super.district.destroy',$district->id) }}"
                               class="btn btn-danger" onclick="confirm('Are You Sure ?')">
                                <i class="fa fa-trash"></i></a>
                            <div class="modal fade" id="district-edit{{ $district->id }}">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header"><h5>Edit District</h5></div>
                                        <div class="modal-body">
                                            <form action="{{ route('super.district.update',$district->id) }}" method="POST" role="form" >
                                                @csrf
                                                @method('PUT')
                                                <div class="form-group">
                                                    <label for="">Division Name</label>
                                                    <Select name="division_id" id=""
                                                            class="form-control">
                                                        <option value="{{ $district->division->id }}">
                                                            {{ $district->division->division_name }}
                                                        </option>
                                                        @foreach($divisions as $division)
                                                            <option value="{{ $division->id }}">
                                                                {{ $division->division_name }}
                                                            </option>
                                                        @endforeach
                                                    </Select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="">District Name</label>
                                                    <input type="text" name="district_name"
                                                    value="{{ $district->district_name }}"
                                                           class="form-control">
                                                </div>
                                                <button type="submit" class="btn btn-primary">
                                                    Update District</button>
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

    {{-- Upazila Part --}}
    <div class="col-md-12">
        <div class="tile">
            <h3 class="tile-title" style="float: left;">Our Upazila List</h3>
            <a class="btn btn-primary" data-toggle="modal" href='#upazila-modal' style="float: right;">
                Add New</a>
            <div class="modal fade" id="upazila-modal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header"><h5>Add New Upazila</h5></div>
                        <div class="modal-body">
                            <form action="{{ route('super.upazila.store') }}" method="POST"
                                  role="form">
                                @csrf
                                <div class="form-group">
                                    <label for="">Division Name</label>
                                    <Select name="division_id" id="division"
                                            class="form-control" onchange="getDistrict()">
                                        <option value="">Select Division</option>
                                        @foreach($divisions as $division)
                                            <option value="{{ $division->id }}">
                                                {{ $division->division_name }}
                                            </option>
                                        @endforeach
                                    </Select>
                                </div>
                                <div class="form-group">
                                    <label for="">District Name</label>
                                    <Select name="district_id"
                                            class="form-control" id="district">
                                        <option value="">Select District</option>

                                    </Select>
                                </div>
                                <div class="form-group">
                                    <label for="">Upazila Name</label>
                                    <input type="text" name="upazila_name"
                                           placeholder="Upazila Name" class="form-control">
                                </div>
                                <button type="submit" class="btn btn-primary">
                                    Add Upazila</button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table">
                <thead>
                <tr>
                    <th>Sl. No</th>
                    <th>Division Name</th>
                    <th>District Name</th>
                    <th>Upazila Name</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                @php
                    $upazilas = App\Model\Upazila::with('division')->get();
                @endphp
                @foreach($upazilas as $upazila)
                    <tr>
                        <td>{{ $loop->index + 1 }}</td>
                        <td>{{ $upazila->division->division_name }}</td>
                        <td>{{ $upazila->district->district_name }}</td>
                        <td>{{ $upazila->upazila_name }}</td>
                        <td>
                            <a class="btn btn-primary" data-toggle="modal"
                               href='#upazila-edit{{ $upazila->id }}'>
                                <i class="fa fa-edit"></i></a>
                            <a href="{{ route('super.upazila.destroy',$upazila->id) }}"
                               class="btn btn-danger" onclick="confirm('Are You Sure ?')">
                                <i class="fa fa-trash"></i></a>
                            <div class="modal fade" id="upazila-edit{{ $upazila->id }}">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header"><h5>Edit Upazila</h5></div>
                                        <div class="modal-body">
                                            <form action="{{ route('super.upazila.update',$upazila->id) }}" method="POST" role="form">
                                                @csrf
                                                @method('PUT')
                                                <div class="form-group">
                                                    <label for="">Division Name</label>
                                                    <Select name="division_id" id="division2"
                                                            class="form-control" onchange="getDistrict2()">
                                            <option value="{{ $upazila->division->id }}">
                                                {{ $upazila->division->division_name }}
                                            </option>
                                                        @foreach($divisions as $division)
                                                            <option value="{{ $division->id }}">
                                                                {{ $division->division_name }}
                                                            </option>
                                                        @endforeach
                                                    </Select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="">District Name</label>
                                                    <Select name="district_id"
                                                            class="form-control" id="district2">
                                                <option value="{{ $upazila->district->id }}">
                                                    {{ $upazila->district->district_name }}
                                                </option>

                                                    </Select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="">Upazila Name</label>
                                                    <input type="text" name="upazila_name"
                                                           placeholder="Upazila Name" class="form-control">
                                                </div>
                                                <button type="submit" class="btn btn-primary">
                                                    Add Upazila</button>
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
   <script>
       function getDistrict(){
           // Form Validation Part
           $('.region_message').hide();

           // Api Call Part
           $('#spot') .find('option') .remove() .end() .append('<option value="">Select</option>');
           var id = document.getElementById('division').value;

           axios.get(`http://localhost/e_grocery/api/get_district/${id}`)
               .then(function (response) {
                   var list = response.data;
                   var select = document.getElementById("district");


                   for(i = 0; i < list.length ;i ++){
                       var el = document.createElement("option");
                       var districts = list[i];
                       var districtName = districts.district_name;
                       var districtId = districts.id;
                       el.textContent = districtName;
                       el.value = districtId;
                       select.appendChild(el);
                   }
               });
       }

       function getDistrict2(){
           // Form Validation Part
           $('.region_message').hide();

           // Api Call Part
           $('#spot') .find('option') .remove() .end() .append('<option value="">Select</option>');
           var id = document.getElementById('division2').value;

           axios.get(`http://localhost/e_grocery/api/get_district/${id}`)
               .then(function (response) {
                   var list = response.data;
                   var select = document.getElementById("district2");


                   for(i = 0; i < list.length ;i ++){
                       var el = document.createElement("option");
                       var districts = list[i];
                       var districtName = districts.district_name;
                       var districtId = districts.id;
                       el.textContent = districtName;
                       el.value = districtId;
                       select.appendChild(el);
                   }
               });
       }
    </script>



@endpush
