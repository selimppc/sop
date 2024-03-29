<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class PriceList extends Model
{
    protected $table = 'price_list';

    protected $fillable = [
        'code',
        'description',
        'unit',
        'price',
        'product_category_id',
        'status',
    ];


    public function relProductImage(){
        return $this->hasMany('App\ProductImage', 'price_list_id', 'id');
    }

    // TODO :: boot
    // boot() function used to insert logged user_id at 'created_by' & 'updated_by'

    public static function boot(){
        parent::boot();
        static::creating(function($query){
            if(Auth::check()){
                $query->created_by = Auth::user()->id;
            }
        });
        static::updating(function($query){
            if(Auth::check()){
                $query->updated_by = Auth::user()->id;
            }
        });
    }



}