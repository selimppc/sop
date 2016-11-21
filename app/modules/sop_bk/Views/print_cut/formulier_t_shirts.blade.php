@extends('admin::layouts.master')
@section('sidebar')
    @include('admin::layouts.sidebar')
@stop

@section('content')
    <div class="panel-body">
        <form class="form-horizontal">
            <fieldset>
                <legend>Formulier T-Shirts</legend>
                <div class="form-group">
                    <label for="aantal" class="col-xs-2 control-label">Aantal</label>
                    <div class="col-xs-10">
                        <input type="number" class="form-control" value="1" min="1" id="aantal" placeholder="Aantal" autofocus="">
                    </div>
                </div>

                <div id="extra-locatie">
                    <div class="locatie m-t-80">
                        <div class="form-group">
                            <label for="locatie" class="col-xs-2 control-label">Locatie</label>
                            <div class="col-xs-10">
                                <select id="locatie" class="form-control">
                                    <option value="none" class="selected">Selecteer locatie ...</option>
                                    <option value="mouwen">Mouwen</option>
                                    <option value="borst">Linker/ rechter borst</option>
                                    <option value="achter">Achter</option>
                                    <option value="a4">Achter/ voor - A4</option>
                                    <option value="a5">Achter/ voor - A5</option>
                                    <option value="petten">Petten</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group validation">
                            <label for="lengte" class="col-xs-2 control-label">Lengte</label>
                            <div class="col-xs-4">
                                <input type="number" class="form-control" id="lengte" placeholder="Lengte">
                            </div>

                            <label for="breedte" class="col-xs-2 control-label">Breedte</label>
                            <div class="col-xs-4">
                                <input type="number" class="form-control" id="breedte" placeholder="Breedte">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="prijs" class="col-xs-2 control-label">Prijs</label>
                            <div class="col-sm-9 input-group">
                                <span class="input-group-addon">SR$</span>
                                <input type="text" readonly="" class="prijs" id="prijs" placeholder="0,-">
                            </div>
                        </div>
                    </div>
                </div>

                <span id="add" class="btn btn-warning btn-sm fa fa-plus"></span>


                <div class="form-group m-t-80">
                    <label for="prijs" class="col-xs-12 control-label">Korting <span id="korting">0</span> % - <span id="bron">(bron: aantal truien)</span></label>
                    <label for="prijs" class="col-xs-4 control-label">Totale Prijs</label>
                    <div class="col-xs-8 input-group">
                        <span class="input-group-addon">SR$</span>
                        <input type="number" readonly="" class="totale_prijs" id="totale_prijs" placeholder="0,-">
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
    @include('sop::print_cut._formulier_t_shirts')
@endsection