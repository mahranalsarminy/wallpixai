<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\GeneratedImage;
use App\Models\GeneratedVideo;
use Illuminate\Http\Request;

class MediaGenerationController extends Controller
{
    public function create()
    {
        return view('user.media-generation.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'prompt' => 'required|string|max:255',
            'type' => 'required|in:image,video',
        ]);

        if ($request->type == 'image') {
            // Implement image generation logic here
            $path = 'path/to/generated/image.jpg';

            GeneratedImage::create([
                'user_id' => auth()->id(),
                'prompt' => $request->prompt,
                'path' => $path,
            ]);
        } else {
            // Implement video generation logic here
            $path = 'path/to/generated/video.mp4';

            GeneratedVideo::create([
                'user_id' => auth()->id(),
                'prompt' => $request->prompt,
                'path' => $path,
            ]);
        }

        return redirect()->route('user.profile.my-media')->with('success', 'Media generated successfully.');
    }
}