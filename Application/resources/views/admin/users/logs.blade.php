@extends('admin.layouts.grid')
@section('section', admin_lang('Users'))
@section('title', admin_lang('Login Logs for ' . request()->ip))
@section('back', route('admin.users.index'))
@section('content')
    <div class="card custom-card">
        <div class="card-body">
            @if (!demoMode())
                @forelse ($logs as $log)
                    <div class="logs-box justify-items-center">
                        <div class="content ms-1 d-flex justify-content-between">
                            <span>
                                <h5><a href="{{ route('admin.users.logsbyip', $log->ip) }}">{{ $log->ip }}</a></h5>
                                <p class="text-muted capitalize"><i
                                        class="fas fa-map-marker-alt me-2"></i>{{ $log->location }}
                                    <span class="me-1 ms-1">|</span> <i class="fa fa-user me-1"></i> <a
                                        href="{{ route('admin.users.edit', $log->user->id) }}">{{ $log->user->name }}</a>
                                </p>
                            </span>
                            <span>
                                <a href="#" data-user="{{ $log->user->id }}" data-log="{{ $log->id }}"
                                    class="vironeer-getlog-btn btn btn-blue btn-sm"><i class="fas fa-desktop"></i></a>
                            </span>
                        </div>
                    </div>
                @empty
                    @include('admin.includes.empty')
                @endforelse
            @else
                <div>{{ admin_lang('Hidden in demo') }}</div>
            @endif
        </div>
    </div>
    {{ $logs->links() }}
    @include('admin.includes.logsmodal')
@endsection
