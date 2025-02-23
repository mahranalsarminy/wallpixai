<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class DownloadController extends Controller
{
    public function downloadImage(Request $request, $imageId)
    {
        $user = $request->user();
        if ($user->canDownloadImage()) {
            $image = // Fetch image logic here
            if ($user->shouldApplyWatermark()) {
                $image = $this->applyWatermark($image);
            }
            // Implement image download logic here
        } else {
            return redirect()->back()->with('error', 'You have reached your download limit for images.');
        }
    }

    public function downloadVideo(Request $request, $videoId)
    {
        $user = $request->user();
        if ($user->canDownloadVideo()) {
            $video = // Fetch video logic here
            if ($user->shouldApplyWatermark()) {
                $video = $this->applyWatermark($video);
            }
            // Implement video download logic here
        } else {
            return redirect()->back()->with('error', 'You have reached your download limit for videos.');
        }
    }

    private function applyWatermark($file)
    {
        // Implement watermark logic here
        return $file;
    }
}