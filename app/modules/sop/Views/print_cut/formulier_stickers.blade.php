@extends('admin::layouts.master')
@section('sidebar')
    @include('admin::layouts.sidebar')
@stop

@section('content')
    <div class="panel-body">
        <form class="form-horizontal">
            <fieldset>
                <legend class="p-m">Stickers</legend>
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

                <div class="form-group m-b" id="lengte-groep">
                    <label for="lengte" class="col-sm-2 control-label">Lengte(cm)</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="lengte" placeholder="Lengte">
                    </div>
                </div>

                <div class="form-group m-b" id="breedte-groep">
                    <label for="breedte" class="col-sm-2 control-label">Breedte(cm)</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="breedte" placeholder="Breedte">
                    </div>
                </div>

                <div class="form-group m-b">
                    <label for="oppervlakte" class="col-sm-2 control-label">Oppervlakte(cm<sup>2</sup>)</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="oppervlakte" placeholder="Oppervlakte" disabled="">
                    </div>
                </div>

                <!-- <div class="form-group m-b" id="lengte-groep" style="display: none;">
                    <label for="lengte" class="col-sm-2 control-label">Lengte</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="lengte" placeholder="Lengte">
                    </div>
                </div> -->

                <div class="form-group m-b-xl">
                    <label for="aantal" class="col-sm-2 control-label">Aantal</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="aantal" placeholder="Aantal">
                    </div>
                </div>

                <div class="form-group m-b">
                    <label for="aantal" class="col-sm-2 control-label">Prijs</label>
                    <div class="col-sm-10">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>SRD</th>
                                    <th>USD</th>
                                    <th>EURO</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="text" readonly="" class="prijs form-control" id="" placeholder="0,-" value=""></td>
                                    <td><input type="text" readonly="" class="prijs_usd form-control" id="" placeholder="0,-" value=""></td>
                                    <td><input type="text" readonly="" class="prijs_euro form-control" id="" placeholder="0,-" value=""></td>
                                </tr>
                            </tbody>
                        </table>
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

                <input type="hidden" id="usd" value="<?= $usd; ?>">
                <input type="hidden" id="euro" value="<?= $euro; ?>">

            </fieldset>
        </form>
        <a href="{{ URL::previous() }}" class="btn btn-danger">Back</a>


    </div>
    @include('sop::print_cut._formulier_stickers')
@endsection