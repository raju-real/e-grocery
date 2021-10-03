<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AdminTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('admins')->insert([
            'is_super' => true,
            'name' => 'Super Admin',
            'email' => 'superadmin@gmail.com',
            'mobile' => '123456789',
            'password' => Hash::make('123456'),
            'product_management' => 'Yes',
            'inventory_management' => 'Yes',
            'order_management' => 'Yes',
            'offer_management' => 'Yes',
            'coupon_management' => 'Yes',
            'bazarlist_management' => 'Yes'
        ]);
    }
}
