@php
    $categories = DB::table('categories')->latest()->get();
@endphp

{{--<li>--}}
    {{--<a href="{{ route('campaigns') }}">--}}
            {{--<img src="{{ asset('images/category/campaign.png') }}" class="img-responsive" alt="Image" style="padding: 8px;">--}}
        {{--Campaign--}}
    {{--</a>--}}
{{--</li>--}}
@foreach($categories as $category)
<ul>
    <li class="sub-category">
        <a href="{{ route('category',$category->slug) }}">
            <img src="{{ asset('images/category/'.$category->icon) }}" alt="" style="padding: 8px;">
            &nbsp;&nbsp;{{ $category->name }}
        </a>
        @php
            $subcategories = DB::table('subcategories')
            ->where('category_id',$category->id)->get();
        @endphp
        @if(sizeof($subcategories) > 0)

        <ul class="sub-menu clearfix">
            @foreach($subcategories as $subcategory)
                <li class="sub-sec col-md-6">
                    <ul>
                        <li>
                            <a href="{{ route('subcategory',$subcategory->slug) }}" class="title">
                                {{ $subcategory->name }}
                            </a>
                        </li>
                        @php
                            $subSubCategories = DB::table('subsubcategories')
                            ->where('subcategory_id',$subcategory->id)->get();
                        @endphp
                        @if(sizeof($subSubCategories) > 0)
                            @foreach($subSubCategories as $subSubCategory)                                                 <li>
                                <a href="{{ route('subsubcategory',$subSubCategory->slug) }}">
                                    <i class="fa fa-angle-double-right"></i>
                                    {{ $subSubCategory->name }}
                                </a>
                            </li>
                            @endforeach
                        @endif

                    </ul>
                </li>
            @endforeach
        </ul>

        @endif
    </li>
</ul>
@endforeach