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


class LeaveDetail extends Model
{
    protected $table = 'leave_detail';

    protected $fillable = [
        'leave_head_id','user_id','date','note','status'
    ];


    public function relUser(){
        return $this->belongsTo('App\User','user_id','id');
    }

    public function relLeaveHead(){
        return $this->belongsTo('App\LeaveHead','leave_head_id','id');
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