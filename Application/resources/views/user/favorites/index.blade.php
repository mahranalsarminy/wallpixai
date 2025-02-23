@extends('layouts.app')
@section('title', 'Favorites')
@section('content')
    <div class="container">
        <h1>{{ lang('Favorites', 'favorites') }}</h1>
        <div class="row">
            <div class="col-md-6">
                <h2>{{ lang('Favorite Images', 'favorites') }}</h2>
                <div class="row">
                    @foreach ($favoriteImages as $image)
                        <div class="col-md-4">
                            <div class="card mb-3">
                                <img src="{{ Storage::url($image->path) }}" class="card-img-top" alt="{{ $image->prompt }}">
                                <div class="card-body">
                                    <p class="card-text">{{ $image->prompt }}</p>
                                    <button class="btn btn-danger btn-sm" onclick="toggleFavorite({{ $image->id }}, 'image')">
                                        <i class="fa fa-heart"></i> {{ lang('Remove from Favorites', 'favorites') }}
                                    </button>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
            <div class="col-md-6">
                <h2>{{ lang('Favorite Videos', 'favorites') }}</h2>
                <div class="row">
                    @foreach ($favoriteVideos as $video)
                        <div class="col-md-4">
                            <div class="card mb-3">
                                <video width="100%" controls>
                                    <source src="{{ Storage::url($video->path) }}" type="video/mp4">
                                    Your browser does not support the video tag.
                                </video>
                                <div class="card-body">
                                    <p class="card-text">{{ $video->prompt }}</p>
                                    <button class="btn btn-danger btn-sm" onclick="toggleFavorite({{ $video->id }}, 'video')">
                                        <i class="fa fa-heart"></i> {{ lang('Remove from Favorites', 'favorites') }}
                                    </button>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
@endsection
@push('scripts')
    <script>
        function toggleFavorite(id, type) {
            fetch(`/user/favorites/${id}`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({ type: type })
            }).then(response => response.json()).then(data => {
                if (data.success) {
                    location.reload();
                }
            });
        }
    </script>
@endpush