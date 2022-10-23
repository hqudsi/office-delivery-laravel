<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Customer extends Model
{
    public function city() {
        return $this->belongsTo('App\City', 'city_id');
    }

    public function user() {
        return $this->belongsTo('App\User', 'user_id');
    }

    public function companies()
    {
        return $this->belongsToMany('App\Company', 'company_customers', 'customer_id', 'company_id');
    }
}
