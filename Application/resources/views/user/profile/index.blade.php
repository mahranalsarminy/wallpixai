@extends('layouts.app')
@section('content')
    <div class="container">
        <h1>{{ lang('User Profile', 'profile page') }}</h1>
        <div class="row">
            <div class="col-md-4">
                <div class="card mb-3">
                    <div class="card-body">
                        <h5 class="card-title">{{ auth()->user()->name }}</h5>
                        <p class="card-text">{{ auth()->user()->email }}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center mt-4">
            <a href="{{ route('user.profile.my-media') }}" class="btn btn-primary">{{ lang('My Media', 'profile page') }}</a>
        </div>
    </div>
@endsection