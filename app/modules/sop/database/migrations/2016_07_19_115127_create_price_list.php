<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePriceList extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('price_list', function (Blueprint $table) {
            $table->increments('id');
            $table->string('code', 64)->unique();
            $table->text('description')->nullable();
            $table->string('unit', 8)->nullable();
            $table->float('price')->nullable();
            $table->string('image', 128)->nullable();
            $table->string('thumb_image', 128)->nullable();
            $table->enum('status',array('active','inactive'))->nullable();

            $table->integer('created_by', false, 11);
            $table->integer('updated_by', false, 11);
            $table->timestamps();
            $table->engine = 'InnoDB';
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('price_list');
    }
}
