<?php

namespace App\Http\Controllers;

use App\Models\Media;
use App\Models\MediaRating;
use Illuminate\Http\Request;

class MediaRatingController extends Controller
{
    public function store(Request $request, Media $media)
    {
        $request->validate([
            'rating' => 'required|integer|min:1|max:5',
        ]);

        MediaRating::updateOrCreate(
            ['user_id' => auth()->id(), 'media_id' => $media->id],
            ['rating' => $request->rating]
        );

        return back()->with('success', 'Your rating has been submitted.');
    }
}