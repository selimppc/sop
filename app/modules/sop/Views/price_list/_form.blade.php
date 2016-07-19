<script src="assets/bitd/js/jquery.min.js"></script>
<div class="form-group form-group no-margin-hr panel-padding-h no-padding-t no-border-t">
    <div class="row">
        <div class="col-sm-12">
            {!! Form::label('code', 'Code:', ['class' => 'control-label']) !!}
            {!! Form::text('code',Input::old('code'),['class' => 'form-control','placeholder'=>'Code','required','autofocus', 'title'=>'Enter Code']) !!}
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            {!! Form::label('description', 'Description:', ['class' => 'control-label']) !!}
            {!! Form::textarea('description',Input::old('description'),['class' => 'form-control', 'rows'=>"4"]) !!}
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            {!! Form::label('unit', 'Unit:', ['class' => 'control-label']) !!}
            {!! Form::text('unit',Input::old('unit'),['class' => 'form-control','placeholder'=>'Unit','required', 'title'=>'Enter Unit']) !!}
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            {!! Form::label('price', 'Price:', ['class' => 'control-label']) !!}
            {!! Form::text('price',Input::old('price'),['class' => 'form-control','placeholder'=>'0.00','required', 'title'=>'Enter Price']) !!}
        </div>
    </div>


    <div class="row">
        <div class="col-sm-12">
            {!! Form::label('image', 'Image:', ['class' => 'control-label']) !!}
            {!! Form::file('image', ['class' => 'form-control','placeholder'=>'upload image','required', 'title'=>'Image']) !!}
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            {!! Form::label('status', 'Status:', ['class' => 'control-label']) !!}
            <small class="narration">(Active status Selected)</small>
        {!! Form::Select('status',array('active'=>'Active','inactive'=>'Inactive'),Input::old('status'),['class'=>'form-control ','required']) !!}
        </div>
    </div>
</div>

<div class="footer-form-margin-btn">
    {!! Form::submit('Save changes', ['class' => 'btn btn-primary','data-placement'=>'top','data-content'=>'click save changes button for save role information']) !!}&nbsp;
    <a href="{{route('role')}}" class=" btn btn-default" data-placement="top" data-content="click close button for close this entry form">Close</a>
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

