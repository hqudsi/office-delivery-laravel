<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class StatusDetail extends Model
{
    public function status() {
        return $this->belongsTo('App\Status', 'status_id');
    }
}
