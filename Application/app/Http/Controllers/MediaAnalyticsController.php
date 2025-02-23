<?php

namespace App\Http\Controllers;

use App\Models\Media;
use Illuminate\Http\Request;

class MediaAnalyticsController extends Controller
{
    public function show(Media $media)
    {
        return view('media.analytics', compact('media'));
    }
}