<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
            //$this->call(UsersTableSeeder::class);
            $this->call(AdminTableSeeder::class);
            //$this->call(RolesTableSeeder::class);
//         $this->call(CategoryTableSeeder::class);
//         $this->call(SubCategoryTableSeeder::class);
//         $this->call(UnitTableSeeder::class);
//         $this->call(SizeTableSeeder::class);
//         $this->call(ColorTableSeeder::class);
    }
}
