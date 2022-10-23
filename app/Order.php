<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Order extends Model
{
    public function from() {
        return $this->belongsTo('App\City', 'from_id');
    }

    public function to() {
        return $this->belongsTo('App\City', 'to_id');
    }

    public function status() {
        return $this->belongsTo('App\Status', 'status_id');
    }

    public function company() {
        return $this->belongsTo('App\Company', 'company_id');
    }

    public function customer() {
        return $this->belongsTo('App\Customer', 'customer_id');
    }

    public function driver() {
        return $this->belongsTo('App\Driver', 'driver_id');
    }

    public function orderCosts() {
        return $this->hasMany('App\OrderCost', 'order_id', 'id');
    }

    public function orderDetails() {
        return $this->hasMany('App\OrderDetail', 'order_id', 'id');
    }

    public function statusDetails() {
        return $this->hasMany('App\StatusDetail', 'order_id', 'id');
    }

    public function orderDrivers() {
        return $this->hasMany('App\OrderDriver', 'order_id', 'id');
    }

    public function packChanges() {
        return $this->hasMany('App\PackChange', 'order_id', 'id');
    }

    public function collections() {
        return $this->hasMany('App\Collection', 'order_id', 'id');
    }

    public function customerCollections() {
        return $this->hasMany('App\CustomerCollection', 'order_id', 'id');
    }

    public function transactions() {
        return $this->hasMany('App\Transaction', 'order_id', 'id');
    }

    public function customerPaymentObject() {
        return $this->belongsTo('App\CustomerPayment', 'customer_payment_id');
    }

    public function financialStatusChanges() {
        return $this->belongsTo('App\FinancialStatusChange', 'customer_payment_id');
    }

    public function driverCollection() {
        return $this->belongsTo('App\DriverCollectionVoucher', 'driver_collection_id');
    }
}
