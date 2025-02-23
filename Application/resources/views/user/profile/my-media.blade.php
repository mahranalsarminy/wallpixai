@extends('layouts.app')
@section('content')
    <div class="container">
        <h1>{{ lang('My Media', 'profile page') }}</h1>
        <div class="row">
            <div class="col-md-6">
                <h2>{{ lang('Generated Images', 'profile page') }}</h2>
                <div class="row">
                    @foreach ($images as $image)
                        <div class="col-md-4">
                            <div class="card mb-3">
                                <img src="{{ Storage::url($image->path) }}" class="card-img-top" alt="{{ $image->prompt }}">
                                <div class="card-body">
                                    <p class="card-text">{{ $image->prompt }}</p>
                                    <form action="{{ route('user.profile.suggest-media', [$image->id, 'image']) }}" method="POST" class="d-inline-block">
                                        @csrf
                                        <button type="submit" class="btn btn-success btn-sm">{{ lang('Suggest', 'profile page') }}</button>
                                    </form>
                                    <button class="btn btn-light btn-sm" onclick="toggleFavorite({{ $image->id }}, 'image')">
                                        <i class="fa fa-heart"></i> {{ lang('Favorite', 'profile page') }}
                                    </button>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
            <div class="col-md-6">
                <h2>{{ lang('Generated Videos', 'profile page') }}</h2>
                <div class="row">
                    @foreach ($videos as $video)
                        <div class="col-md-4">
                            <div class="card mb-3">
                                <video width="100%" controls>
                                    <source src="{{ Storage::url($video->path) }}" type="video/mp4">
                                    Your browser does not support the video tag.
                                </video>
                                <div class="card-body">
                                    <p class="card-text">{{ $video->prompt }}</p>
                                    <form action="{{ route('user.profile.suggest-media', [$video->id, 'video']) }}" method="POST" class="d-inline-block">
                                        @csrf
                                        <button type="submit" class="btn btn-success btn-sm">{{ lang('Suggest', 'profile page') }}</button>
                                    </form>
                                    <button class="btn btn-light btn-sm" onclick="toggleFavorite({{ $video->id }}, 'video')">
                                        <i class="fa fa-heart"></i> {{ lang('Favorite', 'profile page') }}
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