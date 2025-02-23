@extends('layouts.app')

@section('title', 'Home')
@section('content')
    <div class="container">
        <h1>{{ lang('Home', 'home') }}</h1>
        <div class="recent-images mt-4">
            <h2>{{ lang('Recent Images', 'home') }}</h2>
            <div class="row">
                @foreach ($recentImages as $image)
                    <div class="col-md-3">
                        <div class="card mb-3">
                            <img src="{{ Storage::url($image->path) }}" class="card-img-top" alt="{{ $image->title }}">
                            <div class="card-body">
                                <p class="card-text">{{ $image->title }}</p>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
        <div class="recent-videos mt-4">
            <h2>{{ lang('Recent Videos', 'home') }}</h2>
            <div class="row">
                @foreach ($recentVideos as $video)
                    <div class="col-md-3">
                        <div class="card mb-3">
                            <video width="100%" controls>
                                <source src="{{ Storage::url($video->path) }}" type="video/mp4">
                                Your browser does not support the video tag.
                            </video>
                            <div class="card-body">
                                <p class="card-text">{{ $video->title }}</p>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
        <div class="featured-images mt-4">
            <h2>{{ lang('Featured Images', 'home') }}</h2>
            <div class="row">
                @foreach ($featuredImages as $featured)
                    <div class="col-md-3">
                        <div class="card mb-3">
                            <img src="{{ Storage::url($featured->image->path) }}" class="card-img-top" alt="{{ $featured->image->title }}">
                            <div class="card-body">
                                <p class="card-text">{{ $featured->image->title }}</p>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
        <div class="featured-videos mt-4">
            <h2>{{ lang('Featured Videos', 'home') }}</h2>
            <div class="row">
                @foreach ($featuredVideos as $featured)
                    <div class="col-md-3">
                        <div class="card mb-3">
                            <video width="100%" controls>
                                <source src="{{ Storage::url($featured->video->path) }}" type="video/mp4">
                                Your browser does not support the video tag.
                            </video>
                            <div class="card-body">
                                <p class="card-text">{{ $featured->video->title }}</p>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@endsection