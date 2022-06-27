<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;


class CreateContract extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('contracts')->insert([
            'contract_number' => 'HDLD-001',
            'contract_date' => Carbon::now(),
            'employee_id' => 1,
            'comment' => 'Hop dong cua user 01'
        ]);
    }
}
