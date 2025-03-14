<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Plan extends Model
{
    use HasFactory;

    public function scopeMonthly($query)
    {
        $query->where('interval', 1);
    }

    public function scopeYearly($query)
    {
        $query->where('interval', 2);
    }

    public function scopeFree($query)
    {
        $query->where('is_free', 1);
    }

    public function scopeNotFree($query)
    {
        $query->where('is_free', 0);
    }

    public function isFree()
    {
        return $this->is_free;
    }

    public function isFeatured()
    {
        return $this->is_featured;
    }

    public function scopeForGuests($query)
    {
        $query->where('is_free', 1)->where('login_require', 0);
    }

    public function isForGuests()
    {
        return $this->is_free && !$this->login_require;
    }

    protected $fillable = [
        'name',
        'short_description',
        'interval',
        'price',
        'images',
        'max_images',
        'engines',
        'expiration',
        'advertisements',
        'watermark',
        'custom_features',
        'is_free',
        'login_require',
        'is_featured',
        'max_image_downloads',
        'max_video_downloads',
        'watermark_downloads',
    ];

    protected $casts = [
        'images' => 'int',
        'max_images' => 'int',
        'engines' => 'array',
        'custom_features' => 'object',
    ];

    public function getEngines()
    {
        if ($this->engines) {
            $engines = Engine::whereIn('id', $this->engines)
                ->active()->get();
            if ($engines->count() > 0) {
                return $engines;
            }
        }
        return null;
    }

    public function subscriptions()
    {
        return $this->hasMany(Subscription::class);
    }

    public function transactions()
    {
        return $this->hasMany(Subscription::class);
    }
}
