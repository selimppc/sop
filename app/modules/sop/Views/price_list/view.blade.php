<style>
    .loader { border: 10px solid #f3f3f3; border-radius: 50%; border-top: 10px solid #505050; border-bottom: 10px solid #505050; width: 50px; height: 50px; -webkit-animation: spin 2s linear infinite; animation: spin 2s linear infinite; }
    @-webkit-keyframes spin {  0% { -webkit-transform: rotate(0deg); } 100% { -webkit-transform: rotate(360deg); } }
    @keyframes spin { 0% { transform: rotate(0deg); } 100% { transform: rotate(360deg); }  }
</style>
<div class="modal-header">
    <a href="{{ URL::previous() }}" class="close" type="button" title="click x button for close this entry form"> × </a>
    <h4 class="modal-title" id="myModalLabel">{{$pageTitle}}</h4>
</div>

<div class="modal-body">
    <div style="padding: 30px;">
        <table id="" class="table table-bordered table-hover table-striped">
            <tr>
                <th class="col-lg-4">Code</th>
                <td>{{ isset($data->code)? $data->code : ''}}</td>
            </tr>
            <tr>
                <th class="col-lg-4">Image</th>
                <td style="position: relative;">
                    <div style="position: absolute; width: 20%; left: 39%; top: 20%; z-index: 100; padding: 1%;" class="loading">
                        <div class="loader"></div>
                    </div>
                    @if(isset($data->relProductImage[0]))
                        <span class="view_span" style="display: block;">
                            <img src="{{ isset($data->relProductImage[0]['image'])? $data->relProductImage[0]['image'] : ''}}" style="width: auto; max-width: 350px !important;">
                        </span>
                        <hr>
                        @foreach($data->relProductImage as $images)
                            <span class="onclick-showme" style="width: 32.4%; overflow: hidden; cursor:pointer; display: inline-block !important; border: 1px solid #e0e0e0; margin-bottom: 5px; position: relative; padding: 5px 0;">
                                <img src="{{ isset($images['image'])? $images['thumbnail'] : ''}}" id="{{(isset($images['id']))?$images['id']:''}}" class="target_image" height="60">
                                <span style="display: none;" class="hidden_images_{{(isset($images['id']))?$images['id']:''}}">
                                    <img src="{{ isset($images['image'])? $images['image'] : ''}}" id="{{(isset($images['id']))?$images['id']:''}}" class="target_image" height="60">
                                </span>
                            </span>
                        @endforeach
                    @endif
                </td>
            </tr>
            <tr>
                <th class="col-lg-4">Description</th>
                <td>{{ isset($data->description)? $data->description : ''}}</td>
            </tr>
            <tr>
                <th class="col-lg-4">Unit</th>
                <td>{{ isset($data->unit)? $data->unit : ''}}</td>
            </tr>
            <tr>
                <th class="col-lg-4">Price</th>
                <td>{{ isset($data->price)? number_format($data->price, 2) : ''}}</td>
            </tr>
            <tr>
                <th class="col-lg-4">Status</th>
                <td>{{ isset($data->status)?ucfirst($data->status):'' }}</td>
            </tr>

        </table>
    </div>
</div>

<div class="modal-footer">
    <a href="{{ URL::previous()}}" class="btn btn-default" type="button" data-placement="top" data-content="click close button for close this entry form"> Close </a>
</div>
<script type="text/javascript">
    $.ajaxSetup({
        headers: { 'X-CSRF-Token' : $('meta[name=_token]').attr('content') }
    });
</script>
<script>
    /*==== For Image Show */

    $(document).ready(function(){
        $(".loading").hide();
        $(".target_image").click(function(){
            $(".loading").show();
            var targetId = $(this).attr('id');
            //alert(targetId);
            var method_url = 'onclick-image-show';

            $.ajax({
                type: "POST",
                url: method_url,
                data: {'id': targetId},
                success:function(data){
                    if(data !=''){
                        //alert(data);
                        $(".loading").hide();
                        $(".view_span").empty().append('<img src="'+ data +'" width="300">').hide().fadeIn(600);
                    }
                }
            });
        });
    });
    /*==== For Image Show End */

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
</script>




