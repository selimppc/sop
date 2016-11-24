@extends('admin::layouts.master')
@section('sidebar')
@include('admin::layouts.sidebar')
@stop

@section('content')

        <!-- page start-->
<div class="row">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                <strong><i class="fa fa-gears"> &nbsp;</i> {{ $pageTitle }}</strong>
                <button class="btn btn-success btn-xs pull-right" data-toggle="modal" data-target="#addmodal"><i class="fa fa-plus"> &nbsp;</i> Add New Item</button>
            </header>
            @if($errors->any())
                <div class="alert alert-danger">
                    @foreach($errors->all() as $error)
                        <p>{{ $error }}</p>
                    @endforeach
                </div>
            @endif
            @if(Session::has('flash_message'))
                <div class="alert alert-success">
                    <p>{{ Session::get('flash_message') }}</p>
                </div>
            @endif
            @if(Session::has('flash_message_error'))
                <div class="alert alert-danger">
                    <p>{{ Session::get('flash_message_error') }}</p>
                </div>
            @endif

            <div class="panel-body">

                <div class="adv-table">
                    <table  class="display table table-bordered table-striped" id="data-table-example">
                        <thead>
                            <tr>
                                <th>Item Title</th>
                                <th>Title (Short Form)</th>
                                <th> Status/Value/Price </th>
                                <th> User Type </th>
                                <th>Action </th>
                            </tr>
                        </thead>
                        <tbody>
                        @if(isset($data))
                            @foreach($data as $v)
                                <tr class="gradeX">
                                    <td>{{ ($v->title_full) ? (preg_replace('~[-_]~',' ',$v->title_full)) : 'N/A'}}</td>
                                    <td>{{preg_replace('~[-_]~',' ',$v->title)}}</td>
                                    <td>{{isset($v->status)?ucfirst($v->status):''}}</td>
                                    <td>{{isset($v->user_type)? ucfirst($v->user_type):''}}</td>
                                    <td>
                                        <a href="{{ route('settings-show', $v->id) }}" class="btn btn-info btn-xs" data-toggle="modal" data-target="#etsbModal" title="Settings View"><i class="fa fa-eye"></i></a>
                                        <a href="{{ route('settings-edit', $v->id) }}" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#etsbModal" title="Settings Edit"><i class="fa fa-edit"></i></a>
                                    </td>

                                </tr>
                        @endforeach
                        @endif
                    </table>
                    {{--<span class="pull-right">{!! str_replace('/?', '?', $data->render()) !!} </span>--}}
                </div>
            </div>
        </section>
    </div>
</div>
<!-- page end-->



<!-- Modal - 1 -->
<div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add New Item</h4>
            </div>

            {!! Form::open(['route' => 'settings-store','id' => 'jq-validation-form']) !!}
                @include('admin::settings._form')
            {!! Form::close() !!}

        </div>
    </div>
</div>
<!-- modal -->

<!-- Modal  -->
<div class="modal fade" id="etsbModal" tabindex="" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">

        </div>
    </div>
</div>
<!-- modal -->

{{--<!-- Modal - 2 -->
<div class="modal fade" id="etsbModal_1" tabindex="-1" role="dialog" aria-hidden="false">
    @include('admin::settings.view')
</div>
<!-- modal -->

<!-- Modal - 3 -->
<div class="modal fade" id="etsbModal_2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    @include('admin::settings.update')
</div>
<!-- modal -->--}}




@stop