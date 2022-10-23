<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Company extends Model
{
    public function customers()
    {
        return $this->belongsToMany('App\Customer', 'company_customers', 'company_id', 'customer_id');
    }

    public function user() {
        return $this->belongsTo('App\User', 'user_id');
    }

    public function city() {
        return $this->belongsTo('App\City', 'city_id');
    }
}
