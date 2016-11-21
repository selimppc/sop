@extends('admin::layouts.master')
@section('sidebar')
@include('admin::layouts.sidebar')
@stop

@section('content')

        <!-- page start-->
<div class="row">
    <div class="col-sm-12">
        <div class="panel">
            <div class="panel-heading">
                <span class="panel-title">{{ $pageTitle }}</span>&nbsp;&nbsp;&nbsp;<span style="color: #A54A7B" class="user-guideline" data-content="<em>we can show all user in this page<br> and add new user, update, delete from this page</em>"></span>
            </div>
            <div class="panel-body">
                <table class="table table-stiped table-bordered">
                    <tr><th width="20%">Title</th><td width="3%">:</td><td width="77%">{{ $currency_old->title }}</td></tr>
                    <tr><th>Value</th><td>:</td><td>{{ $currency_old->value }}</td></tr>
                    <tr><th>Description</th><td>:</td><td>{{ $currency_old->description }}</td></tr>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- page end-->

@stop