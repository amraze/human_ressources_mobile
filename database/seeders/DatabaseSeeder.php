<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\Performance;
use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Project;
use App\Models\Task;
use App\Models\UserProject;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $users1 = User::factory(4)->create();
        Project::factory()->hasAttached($users1)->create();
        $users2 = User::factory(3)->create();
        Project::factory()->hasAttached($users2)->create();
        $users3 = User::factory(3)->create();
        Project::factory()->hasAttached($users3)->create();
        Task::factory(50)->create();
        Performance::factory(10)->create();
    }
}
