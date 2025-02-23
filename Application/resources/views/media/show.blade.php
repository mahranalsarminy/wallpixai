@extends('layouts.app')

@section('content')
<div class="container">
    <h1>{{ $media->title }}</h1>
    <div class="media-content">
        <!-- Media content (image/video) goes here -->
    </div>
    <div class="report-media">
        <h3>Report this media</h3>
        <form action="{{ route('media.reports.store', $media) }}" method="POST">
            @csrf
            <label for="reason">Reason:</label>
            <input type="text" name="reason" id="reason" required>
            <button type="submit">Submit</button>
        </form>
    </div>
    <!-- Rating, tags, and other sections... -->
</div>
@endsection