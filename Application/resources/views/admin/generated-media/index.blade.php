@extends('admin.layouts.form')

@section('section', admin_lang('Generated Media'))
@section('title', admin_lang('Generated Media'))
@section('container', 'container-max-lg')

@section('content')
    <div class="card">
        <div class="card-header">{{ admin_lang('Generated Images') }}</div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>{{ admin_lang('Prompt') }}</th>
                        <th>{{ admin_lang('Actions') }}</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($images as $image)
                        <tr>
                            <td>{{ $image->prompt }}</td>
                            <td>
                                <a href="{{ route('admin.generated-media.edit', [$image->id, 'image']) }}" class="btn btn-info btn-sm">{{ admin_lang('Edit') }}</a>
                                <form action="{{ route('admin.generated-media.destroy', [$image->id, 'image']) }}" method="POST" class="d-inline-block">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-danger btn-sm">{{ admin_lang('Delete') }}</button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <div class="card mt-5">
        <div class="card-header">{{ admin_lang('Generated Videos') }}</div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>{{ admin_lang('Prompt') }}</th>
                        <th>{{ admin_lang('Actions') }}</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($videos as $video)
                        <tr>
                            <td>{{ $video->prompt }}</td>
                            <td>
                                <a href="{{ route('admin.generated-media.edit', [$video->id, 'video']) }}" class="btn btn-info btn-sm">{{ admin_lang('Edit') }}</a>
                                <form action="{{ route('admin.generated-media.destroy', [$video->id, 'video']) }}" method="POST" class="d-inline-block">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-danger btn-sm">{{ admin_lang('Delete') }}</button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection