<script>
    $(document).ready(function(){

        //======== Script for Primary =============//
        /**
         * Check the initial value of the input select 'primary'
         */
        var oldInput = $("#primary").val();
        //alert(oldInput);
        if(oldInput == '2' || oldInput == ''){
            $("#primary_child").hide();
        }
        /**
         * If Yes then show the 'primary_child' input select input
         */
        $("#primary").change( function(){

            var value = $(this).val();
            //alert(value);
            if(value == '1') {
                $("#primary_child").slideDown();
            }else {
                $("#primary_child").slideUp();
            }
        })

        //===============Script for Secondary =============//
        /**
         * Check the initial value of the input select 'secondary'
         */
        var oldInput_sec = $("#secondary").val();
        if(oldInput_sec == '2' || oldInput_sec == ''){
            $("#secondary_child").hide();
        }
        /**
         * If Yes then show the 'secondary_child' input select input
         */
        $("#secondary").change(function(){
            var value_sec = $(this).val();
            //alert(value_sec);
            if(value_sec == '1'){
                $("#secondary_child").slideDown();
            }else {
                $("#secondary_child").slideUp();
            }
        });
    });
</script>