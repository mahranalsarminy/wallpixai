@extends('admin.layouts.app')

@section('content')
<div class="container">
    <h1>Media Reports</h1>
    <div class="reports-list">
        @foreach($reports as $report)
            <div class="report-item">
                <h3>Report #{{ $report->id }}</h3>
                <p>Media: <a href="{{ route('media.show', $report->media) }}">{{ $report->media->title }}</a></p>
                <p>Reason: {{ $report->reason }}</p>
                <p>Status: {{ $report->status }}</p>
                <form action="{{ route('admin.reports.update', $report) }}" method="POST">
                    @csrf
                    @method('PUT')
                    <label for="status">Status:</label>
                    <select name="status" id="status">
                        <option value="pending" {{ $report->status == 'pending' ? 'selected' : '' }}>Pending</option>
                        <option value="resolved" {{ $report->status == 'resolved' ? 'selected' : '' }}>Resolved</option>
                        <option value="unresolved" {{ $report->status == 'unresolved' ? 'selected' : '' }}>Unresolved</option>
                    </select>
                    <button type="submit">Update</button>
                </form>
            </div>
        @endforeach
    </div>
    {{ $reports->links() }}
</div>
@endsection