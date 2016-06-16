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
                <span class="panel-title">{{ isset($pageTitle)?$pageTitle:'Pad' }}</span>&nbsp;&nbsp;&nbsp;<span style="color: #A54A7B" class="user-guideline" data-content="<em>we can show all user in this page<br> and add new department, update, delete from this page</em>"></span>
            </div>

            {!! Form::open(['route' => 'store-pad','id' => 'pad']) !!}
            <div class="panel-body">
                <div class="form-group form-group no-margin-hr panel-padding-h no-padding-t no-border-t">

                    <div class="row">
                        <div class="col-sm-12">
                            {!! Form::label('aantalitems', 'Aantal items', ['class' => 'control-label']) !!}
                            {!! Form::input('number','aantalitems',@Input::get('aantalitems')? Input::get('aantalitems') : null,['class' => 'form-control','placeholder'=>'Enter Aantal Items (numbers only)','required','title'=>'Enter Aantal Items']) !!}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            {!! Form::label('primary', 'Primary ', ['class' => 'control-label']) !!}
                            {!! Form::Select('primary',array(''=>'Select','1'=>'Yes','2'=>'No' ),@Input::get('primary')?Input::get('primary'): null,['class'=>'form-control', 'title'=>'Select Primary']) !!}
                        </div>
                    </div>
                    <div class="row" id="primary_child">
                        <div class="col-sm-11 col-sm-offset-1">
                            {!! Form::label('aantalkleuren_primary', 'Aantal kleuren ', ['class' => 'control-label']) !!}
                            {!! Form::Select('aantalkleuren_primary',array(''=>'Select','1'=>'1','2'=>'2','3'=>'3','4'=>'4' ),@Input::get('aantalkleuren_primary')?Input::get('aantalkleuren_primary'): null,['class'=>'form-control', 'title'=>'Select Primary']) !!}
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            {!! Form::label('secondary', 'Secondary ', ['class' => 'control-label']) !!}
                            {!! Form::Select('secondary',array(''=>'Select','1'=>'Yes','2'=>'No' ),@Input::get('secondary')?Input::get('secondary'): null,['class'=>'form-control', 'title'=>'Select Secondary']) !!}
                        </div>
                    </div>
                    <div class="row" id="secondary_child">
                        <div class="col-sm-11 col-sm-offset-1">
                            {!! Form::label('aantalkleuren_secondary', 'Aantal kleuren ', ['class' => 'control-label']) !!}
                            {!! Form::Select('aantalkleuren_secondary',array(''=>'Select','1'=>'1','2'=>'2','3'=>'3','4'=>'4'),@Input::get('aantalkleuren_secondary')?Input::get('aantalkleuren_secondary'): null,['class'=>'form-control', 'title'=>'Select Secondary']) !!}
                        </div>
                    </div>

                    {{--<div class="row">
                        <div class="col-sm-12">
                            {!! Form::label('extraprints', 'Extra prints ', ['class' => 'control-label']) !!}
                            {!! Form::Select('extraprints',array(''=>'Select','Left sleeve'=>'Left sleeve','Right sleeve'=>'Right sleeve','Puff effect'=>'Puff effect','Umbrella'=>'Umbrella','Pants'=>'Pants','Flags'=>'Flags'),@Input::get('extraprints')?Input::get('extraprints'): null,['class'=>'form-control', 'title'=>'Select Extra prints','required']) !!}
                        </div>
                    </div>--}}
                    @include('admin::bord.scripts.pad_and_screen_script')
                </div>


                {{--@if(isset($check_value))
                    {!!  Form::checkbox('myCheck', 1, true) !!}
                @else
                    {!!  Form::checkbox('myCheck', 0, false) !!}
                @endif
                <strong>Installatie?</strong>--}}

                <div class="form-margin-btn" style="margin-left:92%" id="submit-bereken">
                    {!! Form::submit('Bereken', ['class' => 'btn btn-info','data-placement'=>'top','onclick'=>'myFunction();']) !!}&nbsp;
                </div>
            </div>
            {!! Form::close() !!}
        </div>
    </div>
</div>

