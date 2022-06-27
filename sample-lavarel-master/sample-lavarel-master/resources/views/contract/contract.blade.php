@extends('layout')

@section('content')
    <h1>Contract Page</h1>
    <a href="/contract/create" class="btn btn-primary">Create new contract</a>
    <table class="table">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Contract Number</th>
                <th>Contract Date</th>
            </tr>
        </thead>

        @foreach($contracts as $contract)
        <tr>
            <td>{{ $contract->id }}</td>
            <td>{{ $contract->contract_number }}</td>
            <td>{{ $contract->contract_date }}</td>
        </tr>
        @endforeach
    </table>
@endsection