@extends('admin::layouts.master')
@section('sidebar')
    @include('admin::layouts.sidebar')
@stop

@section('content')
    <div class="panel-body">
        <form class="form-horizontal">
            <fieldset>
                <legend>Formulier Materialen</legend>
                <div class="slider shor"></div>
                <!-- <div class="form-group">
                    <label for="wederverkoper" class="col-sm-2 control-label">Wederverkoper</label>
                    <div id="wederverkoper" class="togglebutton col-sm-10">
                        <label>
                            <input type="checkbox" checked="">
                        </label>
                    </div>
                </div> -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">Type Klant</label>
                    <div class="col-sm-10">
                        <div class="col-sm-6 radio radio-primary">
                            <label>
                                <input type="radio" name="type" value="normaal" checked=""><span class="circle"></span><span class="check"></span>
                                Normaal
                            </label>
                        </div>
                        <div class="col-sm-6 radio radio-primary">
                            <label>
                                <input type="radio" name="type" value="wederverkoper"><span class="circle"></span><span class="check"></span>
                                Wederverkoper
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="vel" class="col-sm-2 control-label">Vel</label>
                    <div id="vel" class="togglebutton col-sm-10">
                        <label>
                            <input type="checkbox" name="vel" id="vel"><span class="toggle"></span>
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="soort" class="col-sm-2 control-label">Materiaal</label>
                    <div class="col-sm-10">
                        <select id="soort" class="form-control">
                            <option value="" class="selected">Selecteer soort materiaal ...</option>
                            <option value="aluconbond">Aluconbond</option>
                            <option value="celtec">Celtec</option>
                            <option value="acrylic-3.0">Acrylic 3.0 mm</option>
                            <option value="acrylic-5.0">Acrylic 5.0 mm</option>
                        </select>
                    </div>
                </div>

                <div class="form-group" id="oppervlakte-groep">
                    <label for="oppervlakte" class="col-sm-2 control-label">Oppervlakte (m2)</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" min="0.1" step="0.1" id="oppervlakte" placeholder="Oppervlakte/m2" value="0.1">
                    </div>
                </div>

                <div class="form-group" id="aantal-groep" style="display: none;">
                    <label for="oppervlakte" class="col-sm-2 control-label">Aantal</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" min="1" id="aantal" placeholder="Aantal vellen" value="1">
                    </div>
                </div>

                <div class="form-group m-t-80">
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
                    {{--<a href="#" class="btn btn-primary btn-flat">Terug</a>--}}
                {{--</div>--}}
            </fieldset>
        </form>
        <a href="{{ URL::previous() }}" class="btn btn-danger">Back</a>

    </div>
    @include('sop::print_cut._materialen')
@endsection