@extends('layout')

@section('content')

<h1>Create new contract</h1>
<form method="post" action="{{ route('contract.store') }}">
    
    @csrf

    <div class="form-group">
        <label class="">Contract number</label>
        <input type="text" class="form-input" name="contract_number"/>
    </div>
    <div class="form-group">
        <label class="">Employee ID</label>
        <input type="text" class="form-input" name="employee_id"/>
    </div>
    <button type="submit" class="btn btn-primary">Save</button>
</form>

@if ($errors->any())
    <ul>
        @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
        @endforeach
    </ul>
@endif

@endsection