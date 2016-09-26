<script src="assets/bitd/js/jquery.min.js"></script>
<div class="form-group form-group no-margin-hr panel-padding-h no-padding-t no-border-t">
    {{--<div class="row">
        <div class="col-sm-12">
            {!! Form::label('user_id', 'User:', ['class' => 'control-label']) !!}
            <small class="required">(Required)</small>
            {!! Form::select('user_id',$user,null,['class' => 'form-control','placeholder'=>'user','required'=>'required','style'=>'text-transform:capitalize', 'title'=>'Select user']) !!}
        </div>
    </div>--}}

    <div class="row">
        <div class="col-sm-12">
            {!! Form::label('from_date', 'Verlofdag From:', ['class' => 'control-label']) !!}
            <small class="required">(Required)</small>
            <div class="input-group date">
                {!! Form::text('from_date', Input::old('from_date'), ['class' => 'form-control bs-datepicker-component','title'=>'select date','required']) !!}
                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            {!! Form::label('to_date', 'Verlofdag To:', ['class' => 'control-label']) !!}
            <small class="required">(Required)</small>
            <div class="input-group date">
                {!! Form::text('to_date', Input::old('to_date'), ['class' => 'form-control bs-datepicker-component','title'=>'select date','required']) !!}
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

    //document.onload = function() {
    $(function () {
        $("#form_2").validate({
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

        $("#form_2").validate({
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
    //}
</script>

