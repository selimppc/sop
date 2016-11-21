@extends('admin::layouts.master')
@section('sidebar')
@include('admin::layouts.sidebar')
@stop

@section('content')

<!-- page start-->
<div class="row">

@if(Session::get('user-role')=='worker' || Session::get('user-role')=='hr' || Session::get('user-role')=='supervisor')
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="panel">
            <div class="panel-heading">
                @foreach($balance as $saldo)
                    <h5>Verlof Saldo: <strong id="saldo">{{ $saldo->balance }}</strong></h5>
                @endforeach
            </div>
        </div>
    </div>
@endif
    <div class="col-sm-12">
        <div class="panel">
            <div class="panel-heading">
                <span class="panel-title">{{ $pageTitle }}</span>
                &nbsp;&nbsp;&nbsp;
                @if(Session::get('user-role')=='worker' || Session::get('user-role')=='hr')
                    <a class="btn btn-success btn-xs pull-right pop" data-toggle="modal" href="#addData" data-placement="top" data-content="click add new price button for new price entry">
                        <strong>New Verlof Aanvraag</strong>
                    </a>
                @endif
            </div>

            <div class="panel-body">
                <!-- {{-------------- Filter :Starts ---------------}}
                {!! Form::open(['route' => 'search-worker']) !!}

                <div id="index-search">
                    @if($role_id == 'worker')
                        <div class="col-sm-2">
                            {!! Form::Select('status',array(''=>'---Select Status---', 'open'=>'Open','decline'=>'Decline','approved'=>'Acceptd','accepted'=>'Accepted'),$status,['class'=>'form-control']) !!}
                        </div>
                    @elseif($role_id == 'manager')
                        <div class="col-sm-2">
                            {!! Form::Select('status',array(''=>'---Select Status---', 'approved'=>'Acceptd','accepted'=>'Accepted'),$status,['class'=>'form-control']) !!}
                        </div>
                        <div class="col-sm-3">
                            {!! Form::text('name', Input::get('name')? Input::get('name') : null,['class' => 'form-control','placeholder'=>'Write Name', 'title'=>'Write Name, then click "search" button']) !!}
                        </div>
                    @else
                        <div class="col-sm-2">
                            {!! Form::Select('status',array(''=>'---Select Status---', 'open'=>'Open','decline'=>'Decline','approved'=>'Acceptd','accepted'=>'Accepted'),$status,['class'=>'form-control']) !!}
                        </div>
                        <div class="col-sm-3">
                            {!! Form::text('name', Input::get('name')? Input::get('name') : null,['class' => 'form-control','placeholder'=>'Write Name', 'title'=>'Write Name, then click "search" button']) !!}
                        </div>
                    @endif

                    <div class="col-sm-3 filter-btn">
                        {!! Form::submit('Search', array('class'=>'btn btn-primary btn-xs pull-left pop btn-search-height','id'=>'button', 'data-placement'=>'right', 'data-content'=>'type code in specific field ')) !!}
                    </div>
                </div>
                <p> &nbsp;</p>
                <p> &nbsp;</p>

                {!! Form::close() !!}

                {{-------------- Filter :Ends -------------------------------------------}} -->
                
                <div class="table-primary">
                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="jq-datatables-example">
                        <thead>
                        <tr>
                            <th> Name </th>
                            <th> Type </th>
                            <!-- <th> Email </th> -->
                            <th> Reason </th>
                            <th> Date </th>
                            <th> Leave From </th>
                            <th> Leave To </th>
                            <th> Status </th>
                            @if(Session::get('user-role')=='supervisor' || Session::get('user-role')=='hr'|| Session::get('user-role')=='manager' || Session::get('user-role')=='worker')
                                <th> Action &nbsp;&nbsp;<span style="color: #A54A7B" class="user-guideline" data-placement="top" data-content="view : click for details <br>update : click for update <br>delete : click for delete "></span></th>
                            @endif
                        </tr>
                        </thead>
                        <tbody>
                            @foreach($data as $values)
                                <tr>
                                    <td>{{$values->user_name}}</td>
                                    <td>{{$values->type}}</td>
                                    <!-- <td>{{$values->balance}}</td> -->
                                    <!-- <td>{{$values->user_email}}</td> -->
                                    <td>{{$values->reason}}</td>
                                    <td>{{ date('D j M o', strtotime($values->date)) }}</td>
                                    <td>{{ date('D j M o', strtotime($values->from_date) ) }}</td>
                                    <td>{{ date('D j M o', strtotime($values->to_date))}}</td>
                                    @if(ucfirst($values->status) == "Accepted")
                                        <td><span class="btn btn-success btn-xs">{{ucfirst($values->status)}}</span></td>
                                    @elseif(ucfirst($values->status) == "Approved")
                                        <td><span class="btn btn-warning btn-xs">{{ucfirst($values->status)}}</span></td>
                                    @elseif(ucfirst($values->status) == "Decline")
                                        <td><span class="btn btn-danger btn-xs">{{ucfirst($values->status)}}</span></td>
                                    @elseif(ucfirst($values->status) == "Open")
                                        <td><span class="btn btn-default btn-xs">{{ucfirst($values->status)}}</span></td>
                                    @elseif(ucfirst($values->status) == "Canceled")
                                        <td><span class="btn btn-danger btn-xs">{{ucfirst($values->status)}}</span></td>
                                    @endif
                                    @if(Session::get('user-role')=='supervisor' && $values->status == 'open')
                                        <td>
                                            <a href="{{ route('leave-approve', $values->id) }}" class="btn btn-warning btn-xs" onclick="return confirm('Bent u zeker dat u het verlof wilt goedkeuren?')"><strong>Approve</strong></a>
                                            <a href="{{ route('leave-decline', $values->id) }}" class="btn btn-danger btn-xs" onclick="return confirm('Bent u zeker dat u het verlof wilt afkeuren??')"><strong>Decline</strong></a>
                                        </td>
                                    @elseif(Session::get('user-role')=='supervisor' || Session::get('user-role')=='hr' && $values->status != 'open')
                                        <td>
                                        </td>
                                    @elseif(Session::get('user-role')=='hr' && $values->status == 'open' && $values->user_id != Session::get('user_id'))
                                        <td>
                                        </td>
                                    @elseif(Session::get('user-role')=='manager' && $values->status == 'approved')
                                        <td>
                                            <a href="{{ route('leave-accept', $values->id) }}" class="btn btn-success btn-xs" onclick="return confirm('Bent u zeker dat u het verlof wilt goedkeuren?')"><strong>Accept</strong></a>
                                            <a href="{{ route('leave-decline', $values->id) }}" class="btn btn-danger btn-xs" onclick="return confirm('Bent u zeker dat u het verlof wilt afkeuren??')"><strong>Decline</strong></a>
                                        </td>
                                    @elseif(Session::get('user-role')=='manager' && $values->status != 'approved')
                                        <td>
                                        </td>
                                    @elseif($values->user_id == Session::get('user_id'))
                                        <td>
                                            <a href="{{ route('leave-cancel', $values->id) }}" class="btn btn-danger btn-xs" onclick="return confirm('Bent u zeker dat u het verlof wilt annuleren?')"><strong>Cancel</strong></a>
                                        </td>
                                    @endif
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
<div id="addData" class="modal fade" tabindex="" role="dialog" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" title="click x button for close this entry form">×</button>
                <h4 class="modal-title" id="myModalLabel">Leave Application<span style="color: #A54A7B" class="user-guideline" data-content="<em>Must Fill <b>Required</b> Field.    <b>*</b> Put cursor on input field for more info </em>"> </span></h4>
            </div>
            <div class="modal-body">
                {!! Form::open(['route' => 'store-leave-application','class' => 'form-horizontal','id' => 'form_2','files'=>'true']) !!}
                @include('sop::leave._form')
                {!! Form::close() !!}
            </div> <!-- / .modal-body -->
        </div> <!-- / .modal-content -->
    </div> <!-- / .modal-dialog -->
</div>
<!-- modal -->
@stop