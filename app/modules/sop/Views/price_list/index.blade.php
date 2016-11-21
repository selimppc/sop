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
                @if(Session::get('user-role')=='super-admin' || Session::get('user-role')=='admin')
                <a class="btn btn-primary btn-xs pull-right pop" data-toggle="modal" href="#addData" data-placement="top" data-content="click add new price button for new price entry">
                    <strong>Add New Product</strong>
                </a>
                @endif

            </div>

            <div class="panel-body">
                {{-------------- Filter :Starts ---------------}}
                {!! Form::open(['route' => 'search-price-list']) !!}

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
<!--                     <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="jq-datatables-example">
                        <thead>
                        <tr>
                            <th> Code </th>
                            <th> Image </th>
                            <th> Description </th>
                            {{--<th> Unit </th>--}}
                            <th> Price(USD) </th>
                            <th> Price(EURO) </th>
                            <th> Price(SRD) </th>
                            {{--<th> Status</th>--}}
                            @if(Session::get('user-role')=='super-admin' || Session::get('user-role')=='admin')
                            <th> Action &nbsp;&nbsp;<span style="color: #A54A7B" class="user-guideline" data-placement="top" data-content="view : click for details <br>update : click for update <br>delete : click for delete "></span></th>
                            @endif
                        </tr>
                        </thead>
                        <tbody>
                                                </tbody>
                    </table> -->
                        <div class="row">
                        @if(isset($data))
                            @foreach($data as $values)
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <div class="hpanel hgreen">
                                        <div class="panel-body">
                                            <div class="pull-right text-right">
                                                <div class="btn-group">
                                                    <a href="{{ route('view-price-list', $values->id) }}" class="btn btn-info btn-xs" data-placement="top" data-toggle="modal" data-target="#etsbModal" data-content="view"><i class="fa fa-eye"></i></a>
                                                    <a href="{{ route('edit-price-list', $values->id) }}" class="btn btn-primary btn-xs" data-placement="top" data-toggle="modal" data-target="#etsbModal" data-content="update"><i class="fa fa-edit"></i></a>
                                                    <a href="{{ route('delete-price-list', $values->id) }}" class="btn btn-danger btn-xs" data-placement="top" onclick="return confirm('Are you sure to Delete?')" data-content="delete"><i class="fa fa-trash-o"></i></a>
                                                </div>
                                            </div>
                                            <a href="{{ route('view-price-list', $values->id) }}" data-placement="top" data-toggle="modal" data-target="#etsbModal" data-content="view"><img alt="logo" class="m-b m-t-md" src="{{ $values->thumb_image }}"></a>
                                            <h5><a href="{{ route('view-price-list', $values->id) }}" data-placement="top" data-toggle="modal" data-target="#etsbModal" data-content="view">{{ $values->description }}</a></h5>  
                                        </div>
                                        <div class="panel-footer contact-footer">
                                            <div class="row">
                                                <div class="col-md-4 border-right animated-panel zoomIn" style="animation-delay: 0.2s;">
                                                    <div class="contact-stat"><span>Price (USD)</span><strong><p id="price_normal">{{ $values->price }}</p></strong></div>
                                                </div>
                                                <div class="col-md-4 border-right animated-panel zoomIn" style="animation-delay: 0.2s;">
                                                    <div class="contact-stat"><span>Price (EURO)</span><strong><p id="price_euro">{{ $values->price * $usd / $euro }}</p></strong></div>
                                                </div>
                                                <div class="col-md-4 animated-panel zoomIn" style="animation-delay: 0.3s;">
                                                    <div class="contact-stat"><span>Price (SRD)</span><strong><p id="price_usd">{{ $values->price * $usd }}</p></strong></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        @endif
                        </div>
<!--                                 <tr class="gradeX">
                                    <td>{{ $values->code }}</td>
                                    <td><img src="{{ $values->thumb_image }}" width="100"></td>
                                    <td>{{ $values->description }}</td>
                                    {{--<td>{{ $values->unit }}</td>--}}
                                    <td><p id="price_normal">{{ $values->price }}</p></td>
                                    <td><p id="price_euro">{{ $values->price * $usd / $euro }}</p></td>
                                    <td><p id="price_usd">{{ $values->price * $usd }}</p></td>
                                    {{--<td>{{ucfirst($values->status)}}</td>--}}
                                    @if(Session::get('user-role')=='super-admin' || Session::get('user-role')=='admin')
                                    <td>
                                        <a href="{{ route('view-price-list', $values->id) }}" class="btn btn-info btn-xs" data-placement="top" data-toggle="modal" data-target="#etsbModal" data-content="view"><i class="fa fa-eye"></i></a>
                                        <a href="{{ route('edit-price-list', $values->id) }}" class="btn btn-primary btn-xs" data-placement="top" data-toggle="modal" data-target="#etsbModal" data-content="update"><i class="fa fa-edit"></i></a>
                                        <a href="{{ route('delete-price-list', $values->id) }}" class="btn btn-danger btn-xs" data-placement="top" onclick="return confirm('Are you sure to Delete?')" data-content="delete"><i class="fa fa-trash-o"></i></a>
                                    </td>
                                    @endif
                                </tr> -->



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
                <h4 class="modal-title" id="myModalLabel">Add Product<span style="color: #A54A7B" class="user-guideline" data-content="<em>Must Fill <b>Required</b> Field.    <b>*</b> Put cursor on input field for more info </em>"> </span></h4>
            </div>
            <div class="modal-body">
                {!! Form::open(['route' => 'store-price-list','class' => 'form-horizontal','id' => 'form_2','files'=>'true']) !!}
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

<script type="text/javascript">

    $(document).ready(function(){

        $.each($("strong > #price_normal"), function(i, value){

            price = parseFloat($(this).text());
            price = Math.round((price) * 100) / 100;
            $(this).html('').html(price);
        });        

        $.each($("strong > #price_usd"), function(i, value){

            price = parseFloat($(this).text());
            price = Math.round((price) * 100) / 100;
            $(this).html('').html(price);
        });        

        $.each($("strong > #price_euro"), function(i, value){

            price = parseFloat($(this).text());
            price = Math.round((price) * 100) / 100;
            $(this).html('').html(price);
        });
    });

</script>

<!--script for this page only-->
@if($errors->any())
    <script type="text/javascript">
        $(function(){
            $("#addData").modal('show');
        });
    </script>
@endif

@stop