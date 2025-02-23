@extends('admin.layouts.form')

@section('section', admin_lang('Categories'))
@section('title', admin_lang('Categories'))
@section('container', 'container-max-lg')

@section('content')
    <a href="{{ route('admin.categories.create') }}" class="btn btn-primary mb-3">{{ admin_lang('Add Category') }}</a>
    <div class="card">
        <div class="card-header">{{ admin_lang('Categories') }}</div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>{{ admin_lang('Name') }}</th>
                        <th>{{ admin_lang('Actions') }}</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($categories as $category)
                        <tr>
                            <td>{{ $category->name }}</td>
                            <td>
                                <a href="{{ route('admin.categories.show', $category->id) }}" class="btn btn-info btn-sm">{{ admin_lang('View') }}</a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection