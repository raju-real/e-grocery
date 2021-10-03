<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('email')->unique()->nullable();
            $table->string('mobile')->unique();
            $table->integer('mobileVarified')->default(0);
            $table->boolean('isVerified')->default(false);
            $table->string('image')->nullable();
            $table->string('gender')->nullable();
            $table->string('password');
            $table->string('token')->unique();
            $table->string('referral_code')->unique()->nullable();
            $table->string('referral_link')->unique()->nullable();
            $table->double('points',8,2)->default(0);
            $table->timestamp('email_verified_at')->nullable();
            $table->rememberToken();
            $table->timestamps();
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
}
