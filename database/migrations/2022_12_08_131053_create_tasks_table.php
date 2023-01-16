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
    //Ici on fait migrer nos attributs vers la base de donnees , c'est la premiere etape a faire apres le remplissage du fichier .env qui contient le nom de notre base de donnees .
    //on definit tous les attributs puis on execute dans le terminal :"php artisan make:migration nom_de_la_table" et apres la table tasks sera ajoutée dans notre base de données .
    //ceci s'appelle ORM : object-relational mapping 
    public function up()
    {
        Schema::create('tasks', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('project_id');
            $table->string('name');
            $table->text('description')->nullable();
            $table->integer('grade');
            $table->date('start_date')->default(now());
            $table->date('end_date')->nullable();
            $table->date('deadline')->nullable();
            $table->timestamps();
        });
//on definit les relations entre les tables tout en indiquant les cles etrangères .
        Schema::table('tasks', function (Blueprint $table) {
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('project_id')->references('id')->on('projects')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tasks');
    }
};
