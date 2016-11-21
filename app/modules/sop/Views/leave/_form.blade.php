<script src="assets/bitd/js/jquery.min.js"></script>
<div class="form-group form-group no-margin-hr panel-padding-h no-padding-t no-border-t">
    {{--<div class="row">
        <div class="col-sm-12">
            {!! Form::label('user_id', 'User:', ['class' => 'control-label']) !!}
            <small class="required">(Required)</small>
            {!! Form::select('user_id',$user,null,['class' => 'form-control','placeholder'=>'user','required'=>'required','style'=>'text-transform:capitalize', 'title'=>'Select user']) !!}
        </div>
    </div>--}}

    @if(Session::get('user-role')=='worker')
        <div class="row">
            <div class="col-sm-12">
                {!! Form::label('type', 'Verlof Type:', ['class' => 'control-label']) !!}
                <small class="required">(Required)</small>
                <div class="input-group">
                    <select name="type" id="type" class="form-control" required="required">
                        <option value="">--- Selecteer een verlof type ---</option>
                        <option value="normaal">Normaal (prive gevallen)</option>
                        <option value="halve dag">Halve dag</option>
                        <option value="spoed">Spoed</option>
                    </select>
                </div>
            </div>
        </div>
    @elseif(Session::get('user-role')!='worker')
        <div class="row">
            <div class="col-sm-12">
                {!! Form::label('type', 'Verlof Type:', ['class' => 'control-label']) !!}
                <small class="required">(Required)</small>
                <div class="input-group">
                    <select name="type" id="type" class="form-control" required="required">
                        <option value="">--- Selecteer een verlof type ---</option>
                        <option value="normaal">Normaal</option>
                        <option value="halve dag">Halve dag</option>
                        <option value="spoed">Spoed</option>
                        <option value="onwettig verzuim">Onwettig verzuim</option>
                        <option value="buitenbezwaar">Buitenbezwaar</option>
                        <option value="vertrekbrief">Vertrekbrief (bv. Schorsing)</option>
                    </select>
                </div>
            </div>
        </div>
    @endif
    <div class="row">
        <div class="col-sm-12">
            {!! Form::label('from_date', 'Verlofdag From:', ['class' => 'control-label']) !!}
            <small class="required">(Required)</small>
            <div class="input-group">
                <input class="form-control" id="from_date" title="" required="required" name="from_date" type="date">
                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            {!! Form::label('to_date', 'Verlofdag To:', ['class' => 'control-label']) !!}
            <small class="required">(Required)</small>
            <div class="input-group">
                <input class="form-control" id="to_date" title="" required="required" name="to_date" type="date">
                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            {!! Form::label('reason', 'Reden:', ['class' => 'control-label']) !!}
            <small class="required">(Required)</small>
            {!! Form::textarea('reason',Input::old('reason'),['class' => 'form-control', 'rows'=>"8",'required']) !!}
        </div>
    </div>
</div>

<div class="footer-form-margin-btn">
    {!! Form::submit('Aanvragen', ['class' => 'btn btn-primary','data-placement'=>'top','data-content'=>'click save changes button for save role information']) !!}&nbsp;
    <a href="{{route('leave-application')}}" class=" btn btn-default" data-placement="top" data-content="click close button for close this entry form">Close</a>
</div>


<script>

    $("#form_2").submit(function(e){
        e.preventDefault();

        saldo = $("#saldo").html();
        from_date = $("#from_date").val();
        to_date = $("#to_date").val();

        function daysBetween(one, another) {
            return Math.round(Math.abs(one - another) / 8.64e7);
        }

        verschil = daysBetween(new Date(from_date), new Date(to_date)) + 1;
        alert(verschil);
        if (saldo < verschil) {
            alert("Onvoldoende verlofdagen!");
        } else {
            // alert("Voldoende verlofdagen");
            today = new Date();
            check_week = today.getDate() + 7;
            check_day = new Date(from_date);
            get_check_day = check_day.getDate();
            // alert(get_check_day);

            if (check_week > get_check_day) {
                alert("Dit is geen week van tevoren");
            } else {
                // alert("Dit is een week van tevoren");
                e.currentTarget.submit();
            }
        }
    });
</script>