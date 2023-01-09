<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class TaskFactory extends Factory
{
    public function definition()
    {
        return [
            'user_id' => fake()->numberBetween(1, 10),
            'project_id' => fake()->numberBetween(1, 3),
            'name' => fake()->name(),
            'description' => fake()->paragraph(),
            'grade' => fake()->numberBetween(0, 100),
            'start_date' => fake()->dateTimeBetween('2023-10-01', '2023-12-31'),
            'end_date' => fake()->dateTimeBetween('2023-10-01', '2023-12-31'),
            'deadline' => fake()->dateTimeBetween('2023-10-01', '2023-12-31')
        ];
    }
}
