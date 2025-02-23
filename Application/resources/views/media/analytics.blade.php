@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Analytics for {{ $media->title }}</h1>
    <div class="analytics-data">
        <p>Views: {{ $media->analytics->views }}</p>
        <p>Likes: {{ $media->analytics->likes }}</p>
        <p>Shares: {{ $media->analytics->shares }}</p>
    </div>
</div>
@endsection