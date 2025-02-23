@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Add Video Wallpaper</h1>
    <form action="{{ route('video_wallpapers.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="mb-3">
            <label for="title" class="form-label">Title</label>
            <input type="text" name="title" id="title" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="video" class="form-label">Video</label>
            <input type="file" name="video" id="video" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Video Wallpaper</button>
    </form>
</div>
@endsection