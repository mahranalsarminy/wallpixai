<?php

namespace App\Http\Controllers;

use App\Models\VideoWallpaper;
use Illuminate\Http\Request;

class VideoWallpaperController extends Controller
{
    public function index()
    {
        $videoWallpapers = VideoWallpaper::all();
        return view('video_wallpapers.index', compact('videoWallpapers'));
    }

    public function create()
    {
        return view('video_wallpapers.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'video' => 'required|mimes:mp4,avi,mov|max:20480',
        ]);

        $path = $request->file('video')->store('video_wallpapers');

        VideoWallpaper::create([
            'title' => $request->title,
            'path' => $path,
        ]);

        return redirect()->route('video_wallpapers.index')->with('success', 'Video wallpaper created successfully.');
    }
}