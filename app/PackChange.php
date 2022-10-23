<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class PackChange extends Model
{
    public function user() {
        return $this->belongsTo('App\User', 'user_id');
    }

    public function order() {
        return $this->belongsTo('App\Order', 'order_id');
    }
}
