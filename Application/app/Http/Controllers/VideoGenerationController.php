<?php

namespace App\Http\Controllers;

use App\Models\GeneratedVideo;
use Illuminate\Http\Request;

class VideoGenerationController extends Controller
{
    public function index()
    {
        return view('video_generation.index');
    }

    public function generate(Request $request)
    {
        $request->validate([
            'prompt' => 'required|string|max:255',
        ]);

        // Implement video generation logic here
        $path = 'path/to/generated/video.mp4';

        GeneratedVideo::create([
            'prompt' => $request->prompt,
            'path' => $path,
        ]);

        return redirect()->route('video_generation.index')->with('success', 'Video generated successfully.');
    }
}