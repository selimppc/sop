@extends('admin::layouts.master')
@section('sidebar')
    @include('admin::layouts.sidebar')
@stop

@section('content')
    <div class="panel-body">
        <form class="form-horizontal">
            <fieldset>
                <legend class="p-m">Formulier Stickers</legend>
                <div class="form-group m-b-xl">
                    <label for="soort" class="col-sm-2 control-label">Soort Sticker</label>
                    <div class="col-sm-10">
                        <select id="soort" class="form-control">
                            <option value="" class="selected">Selecteer soort sticker ...</option>
                            <option value="snij">Snij</option>
                            <option value="print">Print vinyl met laminaat</option>
                            <option value="reflecterend">Reflecterend</option>
                            <option value="chromen">Chromen</option>
                            <option value="fluorecent">Fluorecent</option>
                            <option value="etch">Etch</option>
                        </select>
                    </div>
                </div>

                <div class="form-group m-b">
                    <label for="oppervlakte" class="col-sm-2 control-label">Oppervlakte</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="oppervlakte" placeholder="Oppervlakte/cm2">
                    </div>
                </div>

                <div class="form-group m-b" id="lengte-groep" style="display: none;">
                    <label for="lengte" class="col-sm-2 control-label">Lengte</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="lengte" placeholder="Lengte">
                    </div>
                </div>

                <div class="form-group m-b-xl">
                    <label for="aantal" class="col-sm-2 control-label">Aantal</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="aantal" placeholder="Aantal">
                    </div>
                </div>

                <div class="form-group m-b">
                    <label for="aantal" class="col-sm-2 control-label">Prijs</label>
                    <div class="col-sm-10">
                        <div class="input-group m-b">
                            <span class="input-group-addon">SR$</span>
                            <input type="text" readonly="" class="prijs form-control" id="" placeholder="0,-" value="">
                        </div>
                    </div>
                </div>

                <!-- <div class="form-group m-t-80">
                    <div class="col-xs-1 col-xs-offset-2">
                        <button type="submit" class="btn btn-primary btn-fab btn-raised mdi-action-add-shopping-cart"></button>
                    </div>
                </div>

                <div class="col-md-offset-10 col-md-2">
                    <a href="overzicht.html" <button class="btn btn-primary btn-flat">Terug</a>
                </div> -->
            </fieldset>
        </form>
        <a href="{{ URL::previous() }}" class="btn btn-danger">Back</a>


    </div>
    @include('sop::print_cut._formulier_stickers')
@endsection