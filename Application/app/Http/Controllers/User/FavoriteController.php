<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\GeneratedImage;
use App\Models\GeneratedVideo;
use Illuminate\Http\Request;

class FavoriteController extends Controller
{
    public function toggle(Request $request, $id)
    {
        $type = $request->input('type');
        $user = auth()->user();

        if ($type == 'image') {
            $media = GeneratedImage::findOrFail($id);
            $user->favoriteImages()->toggle($media->id);
        } else {
            $media = GeneratedVideo::findOrFail($id);
            $user->favoriteVideos()->toggle($media->id);
        }

        return response()->json(['success' => true]);
    }

    public function index()
    {
        $favoriteImages = auth()->user()->favoriteImages;
        $favoriteVideos = auth()->user()->favoriteVideos;
        return view('user.favorites.index', compact('favoriteImages', 'favoriteVideos'));
    }
}