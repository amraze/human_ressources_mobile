<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;

    protected $fillable = [
        'leader_id',
        'name',
        'description',
        'start_date',
        'end_date',
        'deadline',
        'category',
    ];
}
