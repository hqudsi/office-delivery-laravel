<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Transaction extends Model
{

    public function company() {
        return $this->belongsTo('App\Company', 'company_id');
    }

    public function customer() {
        return $this->belongsTo('App\Customer', 'customer_id');
    }

    public function order() {
        return $this->belongsTo('App\Order', 'order_id');
    }

}
