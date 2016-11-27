<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductImageTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_image', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title', 32)->nullable();
            $table->text('description')->nullable();
            $table->string('image', 256)->nullable();
            $table->string('thumbnail', 256)->nullable();
            $table->enum('status',array('active','inactive','cancel'))->nullable();
            $table->unsignedInteger('price_list_id')->nullable();
            $table->integer('created_by', false, 11);
            $table->integer('updated_by', false, 11);
            $table->timestamps();
            $table->engine = 'InnoDB';
        });

        Schema::table('product_image', function($table) {
            $table->foreign('price_list_id')->references('id')->on('price_list');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('product_image');
    }
}
