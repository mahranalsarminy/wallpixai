@extends('layouts.single')
@section('title', lang('Contact Us', 'pages'))
@section('content')
    {!! ads_other_pages_top() !!}
    <div class="section-header mb-5">
        <h1 class="mb-3">{{ lang('Contact Us', 'pages') }}</h1>
        <p class="fw-light text-muted col-lg-7 mb-0">{{ lang('Contact Us Description', 'pages') }}</p>
    </div>
    <div class="section-body">
        <div class="contact-us">
            <div class="card-v">
                <form action="{{ route('contact') }}" method="POST">
                    @csrf
                    <div class="row row-cols-1 g-3 row-cols-md-2 gx-3 mb-3">
                        <div class="col">
                            <label class="form-label">{{ lang('Name', 'forms') }}</label>
                            <input type="text" name="name" class="form-control form-control-md"
                                value="{{ authUser()->name ?? old('name') }}" required />
                        </div>
                        <div class="col">
                            <label class="form-label">{{ lang('Email address', 'forms') }}</label>
                            <input type="email" name="email" class="form-control form-control-md"
                                value="{{ authUser()->email ?? old('email') }}" required />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">{{ lang('Subject', 'forms') }}</label>
                        <input type="text" name="subject" class="form-control form-control-md"
                            value="{{ old('subject') }}" required />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">{{ lang('Message', 'forms') }}</label>
                        <textarea type="text" name="message"class="form-control" rows="8" required>{{ old('message') }}</textarea>
                    </div>
                    <x-captcha />
                    <button class="btn btn-primary btn-md"><i
                            class="far fa-paper-plane me-2"></i>{{ lang('Send', 'pages') }}</button>
                </form>
            </div>
        </div>
    </div>
    {!! ads_other_pages_bottom() !!}
@endsection
