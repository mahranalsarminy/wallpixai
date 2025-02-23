<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class PexelsController extends Controller
{
    public function index()
    {
        $apiKey = config('services.pexels.api_key');
        $similarContentCount = config('services.pexels.similar_content_count');
        return view('admin.pexels.index', compact('apiKey', 'similarContentCount'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'api_key' => 'required|string|max:255',
            'similar_content_count' => 'required|integer|min:1',
        ]);

        $path = config_path('services.php');
        $config = include($path);
        $config['pexels']['api_key'] = $request->api_key;
        $config['pexels']['similar_content_count'] = $request->similar_content_count;

        file_put_contents($path, '<?php return ' . var_export($config, true) . ';');

        return redirect()->route('admin.pexels.index')->with('success', 'Settings updated successfully.');
    }
}