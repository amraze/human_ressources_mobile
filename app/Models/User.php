<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    protected $fillable = [
        'first_name',
        'last_name',
        'age',
        'is_available',
        'position',
        'overall_performance',
        'image',
        'email',
        'password',
    ];
//ces informations ne doivent pas figurer dans notre reponse Json en raison dde sécurité.
    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
//la relation many to many entre la table users et la table project sera definie comme suit  

    public function projects()
    {
        return $this->belongsToMany(Project::class, 'user_project');
    }
}
