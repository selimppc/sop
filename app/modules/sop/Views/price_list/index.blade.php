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

                <a class="btn btn-primary btn-xs pull-right pop" data-toggle="modal" href="#addData" data-placement="top" data-content="click add new price button for new price entry">
                    <strong>Add New Price</strong>
                </a>

            </div>

            <div class="panel-body">
                {{-------------- Filter :Starts ---------------}}
                {!! Form::open(['route' => 'price-list']) !!}

                <div id="index-search">
                    <div class="col-sm-3">
                        {!! Form::text('code', Input::get('code')? Input::get('code') : null,['class' => 'form-control','placeholder'=>'Type Code', 'title'=>'Type your required code, then click "search" button']) !!}
                    </div>
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
                            <th> Code </th>
                            <th> Image </th>
                            <th> Description </th>
                            <th> Unit </th>
                            <th> Price </th>
                            <th> Status</th>
                            <th> Action &nbsp;&nbsp;<span style="color: #A54A7B" class="user-guideline" data-placement="top" data-content="view : click for details <br>update : click for update <br>delete : click for delete "></span></th>
                        </tr>
                        </thead>
                        <tbody>
                        @if(isset($data))
                            @foreach($data as $values)
                                <tr class="gradeX">
                                    <td>{{ $values->code }}</td>
                                    <td>{{ $values->image }}</td>
                                    <td>{{ $values->description }}</td>
                                    <td>{{ $values->unit }}</td>
                                    <td>{{ $values->price }}</td>
                                    <td>{{ucfirst($values->status)}}</td>
                                    <td>
                                        <a href="{{ route('view-price-list', $values->id) }}" class="btn btn-info btn-xs" data-placement="top" data-toggle="modal" data-target="#etsbModal" data-content="view"><i class="fa fa-eye"></i></a>
                                        <a href="{{ route('edit-price-list', $values->id) }}" class="btn btn-primary btn-xs" data-placement="top" data-toggle="modal" data-target="#etsbModal" data-content="update"><i class="fa fa-edit"></i></a>
                                        <a href="{{ route('delete-price-list', $values->id) }}" class="btn btn-danger btn-xs" data-placement="top" onclick="return confirm('Are you sure to Delete?')" data-content="delete"><i class="fa fa-trash-o"></i></a>
                                    </td>
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
                <h4 class="modal-title" id="myModalLabel">Add Price<span style="color: #A54A7B" class="user-guideline" data-content="<em>Must Fill <b>Required</b> Field.    <b>*</b> Put cursor on input field for more info </em>"> </span></h4>
            </div>
            <div class="modal-body">
                {!! Form::open(['route' => 'store-price-list','class' => 'form-horizontal','id' => 'form_2']) !!}
                    @include('sop::price_list._form')
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