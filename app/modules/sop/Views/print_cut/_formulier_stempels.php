<script>
    $(document).ready(function(){

        var koers = 0;

        $('.container, .form-control').on('change keyup click', function() {
            console.log($('#stempel').val());

            if ($('#stempel').val() == '14') {
                koers = 50;
            }else if ($('#stempel').val() == '22-6') {
                koers = 72.5;
            }else if ($('#stempel').val() == '22-7') {
                koers = 85;
            }else if ($('#stempel').val() == '34') {
                koers = 87.5;
            }else if ($('#stempel').val() == '40-4') {
                koers = 77.5;
            }else if ($('#stempel').val() == '40-9') {
                koers = 130;
            }

            $('#prijs').val($('#aantal').val() * koers);
        })
    })
</script>