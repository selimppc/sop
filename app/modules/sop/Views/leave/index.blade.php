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
                <span class="panel-title">{{ $pageTitle }}</span>
                &nbsp;&nbsp;&nbsp;
                @if(Session::get('user-role')=='worker')
                    <a class="btn btn-primary btn-xs pull-right pop" data-toggle="modal" href="#addData" data-placement="top" data-content="click add new price button for new price entry">
                        <strong>New Application</strong>
                    </a>
                @endif

            </div>

            <div class="panel-body">
                {{-------------- Filter :Starts ---------------}}
                {!! Form::open(['route' => 'search-worker']) !!}

                <div id="index-search">
                    @if($role_id == 'worker')
                        <div class="col-sm-2">
                            {!! Form::Select('status',array(''=>'---Select Status---', 'open'=>'Open','decline'=>'Decline','approved'=>'Approved','accepted'=>'Accepted'),$status,['class'=>'form-control']) !!}
                        </div>
                    @elseif($role_id == 'manager')
                        <div class="col-sm-2">
                            {!! Form::Select('status',array(''=>'---Select Status---', 'approved'=>'Approved','accepted'=>'Accepted'),$status,['class'=>'form-control']) !!}
                        </div>
                        <div class="col-sm-3">
                            {!! Form::text('name', Input::get('name')? Input::get('name') : null,['class' => 'form-control','placeholder'=>'Write Name', 'title'=>'Write Name, then click "search" button']) !!}
                        </div>
                    @else
                        <div class="col-sm-2">
                            {!! Form::Select('status',array(''=>'---Select Status---', 'open'=>'Open','decline'=>'Decline','approved'=>'Approved','accepted'=>'Accepted'),$status,['class'=>'form-control']) !!}
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

                {{-------------- Filter :Ends -------------------------------------------}}
                <div class="table-primary">
                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="jq-datatables-example">
                        <thead>
                        <tr>
                            <th> Name </th>
                            <th> Email </th>
                            <th> Date </th>
                            <th> Leave From </th>
                            <th> Leave To </th>
                            <th> Status </th>
                            @if(Session::get('user-role')=='supervisor' || Session::get('user-role')=='hr'|| Session::get('user-role')=='manager')
                                <th> Action &nbsp;&nbsp;<span style="color: #A54A7B" class="user-guideline" data-placement="top" data-content="view : click for details <br>update : click for update <br>delete : click for delete "></span></th>
                            @endif
                        </tr>
                        </thead>
                        <tbody>
                        @if(isset($data))
                            @foreach($data as $values)
                                <tr class="gradeX">
                                    <td>{{ $values->user_name }}</td>
                                    <td>{{ $values->user_email }}</td>
                                    <td>{{ date('Y-m-d', strtotime($values->date)) }}</td>
                                    <td>{{ date('Y-m-d', strtotime($values->from_date) ) }}</td>
                                    <td>{{ date('Y-m-d', strtotime($values->to_date))}}</td>
                                    <td>{{ucfirst($values->status)}}</td>
                                    @if(Session::get('user-role')=='supervisor' && $values->status == 'open')
                                        <td>
                                            <a href="{{ route('leave-approve', $values->id) }}" class="btn btn-primary btn-xs" onclick="return confirm('Are you sure to Leave Approved?')"><strong>Approved</strong></a>
                                            <a href="{{ route('leave-decline', $values->id) }}" class="btn btn-info btn-xs" onclick="return confirm('Are you sure to Leave Decline?')"><strong>Declined</strong></a>
                                        </td>
                                    @elseif(Session::get('user-role')=='hr' && $values->status == 'open')
                                        <td>
                                            <a href="{{ route('leave-approve', $values->id) }}" class="btn btn-primary btn-xs" onclick="return confirm('Are you sure to Leave Approved?')"><strong>Approved</strong></a>
                                            <a href="{{ route('leave-decline', $values->id) }}" class="btn btn-info btn-xs" onclick="return confirm('Are you sure to Leave Decline?')"><strong>Declined</strong></a>
                                        </td>
                                    @elseif(Session::get('user-role')=='supervisor' || Session::get('user-role')=='hr' && $values->status != 'open')
                                        <td>
                                        </td>
                                    @elseif(Session::get('user-role')=='manager' && $values->status == 'approved')
                                        <td>
                                            <a href="{{ route('leave-accept', $values->id) }}" class="btn btn-primary btn-xs" onclick="return confirm('Are you sure to Leave Accept?')"><strong>Accepted</strong></a>
                                        </td>
                                    @elseif(Session::get('user-role')=='manager' && $values->status != 'approved')
                                        <td>
                                        </td>
                                    @endif
                                </tr>
                            @endforeach
                        @endif

                        </tbody>
                    </table>
                </div>
                <span class="pull-left">{!! str_replace('/?', '?', $data->appends(Input::except('page'))->render()) !!} </span>
            </div>
        </div>
    </div>
</div>
<!-- page end-->


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


<!-- Modal  -->

<div class="modal fade" id="etsbModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">


        </div>
    </div>
</div>
<!-- modal -->


<!--script for this page only-->
@if($errors->any())
    <script type="text/javascript">
        $(function(){
            $("#addData").modal('show');
        });
    </script>
@endif


@stop