@extends('admin.layouts.form')

@section('section', admin_lang('Edit Media'))
@section('title', admin_lang('Edit Media'))
@section('container', 'container-max-lg')

@section('content')
    <form action="{{ route('admin.generated-media.update', [$media->id, $type]) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <div class="card mb-3">
            <div class="card-header">{{ admin_lang('Edit Media') }}</div>
            <div class="card-body">
                <div class="mb-3">
                    <label for="prompt" class="form-label">{{ admin_lang('Prompt') }}</label>
                    <input type="text" name="prompt" id="prompt" class="form-control" value="{{ $media->prompt }}" required>
                </div>
                <div class="mb-3">
                    <label for="file" class="form-label">{{ admin_lang('File') }}</label>
                    <input type="file" name="file" id="file" class="form-control">
                    @if ($type == 'image')
                        <img src="{{ Storage::url($media->path) }}" class="img-fluid mt-3" alt="{{ $media->prompt }}">
                    @elseif ($type == 'video')
                        <video width="100%" controls class="mt-3">
                            <source src="{{ Storage::url($media->path) }}" type="video/mp4">
                            Your browser does not support the video tag.
                        </video>
                    @endif
                </div>
                <button type="submit" class="btn btn-primary">{{ admin_lang('Save') }}</button>
            </div>
        </div>
    </form>
@endsection