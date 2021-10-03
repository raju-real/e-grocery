<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('admin_id')->nullable();
            $table->integer('company_id')->nullable();
            $table->integer('category_id');
            $table->integer('subcategory_id')->nullable();
            $table->string('product_code')->unique();
            $table->string('product_name');
            $table->text('slug')->nullable();
            $table->text('product_details');
            $table->double('unit_price',8,2);
            $table->string('unit_weight')->default(1);
            $table->double('discount_price',8,2)->nullable();
            $table->string('percentage')->nullable();
            $table->string('sku');
            $table->integer('quantity')->nullable()->default('0');
            $table->integer('user_quantity')->nullable()->default('0');
            $table->boolean('is_favorite')->nullable()->default('0');
            $table->string('image')->nullable();
            $table->string('video')->nullable();
            $table->integer('status')->default(1);
            $table->string('special_note')->nullable();
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
        Schema::dropIfExists('products');
    }
}
