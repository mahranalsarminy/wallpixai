<?php

namespace App\Http\Controllers;

use App\Models\Media;
use App\Models\MediaReport;
use Illuminate\Http\Request;

class MediaReportController extends Controller
{
    public function store(Request $request, Media $media)
    {
        $request->validate([
            'reason' => 'required|string|max:255',
        ]);

        MediaReport::create([
            'user_id' => auth()->id(),
            'media_id' => $media->id,
            'reason' => $request->reason,
        ]);

        return back()->with('success', 'Your report has been submitted.');
    }

    public function index()
    {
        $reports = MediaReport::latest()->paginate(10);
        return view('admin.reports.index', compact('reports'));
    }

    public function update(Request $request, MediaReport $report)
    {
        $request->validate([
            'status' => 'required|string|in:pending,resolved,unresolved',
        ]);

        $report->update(['status' => $request->status]);

        return back()->with('success', 'Report status updated.');
    }
}