@if(isset($data))
    <div class="row">
        <div class="col-sm-6">
            <div class="panel">
                <div class="panel-heading">
                    <span class="panel-title"><h4 class="text-center">Materiaal List</h4></span>
                </div>
                <div class="panel-body">
                    <div class="table-primary">
                        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="jq-datatables-example">
                            <thead>
                            <th>Materiaal</th>
                            <th>Aantal</th>
                            <th>Eenheid</th>
                            </thead>
                            <tbody>
                            @if(isset($data['materiaal_list_details']))
                                @foreach($data['materiaal_list_details'] as $mld)
                                    <tr class="gradeX">
                                        <td>{{$mld['label']}}</td>
                                        <td>{{$mld['aantal']}}</td>
                                        <td>{{$mld['eenheid']}}</td>
                                    </tr>
                                @endforeach
                            @endif
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-6">
            <div class="panel">
                <div class="panel-heading">
                    <span class="panel-title"><h5 class="text-center">LICHTBAKKEN</h5></span>
                </div>
                <div class="panel-body">
                    <div class="table-primary">
                        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="jq-datatables-example">
                            <tr>
                                <th>Price</th>
                                <td>SRD &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                    {{isset($data['materiaal_amount']['srd']['price'])?number_format($data['materiaal_amount']['srd']['price'], 2, '.', ''):''}}
                                </td>
                                <td>$ &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                    {{isset($data['materiaal_amount']['usd']['price'])?number_format($data['materiaal_amount']['usd']['price'], 2, '.', ''):''}}
                                </td>
                                <td>&euro; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    {{isset($data['materiaal_amount']['euro']['price'])?number_format($data['materiaal_amount']['euro']['price'], 2, '.', ''):''}}
                                </td>
                            </tr>
                            <tr>
                                <th>Tax (10.0%)</th>
                                <td>SRD &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    {{isset($data['materiaal_amount']['srd']['tax'])?number_format($data['materiaal_amount']['srd']['tax'], 2, '.', ''):''}}
                                </td>
                                <td>$ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    {{isset($data['materiaal_amount']['usd']['tax'])?number_format($data['materiaal_amount']['usd']['tax'], 2, '.', ''):''}}
                                </td>
                                <td>&euro; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    {{isset($data['materiaal_amount']['euro']['tax'])?number_format($data['materiaal_amount']['euro']['tax'], 2, '.', ''):''}}</td>
                            </tr>
                            <tr>
                                <th>Total</th>
                                <td>SRD &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    {{isset($data['materiaal_amount']['srd']['subtotal'])?number_format($data['materiaal_amount']['srd']['subtotal'], 2, '.', ''):''}}
                                </td>
                                <td>$ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    {{isset($data['materiaal_amount']['usd']['subtotal'])?number_format($data['materiaal_amount']['usd']['subtotal'], 2, '.', ''):''}}
                                </td>
                                <td>&euro; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    {{isset($data['materiaal_amount']['euro']['subtotal'])?number_format($data['materiaal_amount']['euro']['subtotal'], 2, '.', ''):''}}
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!---------------------Installation----------------------------------->

        @if(isset($data['installment_amount']))
            <div class="col-sm-6">
                <div class="panel">
                    <div class="panel-heading">
                        <span class="panel-title"><h5 class="text-center">INSTALLATIE</h5></span>
                    </div>
                    <div class="panel-body">
                        <div class="table-primary">
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="jq-datatables-example">
                                <tr>
                                    <th>Price</th>
                                    <td>SRD &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                        {{isset($data['installment_amount']['srd']['price'])?number_format($data['installment_amount']['srd']['price'], 2, '.', ''):''}}
                                    </td>
                                    <td>$ &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                        {{isset($data['installment_amount']['usd']['price'])?number_format($data['installment_amount']['usd']['price'], 2, '.', ''):''}}
                                    </td>
                                    <td>&euro; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        {{isset($data['installment_amount']['euro']['price'])?number_format($data['installment_amount']['euro']['price'], 2, '.', ''):''}}
                                    </td>
                                </tr>
                                <tr>
                                    <th>Tax (8.0%)</th>
                                    <td>SRD &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        {{isset($data['installment_amount']['srd']['tax'])?number_format($data['installment_amount']['srd']['tax'], 2, '.', ''):''}}
                                    </td>
                                    <td>$ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        {{isset($data['installment_amount']['usd']['tax'])?number_format($data['installment_amount']['usd']['tax'], 2, '.', ''):''}}
                                    </td>
                                    <td>&euro; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        {{isset($data['installment_amount']['euro']['tax'])?number_format($data['installment_amount']['euro']['tax'], 2, '.', ''):''}}</td>
                                </tr>
                                <tr>
                                    <th>Total</th>
                                    <td>SRD &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        {{isset($data['installment_amount']['srd']['subtotal'])?number_format($data['installment_amount']['srd']['subtotal'], 2, '.', ''):''}}
                                    </td>
                                    <td>$ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        {{isset($data['installment_amount']['usd']['subtotal'])?number_format($data['installment_amount']['usd']['subtotal'], 2, '.', ''):''}}
                                    </td>
                                    <td>&euro; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        {{isset($data['installment_amount']['euro']['subtotal'])?number_format($data['installment_amount']['euro']['subtotal'], 2, '.', ''):''}}
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="panel">
                    <div class="panel-heading">
                        <span class="panel-title"><h5 class="text-center">TOTAAL</h5></span>
                    </div>
                    <div class="panel-body">
                        <div class="table-primary">
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="jq-datatables-example">
                                <tr>
                                    <th>Prijs</th>
                                    <td>SRD &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                        {{isset($data['final_amount']['srd']['price'])?number_format($data['final_amount']['srd']['price'], 2, '.', ''):''}}
                                    </td>
                                    <td>$ &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                        {{isset($data['final_amount']['usd']['price'])?number_format($data['final_amount']['usd']['price'], 2, '.', ''):''}}
                                    </td>
                                    <td>&euro; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        {{isset($data['final_amount']['euro']['price'])?number_format($data['final_amount']['euro']['price'], 2, '.', ''):''}}
                                    </td>
                                </tr>
                                <tr>
                                    <th>OB (10.0%)</th>
                                    <td>SRD &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        {{isset($data['final_amount']['srd']['tax'])?number_format($data['final_amount']['srd']['tax'], 2, '.', ''):''}}
                                    </td>
                                    <td>$ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        {{isset($data['final_amount']['usd']['tax'])?number_format($data['final_amount']['usd']['tax'], 2, '.', ''):''}}
                                    </td>
                                    <td>&euro; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        {{isset($data['final_amount']['euro']['tax'])?number_format($data['final_amount']['euro']['tax'], 2, '.', ''):''}}</td>
                                </tr>
                                <tr>
                                    <th>SUB Totaal</th>
                                    <td>SRD &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        {{isset($data['final_amount']['srd']['total'])?number_format($data['final_amount']['srd']['total'], 2, '.', ''):''}}
                                    </td>
                                    <td>$ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        {{isset($data['final_amount']['usd']['total'])?number_format($data['final_amount']['usd']['total'], 2, '.', ''):''}}
                                    </td>
                                    <td>&euro; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        {{isset($data['final_amount']['euro']['total'])?number_format($data['final_amount']['euro']['total'], 2, '.', ''):''}}
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    @endif
    {{----------------------Total------------------------}}
    @endif



            <!-- page end-->

    <script src="assets/bitd/js/jquery.min.js"></script>
    <!--script for this page only-->
    @if($errors->any())
        <script type="text/javascript">
            $(function(){
                $("#addData").modal('show');
            });
        </script>
    @endif


    <script>
        window.onload = function() {
            $("input:checkbox").change(function () {
                var ischecked = $(this).is(':checked');
                if (!ischecked) {
                    $('#installatie').hide();
                } else {
                    $('#installatie').show();
                }
            });

            var ischecked = $("input:checkbox").val();
            if (ischecked == 0) {
                $('#installatie').hide();
            } else {
                $('#installatie').show();
            }
        }

    </script>

    <script>

        $(function () {
            $("#licht").validate({
                rules: {
                    name: {
                        required: true,
                    },
                    password: {
                        required: true,
                    },
                    url: {
                        required: true,
                        url: true
                    },
                    number: {
                        required: true,
                        number: true
                    },
                    max: {
                        required: true,
                        maxlength: 4
                    }
                },
                submitHandler: function (form) {
                    form.submit();
                }
            });

            $("#licht").validate({
                rules: {
                    name: {
                        required: true,
                    },
                    username: {
                        required: true,
                    },
                    url: {
                        required: true,
                        url: true
                    },
                    number: {
                        required: true,
                        number: true
                    },
                    last_name: {
                        required: true,
                        minlength: 6
                    }
                },
                messages: {
                    number: {
                        required: "(Please enter your phone number)",
                        number: "(Please enter valid phone number)"
                    },
                    last_name: {
                        required: "This is custom message for required",
                        minlength: "This is custom message for min length"
                    }
                },
                submitHandler: function (form) {
                    form.submit();
                },
                errorPlacement: function (error, element) {
                    $(element)
                            .closest("form")
                            .find("label[for='" + element.attr("id") + "']")
                            .append(error);
                },
                errorElement: "span",
            });
        });
    </script>

    @stop