<script type="text/javascript">

    $('#aantal-groep').hide();

    $('input:checkbox[name=vel]').on('click', function(){
        $('#aantal-groep').slideToggle(100);
        $('#oppervlakte-groep').slideToggle(100);
    });

    //Script wordt gerunned elke keer
    $('.container, .form-control').on('change click keyup', function(){
        // Type Klant Normaal
        if ($('input[name="type"]:checked').val() == "normaal") {
            // Type Materiaal
            if ($("#soort").val() == 'aluconbond') {
                if ($('input:checkbox[name=vel]').prop('checked')) {
                    //prijs aluconbond per vel + berekening aantal x vel
                    $('#prijs').val($('#aantal').val() * 80);
                }else{
                    // berekening aluconbond normaal met oppervlakte
                    $('#prijs').val(105);
                    if ($('#oppervlakte').val() < 0) {
                        $('#oppervlakte').val(0);
                    }else if ($('#oppervlakte').val() <= 0.1) {
                        $('#prijs').val(105);
                    }else if ($('#oppervlakte').val() <= 0.5) {
                        $('#prijs').val(80);
                    }else if ($('#oppervlakte').val() <= 1) {
                        $('#prijs').val(50);
                    }else if ($('#oppervlakte').val() <= 3) {
                        $('#prijs').val(45);
                    }else{
                        $('#prijs').val(35);
                    }

                }
            }else if ($("#soort").val() == 'celtec') {
                if ($('input:checkbox[name=vel]').prop('checked')) {
                    //prijs celtec per vel + berekening aantal x vel
                    $('#prijs').val($('#aantal').val() * 35);
                }else{
                    // berekening celtec normaal met oppervlakte
                    $('#prijs').val(75);
                    if ($('#oppervlakte').val() < 0) {
                        $('#oppervlakte').val(0);
                    }else if ($('#oppervlakte').val() <= 0.1) {
                        $('#prijs').val(75);
                    }else if ($('#oppervlakte').val() <= 0.5) {
                        $('#prijs').val(50);
                    }else if ($('#oppervlakte').val() <= 1) {
                        $('#prijs').val(25);
                    }else if ($('#oppervlakte').val() <= 3) {
                        $('#prijs').val(20);
                    }else{
                        $('#prijs').val(15);
                    }

                }
            }else if ($("#soort").val() == 'acrylic-3.0') {
                if ($('input:checkbox[name=vel]').prop('checked')) {
                    //prijs acrylic-3.0 per vel + berekening aantal x vel
                    $('#prijs').val($('#aantal').val() * 92);
                }else{
                    // berekening acrylic-3.0 normaal met oppervlakte
                    $('#prijs').val(125);
                    if ($('#oppervlakte').val() < 0) {
                        $('#oppervlakte').val(0);
                    }else if ($('#oppervlakte').val() <= 0.1) {
                        $('#prijs').val(125);
                    }else if ($('#oppervlakte').val() <= 0.5) {
                        $('#prijs').val(100);
                    }else if ($('#oppervlakte').val() <= 1) {
                        $('#prijs').val(75);
                    }else if ($('#oppervlakte').val() <= 3) {
                        $('#prijs').val(50);
                    }else{
                        $('#prijs').val(35);
                    }

                }
            }else if ($("#soort").val() == 'acrylic-5.0') {
                if ($('input:checkbox[name=vel]').prop('checked')) {
                    //prijs acrylic-5.0 per vel + berekening aantal x vel
                    $('#prijs').val($('#aantal').val() * 152);
                }else{
                    // berekening acrylic-5.0 normaal met oppervlakte
                    $('#prijs').val(175);
                    if ($('#oppervlakte').val() < 0) {
                        $('#oppervlakte').val(0);
                    }else if ($('#oppervlakte').val() <= 0.1) {
                        $('#prijs').val(175);
                    }else if ($('#oppervlakte').val() <= 0.5) {
                        $('#prijs').val(150);
                    }else if ($('#oppervlakte').val() <= 1) {
                        $('#prijs').val(125);
                    }else if ($('#oppervlakte').val() <= 3) {
                        $('#prijs').val(75);
                    }else{
                        $('#prijs').val(55);
                    }

                }
            } // Type Materiaal










            // Type Klant Wederverkoper
        }else if ($('input[name="type"]:checked').val() == "wederverkoper"){
            // oppervlakte ronden op volgende cijfer
            var perm2 = Math.ceil($('#oppervlakte').val());

            // Type Materiaal
            if ($("#soort").val() == 'aluconbond') {
                if ($('input:checkbox[name=vel]').prop('checked')) {
                    //prijs aluconbond per vel + berekening aantal x vel
                    $('#prijs').val($('#aantal').val() * 65);
                }else{
                    // berekening aluconbond per/m2
                    $('#prijs').val(perm2 * 30);

                }
            }else if ($("#soort").val() == 'celtec') {
                if ($('input:checkbox[name=vel]').prop('checked')) {
                    //prijs celtec per vel + berekening aantal x vel
                    $('#prijs').val($('#aantal').val() * 30);
                }else{
                    // berekening celtec per/m2
                    $('#prijs').val(perm2 * 12.5);

                }
            }else if ($("#soort").val() == 'acrylic-3.0') {
                if ($('input:checkbox[name=vel]').prop('checked')) {
                    //prijs celtec per vel + berekening aantal x vel
                    $('#prijs').val($('#aantal').val() * 85);
                }else{
                    // berekening celtec per/m2
                    $('#prijs').val(perm2 * 30);

                }
            }else if ($("#soort").val() == 'acrylic-5.0') {
                if ($('input:checkbox[name=vel]').prop('checked')) {
                    //prijs celtec per vel + berekening aantal x vel
                    $('#prijs').val($('#aantal').val() * 145);
                }else{
                    // berekening celtec per/m2
                    $('#prijs').val(perm2 * 50);

                }
            } // Type Materiaal // Type Materiaal
        } // Type Klant eind
    });


</script>
