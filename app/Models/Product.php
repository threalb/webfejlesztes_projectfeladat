<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Product extends Model implements HasMedia
{
    use HasFactory,InteractsWithMedia,SoftDeletes;

    protected $table='products';
    protected $primaryKey='id';
    protected $fillable=[
        'name',
        'size',
        'product_type_id',
        'quantity',
        'description',
        'status',
    ];
    protected $guarded=[];

    public function role(){
        return $this->belongsTo(ProductType::class,'product_type_id');
    }
    public function registerMediaCollections(): void {
        $this->addMediaCollection('image');
    }
    public function registerMediaConversions(Media $media = null): void
    {
        $this->addMediaConversion('thumb')
            ->height(75);
        $this->addMediaConversion('public')
            ->width(200)->height(200);

    }

}

