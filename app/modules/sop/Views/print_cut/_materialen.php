<script type="text/javascript">
    // koersen
    var usd = $("#usd").val();
    var euro = $("#euro").val();

    // console.log(euro);

    $('#aantal-groep').hide();

    $('input:checkbox[name=vel]').on('click', function(){
        $('#aantal-groep').slideToggle(100);
        $('#oppervlakte-groep').slideToggle(100);
    });

    //Script wordt gerunned elke keer
    $('.container, .form-control').on('change click keyup', function(){
        var lengte = parseInt($('#lengte').val());
        var breedte = parseInt($('#breedte').val());
        
        var eenheid = $('#eenheid').val();

        if (eenheid == "cm") {
            var oppervlakte = (lengte / 100) * (breedte / 100);
        } else if (eenheid == "m"){
            var oppervlakte = lengte * breedte;
        } else if (eenheid =="inch"){
            var oppervlakte = (lengte * 0.25) * (breedte * 0.25);
        }

        $('#oppervlakte').val(oppervlakte);
        
        // Type Klant Normaal
        if ($('input[name="type"]:checked').val() == "normaal") {
            // Type Materiaal
            if ($("#soort").val() == 'aluconbond') {
                if ($('input:checkbox[name=vel]').prop('checked')) {
                    //prijs aluconbond per vel + berekening aantal x vel
                    $('#prijs').val($('#aantal').val() * 65);
                }else{
                    // berekening aluconbond normaal met oppervlakte
                    // $('#prijs').val(40.5);
                    var totaal = 40.5;

                    $('#prijs').val(totaal);

                    if ($('#oppervlakte').val() < 0) {
                        $('#oppervlakte').val(0);
                    }else if ($('#oppervlakte').val() <= 0.1) {
                        var totaal = oppervlakte * 40.5;
                        // $('#prijs').val(totaal);
                    }else if ($('#oppervlakte').val() <= 0.5) {
                        var totaal = oppervlakte * 38.5;
                        // $('#prijs').val(totaal);
                    }else if ($('#oppervlakte').val() <= 1) {
                        var totaal = oppervlakte * 35;
                        // $('#prijs').val(totaal);
                    }else if ($('#oppervlakte').val() <= 3) {
                        var totaal = oppervlakte * 33.5;
                        // $('#prijs').val(totaal);
                    }else{
                        var totaal = oppervlakte * 31.5;
                        // $('#prijs').val(totaal);
                    }

                    $('#prijs').val(totaal);
                }
            }else if ($("#soort").val() == 'celtec') {
                if ($('input:checkbox[name=vel]').prop('checked')) {
                    //prijs celtec per vel + berekening aantal x vel
                    $('#prijs').val($('#aantal').val() * 40);
                }else{
                    // berekening celtec normaal met oppervlakte
                    // $('#prijs').val();

                    var totaal = 29

                    if ($('#oppervlakte').val() < 0) {
                        $('#oppervlakte').val(0);
                    }else if ($('#oppervlakte').val() <= 0.1) {
                        var totaal = oppervlakte * 29;
                        // $('#prijs').val(totaal);
                    }else if ($('#oppervlakte').val() <= 0.5) {
                        var totaal = oppervlakte * 27.5;
                        // $('#prijs').val(totaal);
                    }else if ($('#oppervlakte').val() <= 1) {
                        var totaal = oppervlakte * 25;
                        // $('#prijs').val(totaal);
                    }else if ($('#oppervlakte').val() <= 3) {
                        var totaal = oppervlakte * 24;
                        // $('#prijs').val(totaal);
                    }else{
                        var totaal = oppervlakte * 22.5;
                        // $('#prijs').val(totaal);
                    }
                    
                    $('#prijs').val(totaal);
                }
            }else if ($("#soort").val() == 'acrylic-3.0') {
                if ($('input:checkbox[name=vel]').prop('checked')) {
                    //prijs acrylic-3.0 per vel + berekening aantal x vel
                    $('#prijs').val($('#aantal').val() * 85);
                }else{
                    // berekening acrylic-3.0 normaal met oppervlakte
                    // $('#prijs').val(80.5);
                    var totaal = 80.5;

                    if ($('#oppervlakte').val() < 0) {
                        $('#oppervlakte').val(0);
                    }else if ($('#oppervlakte').val() <= 0.1) {
                        var totaal = oppervlakte * 80.5;
                        // $('#prijs').val(totaal);
                    }else if ($('#oppervlakte').val() <= 0.5) {
                        var totaal = oppervlakte * 77;
                        // $('#prijs').val(totaal);
                    }else if ($('#oppervlakte').val() <= 1) {
                        var totaal = oppervlakte * 70;
                        // $('#prijs').val(totaal);
                    }else if ($('#oppervlakte').val() <= 3) {
                        var totaal = oppervlakte * 66.5;
                        // $('#prijs').val(totaal);
                    }else{
                        var totaal = oppervlakte * 63;
                    }

                    $('#prijs').val(totaal);
                }
            }else if ($("#soort").val() == 'acrylic-5.0') {
                if ($('input:checkbox[name=vel]').prop('checked')) {
                    //prijs acrylic-5.0 per vel + berekening aantal x vel
                    $('#prijs').val($('#aantal').val() * 145);
                }else{
                    // berekening acrylic-5.0 normaal met oppervlakte
                    // $('#prijs').val(138);

                    var totaal = 138

                    if ($('#oppervlakte').val() < 0) {
                        $('#oppervlakte').val(0);
                    }else if ($('#oppervlakte').val() <= 0.1) {
                        var totaal = oppervlakte * 138;
                        // $('#prijs').val(totaal);
                    }else if ($('#oppervlakte').val() <= 0.5) {
                        var totaal = oppervlakte * 132;
                        // $('#prijs').val(totaal);
                    }else if ($('#oppervlakte').val() <= 1) {
                        var totaal = oppervlakte * 120;
                        // $('#prijs').val(totaal);
                    }else if ($('#oppervlakte').val() <= 3) {
                        var totaal = oppervlakte * 114;
                        // $('#prijs').val(totaal);
                    }else{
                        var totaal = oppervlakte * 108;
                        // $('#prijs').val(totaal);
                    }
                    $('#prijs').val(totaal);
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
                    $('#prijs').val($('#aantal').val() * 40);
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
        var prijs = $("#prijs").val();

        var berekening_usd = Math.round((prijs / usd) * 100) / 100;
        var berekening_euro = Math.round((prijs / euro) * 100) / 100;

        $("#totale_prijs_usd").val(berekening_usd);
        $("#totale_prijs_euro").val(berekening_euro);
    });

</script>