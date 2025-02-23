@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Video Wallpapers</h1>
    <a href="{{ route('video_wallpapers.create') }}" class="btn btn-primary">Add Video Wallpaper</a>
    <div class="row mt-4">
        @foreach ($videoWallpapers as $videoWallpaper)
            <div class="col-md-4">
                <div class="card">
                    <video width="100%" controls>
                        <source src="{{ Storage::url($videoWallpaper->path) }}" type="video/mp4">
                        Your browser does not support the video tag.
                    </video>
                    <div class="card-body">
                        <h5 class="card-title">{{ $videoWallpaper->title }}</h5>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</div>
@endsection