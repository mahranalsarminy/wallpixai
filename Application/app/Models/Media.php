<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Media extends Model
{
    use HasFactory;

    // Other methods and relationships...

    public function analytics()
    {
        return $this->hasOne(MediaAnalytics::class);
    }

    public function incrementViewCount()
    {
        $this->analytics->increment('views');
    }

    public function incrementLikeCount()
    {
        $this->analytics->increment('likes');
    }

    public function incrementShareCount()
    {
        $this->analytics->increment('shares');
    }
}