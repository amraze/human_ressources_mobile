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
     * 
     */
    //Ici on fait migrer nos attributs vers la base de donnees , c'est la premiere etape a faire apres le remplissage du fichier .env qui contient le nom de notre base de donnees .
    //on definit tous les attributs puis on execute dans le terminal :"php artisan make:migration nom_de_la_table" et apres la table projects sera ajoutée dans notre base de données .
    //ceci s'appelle ORM : object-relational mapping 
    public function up()
    {
        Schema::create('projects', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('leader_id');
            $table->string('name');
            $table->text('description')->nullable();
            $table->date('start_date')->default(now());//on associe la date actuelle par defaut comme debut de travailer sur un projet.
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
