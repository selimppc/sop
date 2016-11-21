@extends('admin::layouts.master')
@section('sidebar')
    @include('admin::layouts.sidebar')
@stop

@section('content')
    <div class="panel-body">
        <form class="form-horizontal">
            <fieldset>
                <legend>Formulier Laser Cards</legend>
                <div id="extra-laser-card">
                    <div class="laser-card">
                        <div class="form-group">
                            <label for="laser-card" class="col-xs-2 control-label">Laser cards</label>
                            <div class="col-xs-10">
                                <select id="laser-card" class="form-control">
                                    <option value="" class="selected">Selecteer laser card ...</option>
                                    <option value="visite">Visite kaart color</option>
                                    <option value="visite-laminaat">Visite kaart color met laminaat</option>
                                    <option value="a3">A3 print</option>
                                    <option value="a4">A4 print</option>
                                    <option value="a5">A5 print</option>
                                    <option value="a6">A6 print</option>
                                    <option value="brievenhoofd">Brievenhoofd</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="wederverkoper" class="col-xs-2 control-label">Layer type</label>
                            <div class="togglebutton">
                                <label>
                                    <input type="checkbox" value="checked" name="enkelzijdig" id="enkelzijdig"><span class="toggle"></span>Enkelzijdig
                                </label>
                                <label class="pet-checks">
                                    <input type="checkbox" value="checked" name="dubbelzijdig" id="dubbelzijdig"><span class="toggle"></span>Dubbelzijdig
                                </label>
                                <label class="pet-checks">
                                    <input type="checkbox" value="checked" name="lamineren" id="lamineren" disabled=""><span class="toggle"></span>Lamineren
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="grams" style="display: none;">
                                <label for="wederverkoper" class="col-xs-2 control-label">Grams</label>
                                <div class="radio radio-success">
                                    <label id="80grams">
                                        <input name="gram" value="80 gr" type="radio" id="80gr"><span class="circle"></span><span class="check"></span>
                                        80 gr
                                    </label>
                                    <label>
                                        <input name="gram" value="150 gr" type="radio" id="150gr"><span class="circle"></span><span class="check"></span>
                                        150 gr
                                    </label>
                                    <label>
                                        <input name="gram" value="250 gr" type="radio" id="250gr"><span class="circle"></span><span class="check"></span>
                                        250 gr
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" id="fr-stuks" style="display: none;">
                            <label for="aantal" class="col-xs-2 control-label">Per stuks</label>
                            <div class="col-xs-8">
                                <div class="form-control-wrapper"><input type="number" class="form-control empty" id="stuks" placeholder="Aantal" data-hint="De prijs per 100 stuks is SRD 200,-"><div class="hint">De prijs per 100 stuks is SRD 200,-</div><span class="material-input"></span></div>
                            </div>
                        </div>

                        <div class="form-group" id="fr-aantal">
                            <label for="aantal" class="col-xs-2 control-label">Aantal</label>
                            <div class="col-xs-10">
                                <input type="number" class="form-control" id="aantal" placeholder="Aantal">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group m-t-80">
                    <label for="prijs" class="col-xs-2 control-label">Prijs</label>
                    <label for="prijs" class="col-xs-1 control-label">SRD</label>
                    <div class="col-xs-9">
                        <input type="text" readonly="" class="prijs" id="prijs" placeholder="0 ,-" value="">
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
    @include('sop::print_cut._formulier_laser_cards')
@endsection