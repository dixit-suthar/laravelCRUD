<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ApplyLeave extends Model
{
    use HasFactory;
    protected $table = 'apply_leave';
    protected $fillable = ['status'];

    public function user(){
        return $this->belongsTo('App\Models\User','users_id');
    }

}
