<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Image\Manipulations;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Blog extends Model implements HasMedia
{
    use HasFactory,InteractsWithMedia,SoftDeletes;

    protected $table='blogs';
    protected $primaryKey='id';
    protected $fillable=[
        'name',
        'title',
        'description',
        'status'
    ];

    public function registerMediaCollections(): void {
        $this->addMediaCollection('image');
    }
    public function registerMediaConversions(Media $media = null): void
    {
        $this->addMediaConversion('thumb')
            ->width(100);
        $this->addMediaConversion('blogs')
            ->crop(Manipulations::CROP_CENTER, 500, 500);
        $this->addMediaConversion('blog')
            ->crop(Manipulations::CROP_CENTER, 1290, 500)->withResponsiveImages();

    }
}
