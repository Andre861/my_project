@section('head_links')

@endsection
<x-app-layout>

    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">

            <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">
                <h2><a class="btn btn-info" href="{{ route('diagnose.index') }}">Diagnosis</a></h2>

            {{--<form class="form-inline my-2 my-lg-0" type="get" action="{{ url('/search') }}">
                <input class="form-control mr-sm-2" name="query" type="search" placeholder="Search diagnosis">
                <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
            </form>--}}

            </div>
        </div>
    </div>
</x-app-layout>
@section('footer_scripts')

@endsection
