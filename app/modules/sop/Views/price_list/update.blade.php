<script src="assets/bitd/js/jquery.min.js"></script>
<script src="assets/bitd/js/validation.js"></script>
<script src="assets/bitd/js/bootstrap.min.js"></script>

<div class="modal-header">
    <a href="{{ URL::previous() }}" class="close" type="button" title="click x button for close this entry form"> × </a>
    <h4 class="modal-title" id="myModalLabel">{{$pageTitle}}</h4>
</div>


<div class="modal-body">
    @section('content_update')
        {!! Form::model($data, ['method' => 'PATCH', 'route'=> ['update-price-list', $data->id],'id'=>'update-role','files'=>'true']) !!}
        {{--@include('sop::price_list._form')--}}

        <div class="form-group form-group no-margin-hr panel-padding-h no-padding-t no-border-t">

            <div class="row">
                <div class="col-sm-12">
                    {!! Form::label('code', 'Code:', ['class' => 'control-label']) !!}
                    {!! Form::text('code',Input::old('code'),['class' => 'form-control','placeholder'=>'Code','required','autofocus', 'title'=>'Enter Code']) !!}
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    {!! Form::label('product_category_id', 'Product Category:', ['class' => 'control-label']) !!}
                    {!! Form::Select('product_category_id',$cat_options ,Input::old('product_category_id'),['class'=>'form-control ','required']) !!}
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
                    <?php if(isset($data->thumb_image)){ ?>
                        <br>
                            <img src="{{ isset($data->thumb_image)? $data->thumb_image : ''}}">
                        <br>
                    <?php } ?>

                        @if(isset($data->relProductImage[0]))
                            <div style="margin: 5px 0">
                                @foreach($data->relProductImage as $images)
                                    <span class="after-delete-hideme-{{(isset($images['id']))?$images['id']:''}}" style="width: 32.4%; display: inline-block !important; border: 1px solid #e0e0e0; margin-bottom: 5px; position: relative; padding: 5px 0;">
                                        <button type="button" value="{{ (isset($images['id']))? $images['id'] : '' }}" class="btn btn-danger btn-xs delete" style="position:absolute; top:0; right:0; height: 20px; width: 20px; border-radius: 0 0 0 20px; padding:0 0 5px 5px !important; outline: none !important; box-shadow: none !important;">
                                            <i class="fa fa-times-circle"></i>
                                        </button>
                                        <img src="{{ isset($images['image'])? $images['thumbnail'] : ''}}" height="60">
                                    </span>
                                @endforeach
                            </div>
                        @endif
                        <br>
                    {!! Form::label('image', 'Add new Image:', ['class' => 'control-label']) !!}
                    {!! Form::file('image[]', ['class' => 'form-control','placeholder'=>'upload image','multiple', 'title'=>'Image']) !!}
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
            {!! Form::submit('Save changes', ['class' => 'btn btn-primary','data-placement'=>'top','data-content'=>'click save changes button for save price information']) !!}&nbsp;
            <a href="{{route('price-list')}}" class=" btn btn-default" data-placement="top" data-content="click close button for close this entry form">Close</a>
        </div>
        {!! Form::close() !!}
</div>
<script type="text/javascript">
    $.ajaxSetup({
        headers: { 'X-CSRF-Token' : $('meta[name=_token]').attr('content') }
    });
</script>
<script>
    /*==== For Image Delete */

    $(document).ready(function(){
       $('.delete').click(function(){
           var delete_id = $(this).val();
           var parent_id = "{{ $data->id }}";
           var delete_url = 'image-delete';
           //alert(delete_url);
           //confirm('are u sure !');

           if (confirm("Are you sure ! This Image will be removed permanently ") == true) {
               $.ajax({
                   type: "POST",
                   url: delete_url,
                   data: {'id': delete_id,'parent_id': parent_id},
                   success:function(data){
                       if(data !=''){
                           //alert(data);
                           $('.after-delete-hideme-'+delete_id).fadeOut(400);
                       }
                   }
               });
           } else {
              return false;
           }
       });
    });

    /*==== Image Delete End*/



    $(".btn").popover({ trigger: "manual" , html: true, animation:false})
            .on("mouseenter", function () {
                var _this = this;
                $(this).popover("show");
                $(".popover").on("mouseleave", function () {
                    $(_this).popover('hide');
                });
            }).on("mouseleave", function () {
        var _this = this;
        setTimeout(function () {
            if (!$(".popover:hover").length) {
                $(_this).popover("hide");
            }
        }, 300);
    });


    $(".form-control").tooltip();
    $('input:disabled, button:disabled').after(function (e) {
        d = $("<div>");
        i = $(this);
        d.css({
            height: i.outerHeight(),
            width: i.outerWidth(),
            position: "absolute",
        })
        d.css(i.offset());
        d.attr("title", i.attr("title"));
        d.tooltip();
        return d;
    });
</script>

<script>


    $(function () {
        $("#user-update").validate({
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

        $("#user-update").validate({
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

</script>



<script>


    $(function () {
        $("#update-role").validate({
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

        $("#update-role").validate({
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

</script>