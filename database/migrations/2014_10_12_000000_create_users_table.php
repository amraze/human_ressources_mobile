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
    //on definit tous les attributs puis on execute dans le terminal :"php artisan make:migration nom_de_la_table" et apres la table users sera ajoutée dans notre base de données .
    //ceci s'appelle ORM : object-relational mapping 
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('first_name');
            $table->string('last_name');
            $table->smallInteger('age')->default(21);
            $table->tinyInteger('is_available')->default(1);   
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->tinyInteger('position')->default(0);
            $table->integer('overall_performance')->default(0);
            $table->string('image')->nullable();
            $table->string('password');
            $table->rememberToken();
            $table->timestamps();//existe par defaut .
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
};
