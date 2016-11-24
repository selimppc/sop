
        <div class="modal-header">
            <h4 class="modal-title">Edit User Type of :{!! isset($data->title)? ucfirst($data->title):''!!}</h4>
        </div>

        {!! Form::model($data,['method'=>'PATCH', 'route'=>['settings-update', $data->id ]]) !!}
            @include('admin::settings._form')
        {!! Form::close() !!}


