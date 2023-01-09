<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class ProjectFactory extends Factory
{
    public function definition()
    {
        return [
            'leader_id' => fake()->numberBetween(1, 3),
            'name' => fake()->word(),
            'description' => fake()->paragraph(),
            'start_date' => fake()->dateTimeBetween('2023-10-01', '2023-12-31'),
            'end_date' => fake()->dateTimeBetween('2023-10-01', '2023-12-31'),
            'deadline' => fake()->dateTimeBetween('2023-10-01', '2023-12-31'),
            'category' => fake()->word(),
        ];
    }
}
