@extends('admin.layouts.form')

@section('section', admin_lang('Pexels API Settings'))
@section('title', admin_lang('Pexels API Settings'))
@section('container', 'container-max-lg')

@section('content')
    <form action="{{ route('admin.pexels.store') }}" method="POST">
        @csrf
        <div class="card mb-3">
            <div class="card-header">{{ admin_lang('Pexels API Settings') }}</div>
            <div class="card-body">
                <div class="mb-3">
                    <label for="api_key" class="form-label">{{ admin_lang('API Key') }}</label>
                    <input type="text" name="api_key" id="api_key" class="form-control" value="{{ $apiKey }}" required>
                </div>
                <div class="mb-3">
                    <label for="similar_content_count" class="form-label">{{ admin_lang('Number of Similar Content Items') }}</label>
                    <input type="number" name="similar_content_count" id="similar_content_count" class="form-control" value="{{ $similarContentCount }}" required>
                </div>
                <button type="submit" class="btn btn-primary">{{ admin_lang('Save') }}</button>
            </div>
        </div>
    </form>
@endsection