<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MediaAnalytics extends Model
{
    use HasFactory;

    protected $fillable = ['media_id', 'views', 'likes', 'shares'];

    public function media()
    {
        return $this->belongsTo(Media::class);
    }
}