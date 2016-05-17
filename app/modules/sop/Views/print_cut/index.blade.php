@extends('admin::layouts.master')
@section('sidebar')
    @include('admin::layouts.sidebar')
@stop

@section('content')
<div class="panel-body">
    <div class="row">
        <div class="col-lg-4 animated-panel zoomIn" style="animation-delay: 0.1s;">
            <div class="hpanel">
                <div class="panel-body text-center">
                    <br>
                    <a class="" data-toggle="modal" href="{!! url('formulier-stickers') !!}" data-content="Stickers" style="roumargin-left:1%"><i class="channel fa fa-file-text"></i>
                        <br>
                        <span style="font-size:medium;">Stickers</span>
                    </a>
                    <br>
                </div>
            </div>
        </div>
        <div class="col-lg-4 animated-panel zoomIn" style="animation-delay: 0.1s;">
            <div class="hpanel">
                <div class="panel-body text-center">
                    <br>
                    <a class="" data-toggle="modal" href="{!! url('formulier-t-shirts') !!}" data-content="T-Shirts" style="roumargin-left:1%"><i class="channel fa fa-file-text"></i>
                        <br>
                        <span style="font-size:medium;">T-Shirts</span>
                    </a>
                    <br>
                </div>
            </div>
        </div>
        <div class="col-lg-4 animated-panel zoomIn" style="animation-delay: 0.1s;">
            <div class="hpanel">
                <div class="panel-body text-center">
                    <br>
                    <a class="" data-toggle="modal" href="{!! url('formulier-gr-formaat') !!}" data-content="Stickers" style="roumargin-left:1%"><i class="channel fa fa-file-text"></i>
                        <br>
                        <span style="font-size:medium;">Stickers<br>(Groot formaat)</span>
                    </a>
                    <br>
                </div>
            </div>
        </div>
        <div class="col-lg-4 animated-panel zoomIn" style="animation-delay: 0.1s;">
            <div class="hpanel">
                <div class="panel-body text-center">
                    <br>
                    <a class="" data-toggle="modal" href="{!! url('materialen') !!}" data-content="Materialen" style="roumargin-left:1%"><i class="channel fa fa-file-text"></i>
                        <br>
                        <span style="font-size:medium;">Materialen</span>
                    </a>
                    <br>
                </div>
            </div>
        </div>
        <div class="col-lg-4 animated-panel zoomIn" style="animation-delay: 0.1s;">
            <div class="hpanel">
                <div class="panel-body text-center">
                    <br>
                    <a class="" data-toggle="modal" href="{!! url('formulier-laser-cards') !!}" data-content="Laser Cards" style="roumargin-left:1%"><i class="channel fa fa-file-text"></i>
                        <br>
                        <span style="font-size:medium;">Laser Cards</span>
                    </a>
                    <br>
                </div>
            </div>
        </div>
        <div class="col-lg-4 animated-panel zoomIn" style="animation-delay: 0.1s;">
            <div class="hpanel">
                <div class="panel-body text-center">
                    <br>
                    <a class="" data-toggle="modal" href="{!! url('formulier-stempels') !!}" data-content="Stempels" style="roumargin-left:1%"><i class="channel fa fa-file-text"></i>
                        <br>
                        <span style="font-size:medium;">Stempels</span>
                    </a>
                    <br>
                </div>
            </div>
        </div>
    </div>
    {{--<a href="{!! url('formulier-stickers') !!}">
        <div class="col-lg-2 col-md-3 col-xs-11">
            <img width="100%" src="http://sibonlineplatform.app.sr/img/stickers.jpg">
            <h3>Stickers</h3>
        </div>
    </a>
    <a href="{!! url('formulier-t-shirts') !!}">
        <div class="col-lg-2 col-md-3 col-xs-11">
            <img width="100%" src="http://sibonlineplatform.app.sr/img/t-shirts.jpg">
            <h3>T-Shirts</h3>
        </div>
    </a>
    <a href="{!! url('formulier-gr-formaat') !!}">
        <div class="col-lg-2 col-md-3 col-xs-11">
            <img width="100%" src="http://sibonlineplatform.app.sr/img/stickers-groot-mini.jpg">
            <h3>Stickers</h3>
            <p>Groot formaat</p>
        </div>
    </a>
    <a href="{!! url('materialen') !!}">
        <div class="col-lg-2 col-md-3 col-xs-11">
            <img width="100%" src="http://sibonlineplatform.app.sr/img/materialen.jpg">
            <h3>Materialen</h3>
        </div>
    </a>
    <a href="{!! url('formulier-laser-cards') !!}">
        <div class="col-lg-2 col-md-3 col-xs-11">
            <img width="100%" src="http://sibonlineplatform.app.sr/img/laser.jpg">
            <h3>Laser Cards</h3>
        </div>
    </a>
    <a href="{!! url('formulier-stempels') !!}">
        <div class="col-lg-2 col-md-3 col-xs-11">
            <img width="100%" src="http://sibonlineplatform.app.sr/img/stempels.jpg">
            <h3>Stempels</h3>
        </div>
    </a>--}}
</div>
@endsection