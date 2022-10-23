<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class DriverCollectionVoucher extends Model
{
    public function driver() {
        return $this->belongsTo('App\Driver', 'driver_id');
    }

    public function company() {
        return $this->belongsTo('App\Company', 'company_id');
    }

    public function user() {
        return $this->belongsTo('App\User', 'user_id');
    }

    public function orders() {
        return $this->belongsToMany('App\Order', 'collection_orders', 'driver_collection_voucher_id', 'order_id');
    }
}
