<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Driver extends Model
{
    public function company() {
        return $this->belongsTo('App\Company', 'company_id');
    }

    public function user() {
        return $this->belongsTo('App\User', 'user_id');
    }
}
