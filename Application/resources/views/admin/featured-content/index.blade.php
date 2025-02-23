@extends('admin.layouts.form')

@section('section', admin_lang('Featured Content Settings'))
@section('title', admin_lang('Featured Content Settings'))
@section('container', 'container-max-lg')

@section('content')
    <form action="{{ route('admin.featured-content.store') }}" method="POST">
        @csrf
        <div class="card mb-3">
            <div class="card-header">{{ admin_lang('Featured Content Settings') }}</div>
            <div class="card-body">
                <div class="mb-3">
                    <label for="featured_image_count" class="form-label">{{ admin_lang('Number of Featured Images') }}</label>
                    <input type="number" name="featured_image_count" id="featured_image_count" class="form-control" value="{{ $featuredImageCount }}" required>
                </div>
                <div class="mb-3">
                    <label for="featured_video_count" class="form-label">{{ admin_lang('Number of Featured Videos') }}</label>
                    <input type="number" name="featured_video_count" id="featured_video_count" class="form-control" value="{{ $featuredVideoCount }}" required>
                </div>
                <div class="mb-3">
                    <label for="featured_images" class="form-label">{{ admin_lang('Select Featured Images') }}</label>
                    <select name="featured_images[]" id="featured_images" class="form-control" multiple>
                        @foreach ($allImages as $image)
                            <option value="{{ $image->id }}" {{ in_array($image->id, $featuredImages->pluck('image_id')->toArray()) ? 'selected' : '' }}>{{ $image->title }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="mb-3">
                    <label for="featured_videos" class="form-label">{{ admin_lang('Select Featured Videos') }}</label>
                    <select name="featured_videos[]" id="featured_videos" class="form-control" multiple>
                        @foreach ($allVideos as $video)
                            <option value="{{ $video->id }}" {{ in_array($video->id, $featuredVideos->pluck('video_id')->toArray()) ? 'selected' : '' }}>{{ $video->title }}</option>
                        @endforeach
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">{{ admin_lang('Save') }}</button>
            </div>
        </div>
    </form>
@endsection