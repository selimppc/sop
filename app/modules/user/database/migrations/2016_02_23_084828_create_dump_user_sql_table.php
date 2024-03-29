<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDumpUserSqlTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        DB::unprepared(file_get_contents("app/modules/user/database/sql_dump/department.sql"));
        DB::unprepared(file_get_contents("app/modules/user/database/sql_dump/role.sql"));
        DB::unprepared(file_get_contents("app/modules/user/database/sql_dump/user.sql"));
        DB::unprepared(file_get_contents("app/modules/user/database/sql_dump/role_user.sql"));
        DB::unprepared(file_get_contents("app/modules/user/database/sql_dump/permissions.sql"));
        DB::unprepared(file_get_contents("app/modules/user/database/sql_dump/permission_role.sql"));


    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
