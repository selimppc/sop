<?php
/**
 * Created by PhpStorm.
 * User: etsb
 * Date: 9/25/16
 * Time: 11:14 AM
 */

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;


class LeaveHead extends Model
{
    protected $table = 'leave_head';

    protected $fillable = [
        'user_id','user_name','user_email','date','from_date','to_date','reason','status'
    ];

    public function relUser(){
        return $this->belongsTo('App\User','user_id','id');
    }

    public function relLeaveDetail(){
        return $this->hasMany('App\LeaveDetail');
    }


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