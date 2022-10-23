<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class OrderDriver extends Model
{
    public function order() {
        return $this->belongsTo('App\Order', 'order_id');
    }
}
