<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVideoWallpapersTable extends Migration
{
    public function up()
    {
        Schema::create('video_wallpapers', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('path');
            $table->timestamps();
        });

        Schema::create('generated_videos', function (Blueprint $table) {
            $table->id();
            $table->string('prompt');
            $table->string('path');
            $table->timestamps();
        });

        Schema::table('plans', function (Blueprint $table) {
            $table->integer('max_image_downloads')->default(10);
            $table->integer('max_video_downloads')->default(5);
            $table->boolean('watermark_downloads')->default(true);
        });
    }

    public function down()
    {
        Schema::dropIfExists('video_wallpapers');
        Schema::dropIfExists('generated_videos');

        Schema::table('plans', function (Blueprint $table) {
            $table->dropColumn('max_image_downloads');
            $table->dropColumn('max_video_downloads');
            $table->dropColumn('watermark_downloads');
        });
    }
}