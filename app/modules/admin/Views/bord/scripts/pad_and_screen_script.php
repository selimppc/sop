<script>
    $(document).ready(function(){

        //======== Script for Primary =============//
        /**
         * Check the initial value of the input select 'primary'
         */
        var oldInput = $("#primary").val();
        //alert(oldInput);
        if(oldInput == 'n' || oldInput == ''){
            $("#primary_child").hide();
        }
        /**
         * If Yes then show the 'primary_child' input select input
         */
        $("#primary").change( function(){

            var value = $(this).val();
            //alert(value);
            if(value == 'y') {
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
        if(oldInput_sec == 'n' || oldInput_sec == ''){
            $("#secondary_child").hide();
        }
        /**
         * If Yes then show the 'secondary_child' input select input
         */
        $("#secondary").change(function(){
            var value_sec = $(this).val();
            //alert(value_sec);
            if(value_sec == 'y'){
                $("#secondary_child").slideDown();
            }else {
                $("#secondary_child").slideUp();
            }
        });
    });
</script>