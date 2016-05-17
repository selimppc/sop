@extends('admin::layouts.master')
@section('sidebar')
    @include('admin::layouts.sidebar')
@stop

@section('content')
    <div class="panel-body">
        <form class="form-horizontal">
            <fieldset>
                <legend>Formulier Groot Formaat</legend>
                <div id="extra-formaat">
                    <div class="formaat">
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
                            <label for="formaat" class="col-xs-2 control-label">Formaat</label>
                            <div class="col-xs-10">
                                <select id="formaat" class="form-control">
                                    <option value="" class="selected">Selecteer formaat ...</option>
                                    <option value="refl-print">Refl print met laminaat</option>
                                    <option value="print-met-laminaat">Print white/clear vinyl met laminaat</option>
                                    <option value="print-zonder-laminaat">Print white/clear vinyl zonder laminaat</option>
                                    <option value="standaard-snij">Standaard snij vinyl</option>
                                    <option value="standaard-snij-zonder-snijden">Standaard snij vinyl (zonder snijden)</option>
                                    <option value="etch">Etch</option>
                                    <option value="banner">Banner</option>
                                    <option value="poster">Poster</option>
                                    <option value="one-way">One way vision</option>
                                    <option value="wrap">Wrap</option>
                                    <option value="magneet">Magneet sheeting</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="oppervlakte" class="col-xs-2 control-label">Oppervlakte/m2</label>
                            <div class="col-xs-10">
                                <input type="number" step="0.1" class="form-control" id="oppervlakte" placeholder="Oppervlakte/m2" value="">
                                <!--  <input id="slider" type="range" min="0.2" max="5" step="0.2" /> -->
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="aantal" class="col-xs-2 control-label">Aantal</label>
                            <div class="col-xs-10">
                                <input type="number" class="form-control" id="aantal" placeholder="Aantal">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group m-t-80">
                    <label for="prijs" class="col-xs-2 control-label">Prijs</label>
                    <div class="col-sm-10 input-group">
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
                    {{--<a href="overzicht.html" class="btn btn-primary btn-flat">Terug</a>--}}
                {{--</div>--}}
            </fieldset>
        </form>
        <a href="{{ URL::previous() }}" class="btn btn-danger">Back</a>

    </div>
    @include('sop::print_cut._formulier_gr_formaat')
@endsection