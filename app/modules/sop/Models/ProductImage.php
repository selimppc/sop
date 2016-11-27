<?php
/**
 * Created by PhpStorm.
 * User: etsb
 * Date: 2/16/16
 * Time: 5:05 PM
 */

namespace App;


use Illuminate\Database\Eloquent\Model;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProductImage extends Model
{

    protected $table = 'product_image';

    protected $fillable = [
        'price_list_id',
        'title',
        'description',
        'image',
        'thumbnail',
        'status'
    ];

    public function relPriceList(){
        return $this->belongsTo('App\PriceList', 'price_list_id', 'id');
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