<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('projects', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('leader_id');
            $table->string('name');
            $table->text('description')->nullable();
            $table->date('start_date')->default(now());
            $table->date('end_date')->nullable();
            $table->date('deadline')->nullable();
            $table->string('category');
            $table->timestamps();
        });

        Schema::table('projects', function (Blueprint $table) {
            $table->foreign('leader_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('projects');
    }
};
