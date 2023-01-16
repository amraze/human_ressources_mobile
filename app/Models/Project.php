<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;//HasFactory permet le remplissage par des donnees aléatoires .

    protected $fillable = [
        'leader_id',
        'name',
        'description',
        'start_date',
        'end_date',
        'deadline',
        'category',
    ];
//la relation many to many entre la table users et la table project sera definie comme suit  
    public function users()
    {
        return $this->belongsToMany(User::class, 'user_project');
    }
}
