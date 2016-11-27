
        <div class="modal-header">
            <h4 class="modal-title">Edit Category of : <strong>{!! isset($data->title)? ucfirst($data->title):''!!}</strong></h4>
        </div>

        {!! Form::model($data,['method'=>'PATCH', 'route'=>['product-category-update', $data->id ]]) !!}
            @include('admin::product_category._form')
        {!! Form::close() !!}


