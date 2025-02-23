@extends('layouts.front')
@section('title', $SeoConfiguration->title ?? '')
@section('content')
    {!! ads_home_page_top() !!}
    <header class="header">
        <div class="wrapper">
            <div class="container">
                <div class="wrapper-content">
                    <div class="wrapper-container">
                        <div class="text-center">
                            <h1 class="title mb-3">{{ lang('AI Image Generator', 'home page') }}</h1>
                            <p class="mb-0 text-muted">
                                {{ lang('Create stunning and unique images with ease using our AI image generation.', 'home page') }}
                            </p>
                        </div>
                        <div class="mt-5">
                            <input type="text" id="search-box" class="form-control" placeholder="Start typing..." onkeyup="showSuggestions(this.value)">
                            <div id="suggestions" class="list-group mt-2"></div>
                        </div>
                        <div class="mt-4">
                            <h4>{{ lang('Categories', 'home page') }}</h4>
                            <div id="categories" class="row">
                                @foreach ($categories as $category)
                                    <div class="col-md-3">
                                        <div class="card mb-3">
                                            <div class="card-body">
                                                <h5 class="card-title">{{ $category->name }}</h5>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                        <div class="text-center mt-4">
                            <a href="{{ route('user.media-generation.create') }}" class="btn btn-primary btn-lg">{{ lang('Generate Media', 'home page') }}</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    {!! ads_home_page_center() !!}
    @include('includes.features')
    @include('includes.faqs')
    @include('includes.articles')
    @push('styles_libs')
        <link rel="stylesheet" href="{{ asset('assets/vendor/libs/aos/aos.min.css') }}">
    @endpush
    {!! ads_home_page_bottom() !!}
    @push('scripts_libs')
        <script src="{{ asset('assets/vendor/libs/aos/aos.min.js') }}"></script>
        <script src="{{ asset('assets/vendor/libs/jquery/jquery.lazy.min.js') }}"></script>
        <script src="{{ asset('assets/vendor/libs/clipboard/clipboard.min.js') }}"></script>
        <script>
            function showSuggestions(value) {
                if (value.length == 0) {
                    document.getElementById("suggestions").innerHTML = "";
                    return;
                }

                // Send AJAX request to fetch suggestions
                fetch(`/api/suggestions?query=${value}`)
                    .then(response => response.json())
                    .then(data => {
                        let suggestions = data.map(item => `<a href="#" class="list-group-item list-group-item-action">${item}</a>`);
                        document.getElementById("suggestions").innerHTML = suggestions.join('');
                    });
            }
        </script>
    @endpush
@endsection