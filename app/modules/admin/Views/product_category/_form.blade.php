<div class="modal-body">
@if($errors->any())
    <ul class="alert alert-danger">
        @foreach($errors->all() as $error)
            <li>{{ $error }}</li>
        @endforeach
    </ul>
@endif
@if(Session::has('flash_message_error'))
    <div class="alert alert-danger">
        <p>{{ Session::get('flash_message_error') }}</p>
    </div>
@endif
{{--<i>(for login-notification & pause-system,status put yes/no. And for max-google-email ,status put numeric value)</i>--}}

    <div class="form-group">
        {!! Form::label('title', 'Category Name :', ['class' => 'control-label']) !!}
        {!! Form::text('title', Input::old('title'), ['class' => 'form-control','required','autofocus']) !!}
    </div>

    <div class="form-group">
        {!! Form::label('description', 'Category Description :', ['class' => 'control-label']) !!}
        {!! Form::textarea('description', Input::old('description'), ['class' => 'form-control']) !!}
    </div>

    <div class="form-group">
        {!! Form::label('status', 'Status', ['class' => 'control-label']) !!}
        {!! Form::Select('status',array('active'=>'Active','inactive'=>'Inactive'),Input::old('status'),['class'=>'form-control ','required'=>'required']) !!}
    </div>

</div>
<div class="modal-footer">
    <a href="{{ URL::route('product-category') }}"  class="btn btn-default" type="button"> Close </a>
    {!! Form::submit('Save the Changes', ['class' => 'btn btn-success']) !!}
</div>
