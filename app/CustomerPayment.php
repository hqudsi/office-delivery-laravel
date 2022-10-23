<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class CustomerPayment extends Model
{

    public function customer() {
        return $this->belongsTo('App\Customer', 'customer_id');
    }

    public function company() {
        return $this->belongsTo('App\Company', 'company_id');
    }

    public function user() {
        return $this->belongsTo('App\User', 'user_id');
    }

    public function orders() {
        return $this->belongsToMany('App\Order', 'customer_payment_orders', 'customer_payment_id', 'order_id');
    }
}
