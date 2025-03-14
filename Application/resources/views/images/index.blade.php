@extends('layouts.front')
@section('title', lang('Explore All Generated Images', 'images'))
@section('content')
    {!! ads_home_page_top() !!}
    <header class="header my-5">
        <div class="container">
            <h1 class="mb-5 text-center">{{ lang('Explore All Generated Images', 'images') }}</h1>
            <div class="card-v">
                <form action="{{ route('images.index') }}" method="GET">
                    <div class="row g-3 align-items-center">
                        <div class="col-lg-9">
                            <input type="text" name="search" class="form-control form-control-lg"
                                placeholder="{{ lang('Type what you want search for...', 'images') }}"
                                value="{{ request('search') ?? '' }}" />
                        </div>
                        <div class="col">
                            <button class="btn btn-primary btn-lg w-100"><i class="fa fa-search"></i></button>
                        </div>
                        <div class="col">
                            <button type="button" class="btn btn-light btn-lg w-100"
                                onclick="window.location.href='{{ route('images.index') }}'"><i
                                    class="fa-solid fa-rotate"></i></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </header>
    {!! ads_home_page_center() !!}
    @if ($generatedImages->count() > 0)
        <div class="section pt-0">
            <div class="container">
                <div class="section-inner">
                    <div class="section-body">
                        <div class="row justify-content-center row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xxl-4 g-3">
                            @foreach ($generatedImages as $generatedImage)
                                <div class="col" data-aos="zoom-in" data-aos-duration="1000">
                                    <div class="ai-image">
                                        <img class="lazy" data-src="{{ $generatedImage->getThumbnailLink() }}"
                                            alt="{{ $generatedImage->prompt }}" />
                                        <div class="spinner-border"></div>
                                        <div class="ai-image-hover">
                                            <p class="mb-0">{{ $generatedImage->prompt }}</p>
                                            <div class="row g-2 alig-items-center">
                                                <div class="col">
                                                    <a href="{{ route('images.show', hashid($generatedImage->id)) }}"
                                                        target="_blank"
                                                        class="btn btn-primary btn-md w-100">{{ lang('View Image') }}</a>
                                                </div>
                                                <div class="col-auto">
                                                    <a href="{{ route('images.download', [hashid($generatedImage->id), $generatedImage->getMainImageName()]) }}"
                                                        class="btn btn-light btn-md px-3"><i
                                                            class="fas fa-download"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
                <div class="mt-5">
                    {{ $generatedImages->appends(request()->input())->links() }}
                </div>
            </div>
        </div>
    @else
        <div class="section pt-0">
            <div class="container">
                <div class="card-v text-center">
                    <p class="text-muted mb-0">{{ lang('No Images Found', 'images') }}</p>
                </div>
            </div>
        </div>
    @endif
    @include('includes.faqs')
    @include('includes.articles')
    {!! ads_home_page_bottom() !!}
    @push('styles_libs')
        <link rel="stylesheet" href="{{ asset('assets/vendor/libs/aos/aos.min.css') }}">
    @endpush
    @push('scripts_libs')
        <script src="{{ asset('assets/vendor/libs/aos/aos.min.js') }}"></script>
        <script src="{{ asset('assets/vendor/libs/jquery/jquery.lazy.min.js') }}"></script>
        <script src="{{ asset('assets/vendor/libs/clipboard/clipboard.min.js') }}"></script>
    @endpush
@endsection
