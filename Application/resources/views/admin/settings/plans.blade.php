@extends('admin.layouts.form')

@section('section', admin_lang('Settings'))
@section('title', admin_lang('Plans'))
@section('container', 'container-max-lg')

@section('content')
    <form action="{{ route('admin.settings.plans.update') }}" method="POST">
        @csrf
        <div class="card mb-3">
            <div class="card-header">{{ admin_lang('Plans') }}</div>
            <div class="card-body p-4">
                @foreach ($plans as $plan)
                    <div class="row g-3 mb-2">
                        <div class="col-lg-4">
                            <label class="form-label">{{ admin_lang('Plan Name') }}:</label>
                            <input type="text" name="plans[{{ $plan->id }}][name]" class="form-control" value="{{ $plan->name }}">
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label">{{ admin_lang('Max Image Downloads') }}:</label>
                            <input type="number" name="plans[{{ $plan->id }}][max_image_downloads]" class="form-control" value="{{ $plan->max_image_downloads }}">
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label">{{ admin_lang('Max Video Downloads') }}:</label>
                            <input type="number" name="plans[{{ $plan->id }}][max_video_downloads]" class="form-control" value="{{ $plan->max_video_downloads }}">
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label">{{ admin_lang('Watermark Downloads') }}:</label>
                            <select name="plans[{{ $plan->id }}][watermark_downloads]" class="form-control">
                                <option value="1" @if($plan->watermark_downloads) selected @endif>{{ admin_lang('Yes') }}</option>
                                <option value="0" @if(!$plan->watermark_downloads) selected @endif>{{ admin_lang('No') }}</option>
                            </select>
                        </div>
                    </div>
                @endforeach
                <button type="submit" class="btn btn-primary">{{ admin_lang('Save Plans') }}</button>
            </div>
        </div>
    </form>
@endsection