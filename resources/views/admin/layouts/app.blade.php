<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <!-- Twitter meta-->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:site" content="@pratikborsadiya">
    <meta property="twitter:creator" content="@pratikborsadiya">
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Vali Admin">
    <meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
    <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin">
    <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
    <meta property="og:description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">

    <title>@yield('title','')</title>
    <link rel="icon" href="{{ asset('assets/user/images/icon.png') }}" type="image/icon type">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/admin/css/main.css') }}">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    {{--<link rel="stylesheet" href="{{ asset('assets/admin/font-awesome.min.css') }}">--}}
  <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    {{--Common--}}
    <link href=" {{ asset('css/app.css') }}" rel="stylesheet">

    <link href="{{ asset('assets/admin/date/daterangepicker.css') }}" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="{{ asset('assets/admin/date/build/jquery.datetimepicker.min.css') }}" >


    <!-- Data Table css -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedheader/3.1.5/css/fixedHeader.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
     {{--  Toaster  --}}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    {{-- <script src="https://cdn.ckeditor.com/ckeditor5/12.3.1/classic/ckeditor.js"></script> --}}
    <script src="https://cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>

@stack('css')
  </head>
  <body class="app sidebar-mini rtl">
  @if(Auth::check() && Auth::user()->job_status == 1)
  <div id="app">
    <!-- Navbar-->
    @include('admin.layouts.topbar')
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
   @include('admin.layouts.sidebar')

    <main class="app-content">
      <div class="app-title">
        <div>
          <h1>@yield('page-title')</h1>
         
        </div>
      </div>
      <div class="row">
        @yield('count-topbar')
      </div>
      <div class="row">
       @yield('content')

      </div>
     
    </main>
  </div>
  @else
    <h2 class="alert alert-danger text-center">{{ 'You Have No Permission To Access' }}</h2>
    @endif

  {{--Common--}}
  <script src="{{ asset('js/app.js') }}"></script>
    {{-- Axios --}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.0/axios.min.js"></script>

    <!-- Essential javascripts for application to work-->
  {{--<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>--}}
    <script src="{{ asset('assets/admin/js/jquery-3.2.1.min.js') }}"></script>
    <script src="{{ asset('assets/admin/js/popper.min.js') }}"></script>
    <script src="{{ asset('assets/admin/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('assets/admin/js/main.js') }}"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="{{ asset('assets/admin/js/plugins/pace.min.js') }}"></script>
    <!-- Data Table -->
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
{{-- <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script> --}}
<script type="text/javascript" src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>

{{-- Date Time And Select To  --}}
{{--<script type="text/javascript" src="{{ asset('assets/admin/js/plugins/bootstrap-datepicker.min.js') }}"></script>--}}
  <script src="{{ asset('assets/admin/date/daterangepicker.js')}}"></script>


  <script src="{{ asset('assets/admin/js/plugins/moment.min.js') }}"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/eonasdan-bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="{{ asset('assets/admin/js/plugins/select2.min.js') }}"></script>
  {{----}}
{{--<script type="text/javascript" src="{{ asset('assets/admin/js/plugins/bootstrap-datepicker.min.js') }}"></script>--}}

    <script type="text/javascript" src="{{ asset('assets/admin/js/plugins/bootstrap-notify.min.js')}}"></script>

<script src="https://unpkg.com/sweetalert2@7.19.1/dist/sweetalert2.all.js"></script>
{{--  Toaster  --}}
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
{!! Toastr::message() !!}
<script>
    @if($errors->any())
        @foreach($errors->all() as $error)
              toastr.error('{{ $error }}','Error',{
                  closeButton:true,
                  progressBar:true,
               });
        @endforeach
    @endif
</script>
    @stack('js')

  </body>
</html>