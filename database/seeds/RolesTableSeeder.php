<?php

use Illuminate\Database\Seeder;

class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('roles')->insert([
            'name'=>'Product Management'
        ]);
        DB::table('roles')->insert([
            'name'=>'Inventory Management'
        ]);
        DB::table('roles')->insert([
            'name'=>'Order Management'
        ]);
        DB::table('roles')->insert([
            'name'=>'Offer Management'
        ]);
        DB::table('roles')->insert([
            'name'=>'Coupon Management'
        ]);
        DB::table('roles')->insert([
            'name'=>'Bazar List Management'
        ]);
    }
}
