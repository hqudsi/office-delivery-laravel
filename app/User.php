<?php

namespace App;

use DB;
use Carbon\Carbon;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use App\Notifications\ResetPassword as ResetPasswordNotification;
use Tymon\JWTAuth\Contracts\JWTSubject;


class User extends \TCG\Voyager\Models\User implements JWTSubject
{
    use Notifiable;

    protected $dates = ['deleted_at'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public $searchable = ['name'];

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }

    public function sendPasswordResetNotification($token)
    {
        // Your own implementation.
        $this->notify(new ResetPasswordNotification($token));
    }

    public function system() {
        return $this->belongsTo('App\System', 'system_id');
    }

    public function systems()
    {
        return $this->belongsToMany('App\System', 'user_systems', 'user_id', 'system_id');
    }
}
