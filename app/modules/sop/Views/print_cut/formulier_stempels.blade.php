@extends('admin::layouts.master')
@section('sidebar')
    @include('admin::layouts.sidebar')
@stop

@section('content')
    <div class="panel-body">
        <form class="form-horizontal">
            <fieldset>
                <legend>Formulier Stempels</legend>
                <div class="form-group">
                    <label for="stempel" class="col-sm-2 control-label">Soort Stempel</label>
                    <div class="col-sm-10">
                        <select id="stempel" class="form-control">
                            <option value="" class="selected">Selecteer soort stempel ...</option>
                            <option value="14">14 X 38</option>
                            <option value="22-6">22 X 60</option>
                            <option value="22-7">22 X 70</option>
                            <option value="34">34 X 58</option>
                            <option value="40-4">40 X 40</option>
                            <option value="40-9">40 X 90</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="oppervlakte" class="col-sm-2 control-label">Aantal</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="aantal" value="1" placeholder="Aantal">
                    </div>
                </div>

                <div class="form-group">
                    <label for="aantal" class="col-sm-2 control-label">Prijs</label>
                    <div class="col-sm-9 input-group">
                        <span class="input-group-addon">SR$</span>
                        <input type="text" readonly="" class="prijs" id="prijs" placeholder="0,-" value="">
                    </div>
                </div>

                {{--<div class="form-group m-t-80">--}}
                    {{--<div class="col-xs-1 col-xs-offset-2">--}}
                        {{--<button type="submit" class="btn btn-primary btn-fab btn-raised mdi-action-add-shopping-cart"></button>--}}
                    {{--</div>--}}
                {{--</div>--}}

                {{--<div class="col-md-offset-10 col-md-2">--}}
                    {{--<span onclick="window.history.go(-1); return false;" class="btn btn-primary btn-flat">Terug</span>--}}
                {{--</div>--}}

            </fieldset>
        </form>
        <a href="{{ URL::previous() }}" class="btn btn-danger">Back</a>


    </div>
    @include('sop::print_cut._formulier_stempels')
@endsection