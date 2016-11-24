<?php
/**
 * Created by PhpStorm.
 * User: etsb
 * Date: 10/26/15
 * Time: 1:13 PM
 */

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class Settings extends Model
{

    protected $table = 'settings';

    protected $fillable = [
        'title_full',
        'title',
        'status',
        'user_type'
    ];
}