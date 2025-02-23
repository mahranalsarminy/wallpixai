@extends('admin.layouts.form')

@section('section', admin_lang('Categories'))
@section('title', admin_lang('Add Category'))
@section('container', 'container-max-lg')

@section('content')
    <form action="{{ route('admin.categories.store') }}" method="POST">
        @csrf
        <div class="card mb-3">
            <div class="card-header">{{ admin_lang('Add Category') }}</div>
            <div class="card-body">
                <div class="mb-3">
                    <label for="name" class="form-label">{{ admin_lang('Name') }}</label>
                    <input type="text" name="name" id="name" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary">{{ admin_lang('Save') }}</button>
            </div>
        </div>
    </form>
@endsection