@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Media tagged with "{{ $tag->name }}"</h1>
    <div class="media-list">
        @foreach($media as $item)
            <div class="media-item">
                <h3><a href="{{ route('media.show', $item) }}">{{ $item->title }}</a></h3>
                <!-- Display media content (image/video thumbnail) -->
            </div>
        @endforeach
    </div>
    {{ $media->links() }}
</div>
@endsection