@extends('admin.layouts.form')
@section('section', admin_lang('Settings'))
@section('title', admin_lang('Edit Captcha Provider'))
@section('back', route('admin.settings.captcha-providers.index'))
@section('container', 'container-max-lg')
@section('content')
    <form id="vironeer-submited-form" action="{{ route('admin.settings.captcha-providers.update', $captchaProvider->id) }}"
        method="POST">
        @csrf
        <div class="card mb-4">
            <div class="card-body">
                <div class="vironeer-file-preview-box bg-light mb-3 p-4 text-center">
                    <div class="file-preview-box mb-3">
                        <img id="filePreview" src="{{ asset($captchaProvider->logo) }}" height="100px" height="100px">
                    </div>
                </div>
                <div class="row g-3 mb-3">
                    <div class="col-lg-6">
                        <label class="form-label">{{ admin_lang('Name') }} </label>
                        <input class="form-control" value="{{ admin_lang($captchaProvider->name) }}" disabled>
                    </div>

                    <div class="col-lg-6">
                        <label class="form-label">{{ admin_lang('Status') }} </label>
                        <input type="checkbox" name="status" data-toggle="toggle"
                            {{ $captchaProvider->isActive() ? 'checked' : '' }}>
                    </div>
                </div>
            </div>
        </div>
        @if ($captchaProvider->instructions)
            <div class="card mb-4">
                <div class="card-header">
                    <i class="far fa-question-circle me-2"></i>
                    {{ admin_lang('Instructions') }}
                </div>
                <div class="card-body">
                    {!! str_replace('[URL]', url('/'), $captchaProvider->instructions) !!}
                </div>
            </div>
        @endif
        <div class="card mb-4">
            <div class="card-header">
                <i class="fa fa-cog me-2"></i>
                {{ admin_lang('Settings') }}
            </div>
            <div class="card-body">
                <div class="row g-3 pb-2">
                    @foreach ($captchaProvider->settings as $key => $value)
                        <div class="col-lg-12">
                            <label class="form-label capitalize">
                                {{ admin_lang(str_replace('_', ' ', $key)) }}
                            </label>
                            <input type="text" name="settings[{{ $key }}]" value="{{ demo($value) }}"
                                class="form-control remove-spaces">
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </form>
@endsection
