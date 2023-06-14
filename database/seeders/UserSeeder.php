<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use Faker\Factory as Faker; 
use Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for($i=1; $i<=50; $i++){
            $faker = Faker::create();
            
            $user = new User;
            $user->name = $faker->name;
            $user->email = $faker->email;
            $user->email_verified_at = now();
            $user->role = 'user';
            $user->password = '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW'; // password = user123
            $user->save();
        }
    }
}
