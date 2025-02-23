@extends('admin.layouts.form')

@section('section', admin_lang('Categories'))
@section('title', $category->name)
@section('container', 'container-max-lg')

@section('content')
    <h3>{{ $category->name }}</h3>
    <form action="{{ route('admin.categories.uploadMedia', $category->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('POST')
        <div class="mb-3">
            <label for="media" class="form-label">{{ admin_lang('Upload Media') }}</label>
            <input type="file" name="media[]" id="media" class="form-control" multiple required>
        </div>
        <button type="submit" class="btn btn-primary">{{ admin_lang('Upload') }}</button>
    </form>

    <h4 class="mt-5">{{ admin_lang('Media') }}</h4>
    <div class="row">
        @foreach ($category->media as $media)
            <div class="col-md-4">
                <div class="card mb-3">
                    @if (str_contains($media->media_type, 'image'))
                        <img src="{{ Storage::url($media->media_path) }}" class="card-img-top" alt="{{ $media->media_type }}">
                    @elseif (str_contains($media->media_type, 'video'))
                        <video width="100%" controls>
                            <source src="{{ Storage::url($media->media_path) }}" type="{{ $media->media_type }}">
                            Your browser does not support the video tag.
                        </video>
                    @endif
                </div>
            </div>
        @endforeach
    </div>
@endsection