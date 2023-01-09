<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class PerformanceFactory extends Factory
{
    public function definition()
    {
        return [
            'user_id' => fake()->numberBetween(1, 10),
            'project_id' => fake()->numberBetween(1, 3),
            'value' => fake()->numberBetween(0, 100),
        ];
    }
}
