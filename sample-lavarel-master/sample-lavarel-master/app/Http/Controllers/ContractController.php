<?php

namespace App\Http\Controllers;

use App\Http\Requests\ContractCreateRequest;
use App\Models\Contract;
use Illuminate\Http\Request;
use Carbon\Carbon;

class ContractController extends Controller
{
    
    function index(Request $request) {
        // truy vấn CSDL
        $query = Contract::all();
        return view('contract.contract', [
            'contracts' => $query,
        ]);
    }

    function create(Request $request) {
        return view('contract.create');
    }

    function store(ContractCreateRequest $request) {
        Contract::create([
            'contract_number' => $request['contract_number'],
            'employee_id' => $request['employee_id'],
            'contract_date' => Carbon::now(),
            'comment' => 'Any comment',
        ]);
        return redirect('/contract');
    }

    function edit() {

    }

    function update() {

    }

    function destroy() {

    }
}
