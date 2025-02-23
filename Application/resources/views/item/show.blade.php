@extends('layouts.app')

@section('title', $item->title)
@section('content')
    <div class="container">
        <h1>{{ $item->title }}</h1>
        <div class="media">
            @if ($item->type == 'image')
                <img src="{{ Storage::url($item->path) }}" class="img-fluid" alt="{{ $item->title }}">
            @elseif ($item->type == 'video')
                <video width="100%" controls>
                    <source src="{{ Storage::url($item->path) }}" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            @endif
        </div>
        <div class="similar-content mt-4">
            <h2>{{ lang('Similar Content', 'item page') }}</h2>
            <div class="row">
                @foreach ($similarContent as $content)
                    <div class="col-md-3">
                        <div class="card mb-3">
                            <img src="{{ $content['src']['medium'] }}" class="card-img-top" alt="{{ $content['photographer'] }}">
                            <div class="card-body">
                                <p class="card-text">{{ $content['photographer'] }}</p>
                                <a href="{{ $content['url'] }}" target="_blank" class="btn btn-primary">{{ lang('View on Pexels', 'item page') }}</a>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
        <div class="comments mt-4">
            <h2>{{ lang('Comments', 'item page') }}</h2>
            @auth
                <form action="{{ route('comment.store', $item->id) }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label for="comment" class="form-label">{{ lang('Add a Comment', 'item page') }}</label>
                        <textarea name="comment" id="comment" class="form-control" rows="3" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">{{ lang('Submit', 'item page') }}</button>
                </form>
            @else
                <p>{{ lang('Please log in to add a comment.', 'item page') }}</p>
            @endauth
            <div class="mt-4">
                @foreach ($comments as $comment)
                    <div class="card mb-3">
                        <div class="card-body">
                            <p class="card-text">{{ $comment->comment }}</p>
                            <p class="card-text"><small class="text-muted">{{ $comment->created_at->diffForHumans() }} by {{ $comment->user->name }}</small></p>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@endsection