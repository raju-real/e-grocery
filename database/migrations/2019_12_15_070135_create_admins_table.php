<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAdminsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('admins', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('job_status')->default(1);
            $table->string('designation')->default('Admin');
            $table->string('is_super')->default(false);
            $table->string('name');
            $table->string('email')->unique();
            $table->string('mobile')->unique();
            $table->string('image')->nullable();
            $table->string('password');
            $table->string('show_password')->nullable();
            $table->string('product_management');
            $table->string('inventory_management');
            $table->string('order_management');
            $table->string('offer_management');
            $table->string('coupon_management');
            $table->string('bazarlist_management');
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
        Schema::dropIfExists('admins');
    }
}
