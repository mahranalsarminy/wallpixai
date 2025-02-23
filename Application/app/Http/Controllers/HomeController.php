<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Engine;
use App\Models\GeneratedImage;
use App\Models\Image;
use App\Models\Video;
use App\Models\FeaturedImage;
use App\Models\FeaturedVideo;

class HomeController extends Controller
{
    public function index()
    {
        $recentImages = Image::orderBy('created_at', 'desc')->take(5)->get();
        $recentVideos = Video::orderBy('created_at', 'desc')->take(5)->get();
        $featuredImages = FeaturedImage::with('image')->take(config('settings.featured_image_count', 10))->get();
        $featuredVideos = FeaturedVideo::with('video')->take(config('settings.featured_video_count', 10))->get();

        return view('home.index', compact('recentImages', 'recentVideos', 'featuredImages', 'featuredVideos'));
    }
}
