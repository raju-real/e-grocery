@extends('admin.layouts.app')
@section('title', 'Supe Admin Dashboard')

@push('css')
	{{-- expr --}}
@endpush

@section('page-title', 'Dashboard Reports')

@section('count-topbar')
	@include('admin.layouts.count_topbar')


@endsection

@section('content')
	<div class="col-md-12">
		<div class="tile">
			<div class="row">
				<div class="col-md-2">
					<h3 class="tile-title">Our Users</h3>
				</div>
				<div class="col-md-8">
					<form action="{{ route('super.search_user') }}" method="post" role="form" class="pull-right">
						@csrf
						<div class="form-group">
							<label for=""></label>
							<input type="text" class="form-control" name="query" placeholder="Name/Email/Mobile">
						</div>

						<button type="submit" class="btn btn-primary">SearchUser</button>
					</form>
				</div>
				<div class="col-md-2"></div>
			</div>
			
			@if(Session::has('message'))
				<p class="alert alert-danger">{{ Session::get('message') }}</p>
			@endif
			<table class="table table-hover table-sm">
				<thead>
				<tr>
					<th>SL</th>
					<th>Name</th>
					<th>Email</th>
					<th>Mobile</th>
					<th>Action</th>
				</tr>
				</thead>
				<tbody>
				@if(sizeof($users) > 0)
				@foreach($users as $key=>$user)
					<tr>
						<td>{{ $key+1 }}</td>
						<td>{{ $user->name }}</td>
						<td>{{ $user->email }}</td>
						<td>{{ $user->mobile }}</td>
						<td>
							{{--Message Section--}}
							<a class="btn btn-primary" data-toggle="modal"
							   href="#send_message{{ $user->id }}">
								<img src="{{ asset('assets/images/message.png') }}" class="img-responsive" alt="Image" style="height: 30px;width: 30px;border-radius: 50px;">
							</a>
							<div class="modal fade" id="send_message{{ $user->id }}">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" style="float: left;">
												Send Message</h4>
										</div>
										<div class="modal-body">
											@php
												$is_read = true;
											@endphp
											<form action="{{ route('super.user_message_send') }}"
												  method="post" role="form">
												@csrf
												<div class="form-group">
													<label for="">To</label>
													<input name="mobile" type="text"
														   value="{{ $user->mobile }}"
														   class="form-control" {{ $is_read ? 'readonly':'' }}>
												</div>
												<div class="form-group">
													<label for="">Subject</label>
													<input name ="subject" type="text"
														   class="form-control"
														   id=""
														   placeholder="Subject">
												</div>
												<div class="form-group">
													<label for="">Message</label>
													<textarea name="text" id="" cols="30"
															  rows="10"
															  class="form-control">

                                                </textarea>
												</div>


										</div>
										<div class="modal-footer">
											<button type="submit"
													class="btn btn-primary">Send</button>
											<button type="button" class="btn btn-danger" data-dismiss="modal">Close
											</button>
										</div>
										</form>
									</div><!-- /.modal-content -->
								</div><!-- /.modal-dialog -->
							</div><!-- /.modal -->
						</td>
					</tr>
				@endforeach
				@else
					<p class="alert alert-danger">No User Found</p>
				@endif
				</tbody>
				{{--Pagination Start--}}
				<nav aria-label="Page navigation example" style="float: right;">
					<ul class="pagination pagination-lg">
						<li class="page-item">{{ $users->links() }}</li>
					</ul>
				</nav>
				{{--Paginaiton End--}}
			</table>
		</div>
	</div>
	<div class="clearfix"></div>
@endsection

@push('js')
	{{-- expr --}}
@endpush
