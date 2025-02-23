@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Generate Video</h1>
    <form action="{{ route('video_generation.generate') }}" method="POST">
        @csrf
        <div class="mb-3">
            <label for="prompt" class="form-label">Prompt</label>
            <input type="text" name="prompt" id="prompt" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Generate Video</button>
    </form>
</div>
@endsection