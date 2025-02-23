<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\GeneratedImage;
use App\Models\GeneratedVideo;
use Illuminate\Http\Request;

class GeneratedMediaController extends Controller
{
    public function index()
    {
        $images = GeneratedImage::all();
        $videos = GeneratedVideo::all();
        return view('admin.generated-media.index', compact('images', 'videos'));
    }

    public function edit($id, $type)
    {
        if ($type == 'image') {
            $media = GeneratedImage::findOrFail($id);
        } else {
            $media = GeneratedVideo::findOrFail($id);
        }
        return view('admin.generated-media.edit', compact('media', 'type'));
    }

    public function update(Request $request, $id, $type)
    {
        if ($type == 'image') {
            $media = GeneratedImage::findOrFail($id);
        } else {
            $media = GeneratedVideo::findOrFail($id);
        }

        $request->validate([
            'prompt' => 'required|string|max:255',
            'file' => 'nullable|mimes:jpeg,png,jpg,gif,svg,mp4,avi,mov|max:20480',
        ]);

        $media->prompt = $request->prompt;

        if ($request->hasFile('file')) {
            $path = $request->file('file')->store('generated_media');
            $media->path = $path;
        }

        $media->save();

        return redirect()->route('admin.generated-media.index')->with('success', 'Media updated successfully.');
    }

    public function destroy($id, $type)
    {
        if ($type == 'image') {
            $media = GeneratedImage::findOrFail($id);
        } else {
            $media = GeneratedVideo::findOrFail($id);
        }

        $media->delete();

        return redirect()->route('admin.generated-media.index')->with('success', 'Media deleted successfully.');
    }
}