@extends('layouts.app')
@section('title', 'Generate Media')
@section('content')
    <div class="container">
        <h1>{{ lang('Generate Media', 'media generation') }}</h1>
        <form action="{{ route('user.media-generation.store') }}" method="POST">
            @csrf
            <div class="mb-3">
                <label for="prompt" class="form-label">{{ lang('Prompt', 'media generation') }}</label>
                <input type="text" name="prompt" id="prompt" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="type" class="form-label">{{ lang('Type', 'media generation') }}</label>
                <select name="type" id="type" class="form-control" required>
                    <option value="image">{{ lang('Image', 'media generation') }}</option>
                    <option value="video">{{ lang('Video', 'media generation') }}</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">{{ lang('Generate', 'media generation') }}</button>
        </form>
    </div>
@endsection