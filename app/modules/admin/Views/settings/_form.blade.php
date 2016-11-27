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
        {!! Form::label('title_full', 'Item Title:', ['class' => 'control-label']) !!}
        {!! Form::text('title_full', Input::old('title_full'), ['class' => 'form-control','required','autofocus']) !!}
    </div>

    <div class="form-group">
        {!! Form::label('status', 'Status/Value/Price:', ['class' => 'control-label']) !!}
        {!! Form::text('status', Input::old('status'), ['class' => 'form-control','required']) !!}
    </div>

    <div class="form-group">
        {!! Form::label('user_type', 'User Type', ['class' => 'control-label']) !!}
        {!! Form::Select('user_type',array('admin'=>'Admin','user'=>'User'),Input::old('user_type'),['class'=>'form-control ','required'=>'required']) !!}
    </div>
    <?php
        if(isset($data->title)){
            $attr = 'readonly';
        }else{
            $attr = 'required';
        }
    ?>
    <div class="form-group">
        {!! Form::label('title', 'Title (Short form):', ['class' => 'control-label']) !!}
        {!! Form::text('title', Input::old('title'), ['class' => 'form-control',$attr]) !!}
    </div>
</div>
<div class="modal-footer">
    <a href="{{ URL::route('settings') }}"  class="btn btn-default" type="button"> Close </a>
    {!! Form::submit('Submit', ['class' => 'btn btn-success']) !!}
</div>
