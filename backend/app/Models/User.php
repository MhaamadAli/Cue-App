<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    protected $fillable = ['username', 'email', 'password_hash', 'role'];

    protected $hidden = ['password_hash'];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    public function tasks()
    {
        return $this->hasMany('App\Models\Task', 'user_id');
    }


    public function meetings()
    {
        return $this->hasMany('App\Models\Meeting', 'user_id');
    }


    public function feedbacks()
    {
        return $this->hasMany('App\Models\Feedback', 'user_id');
    }


    public function locations()
    {
        return $this->hasMany('App\Models\Location', 'user_id');
    }
}
