<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLeaveTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('leave_head', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('user_id')->nullable();
            $table->string('user_name', 64)->unique();
            $table->string('user_email', 64)->unique();
            $table->dateTime('date',64)->nullable();
            $table->dateTime('from_date',64)->nullable();
            $table->dateTime('to_date',64)->nullable();
            $table->text('reason')->nullable();
            $table->enum('status',array('open','decline','approved','accepted'))->nullable();
            $table->integer('created_by', false, 11);
            $table->integer('updated_by', false, 11);
            $table->timestamps();
            $table->engine = 'InnoDB';
        });

        Schema::table('leave_head', function($table) {
            $table->foreign('user_id')->references('id')->on('user');
        });

        Schema::create('leave_detail', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('leave_head_id')->nullable();
            $table->unsignedInteger('user_id')->nullable();
            $table->dateTime('date',64)->nullable();
            $table->text('note')->nullable();
            $table->enum('status',array('open','decline','approved','accepted'))->nullable();
            $table->integer('created_by', false, 11);
            $table->integer('updated_by', false, 11);
            $table->timestamps();
            $table->engine = 'InnoDB';
        });

        Schema::table('leave_detail', function($table) {
            $table->foreign('leave_head_id')->references('id')->on('leave_head');
        });

        Schema::table('leave_detail', function($table) {
            $table->foreign('user_id')->references('id')->on('user');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('leave_head');
        Schema::drop('leave_detail');
    }
}
