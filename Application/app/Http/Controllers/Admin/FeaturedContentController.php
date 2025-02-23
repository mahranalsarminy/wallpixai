<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class FeaturedContentController extends Controller
{
    public function index()
    {
        $featuredImageCount = config('settings.featured_image_count', 10);
        $featuredVideoCount = config('settings.featured_video_count', 10);
        $featuredImages = FeaturedImage::all();
        $featuredVideos = FeaturedVideo::all();
        return view('admin.featured-content.index', compact('featuredImageCount', 'featuredVideoCount', 'featuredImages', 'featuredVideos'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'featured_image_count' => 'required|integer|min:1',
            'featured_video_count' => 'required|integer|min:1',
            'featured_images' => 'array',
            'featured_videos' => 'array',
        ]);

        $path = config_path('settings.php');
        $config = include($path);
        $config['featured_image_count'] = $request->featured_image_count;
        $config['featured_video_count'] = $request->featured_video_count;

        file_put_contents($path, '<?php return ' . var_export($config, true) . ';');

        FeaturedImage::truncate();
        FeaturedVideo::truncate();

        if ($request->has('featured_images')) {
            foreach ($request->featured_images as $imageId) {
                FeaturedImage::create(['image_id' => $imageId]);
            }
        }

        if ($request->has('featured_videos')) {
            foreach ($request->featured_videos as $videoId) {
                FeaturedVideo::create(['video_id' => $videoId]);
            }
        }

        return redirect()->route('admin.featured-content.index')->with('success', 'Settings updated successfully.');
    }
}