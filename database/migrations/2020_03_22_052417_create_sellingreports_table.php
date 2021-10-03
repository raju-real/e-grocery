<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSellingreportsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sellingreports', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('create_date');
            $table->integer('admin_id');
            $table->integer('product_id');
            $table->integer('quantity');
            $table->string('currency');
            $table->double('buying_unit_price',8,2);
            $table->double('selling_unit_price',8,2);
            $table->double('selling_price',8,2);
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
        Schema::dropIfExists('sellingreports');
    }
}
