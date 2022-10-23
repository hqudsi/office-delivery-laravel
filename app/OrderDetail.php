<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class OrderDetail extends Model
{
    public function order() {
        return $this->belongsTo('App\Order', 'order_id');
    }

    public function packSize() {
        return $this->belongsTo('App\PackSize', 'pack_size_id');
    }
}
