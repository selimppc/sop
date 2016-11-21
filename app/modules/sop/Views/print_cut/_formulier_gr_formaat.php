<script>
    /**
     * HOMER - Responsive Admin Theme
     * version 1.7
     *
     */

    // koersen
    var usd = $("#usd").val();
    var euro = $("#euro").val();

    $(document).ready(function() {
        $('.form-control').change(function() {

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
            
            if($('#oppervlakte').val() < 0.2) {
                $('.prijs').attr('value', '');
                $('#oppervlakte').val(0.2);
                $('.error').text('Het minimale oppervlakte is 0.2 m2');
                $('.error').stop().fadeIn(400).delay(3000).fadeOut(400); //fade out after 3 seconds
            }
            $('.container, .form-control').on('click change keyup', function() {
                if($('#formaat').val() == 'refl-print') {
                    if($('input[name="type"]:checked').val() != "normaal") {
                        if($('#oppervlakte').val() <= 5) {
                            var koers = 85;
                        } else {
                            var koers = 80;
                        }
                    }
                    else if($('#oppervlakte').val() > 5) {
                        var koers = 85;
                    } else if($('#oppervlakte').val() > 2) {
                        var koers = 90;
                    } else if($('#oppervlakte').val() > 0.5) {
                        var koers = 100;
                    } else if($('#oppervlakte').val() >= 0.2) {
                        var koers = 105;
                    }
                } else if($('#formaat').val() == 'print-met-laminaat') {
                    if($('input[name="type"]:checked').val() != "normaal") {
                        if($('#oppervlakte').val() <= 5) {
                            var koers = 30;
                        } else {
                            var koers = 30;
                        }
                    }
                    else if($('#oppervlakte').val() > 5) {
                        var koers = 35;
                    } else if($('#oppervlakte').val() > 2) {
                        var koers = 35;
                    } else if($('#oppervlakte').val() > 0.5) {
                        var koers = 40;
                    } else if($('#oppervlakte').val() >= 0.2) {
                        var koers = 60;
                    }
                } else if($('#formaat').val() == 'print-zonder-laminaat') {
                    if($('input[name="type"]:checked').val() != "normaal") {
                        if($('#oppervlakte').val() <= 5) {
                            var koers = 25;
                        } else {
                            var koers = 25;
                        }
                    }
                    else if($('#oppervlakte').val() > 5) {
                        var koers = 25;
                    } else if($('#oppervlakte').val() > 2) {
                        var koers = 25;
                    } else if($('#oppervlakte').val() > 0.5) {
                        var koers = 30;
                    } else if($('#oppervlakte').val() >= 0.2) {
                        var koers = 50;
                    }
                } else if($('#formaat').val() == 'standaard-snij') {
                    if($('input[name="type"]:checked').val() != "normaal") {
                        if($('#oppervlakte').val() <= 5) {
                            var koers = 20;
                        } else {
                            var koers = 20;
                        }
                    }
                    else if($('#oppervlakte').val() > 5) {
                        var koers = 20;
                    } else if($('#oppervlakte').val() > 2) {
                        var koers = 20;
                    } else if($('#oppervlakte').val() > 0.5) {
                        var koers = 30;
                    } else if($('#oppervlakte').val() >= 0.2) {
                        var koers = 45;
                    }
                } else if($('#formaat').val() == 'standaard-snij-zonder-snijden') {
                    if($('input[name="type"]:checked').val() != "normaal") {
                        if($('#oppervlakte').val() <= 5) {
                            var koers = 15;
                        } else {
                            var koers = 15;
                        }
                    }
                    else if($('#oppervlakte').val() > 5) {
                        var koers = 15;
                    } else if($('#oppervlakte').val() > 2) {
                        var koers = 15;
                    } else if($('#oppervlakte').val() > 0.5) {
                        var koers = 15;
                    } else if($('#oppervlakte').val() >= 0.2) {
                        var koers = 35;
                    }
                } else if($('#formaat').val() == 'etch') {
                    if($('input[name="type"]:checked').val() != "normaal") {
                        if($('#oppervlakte').val() <= 5) {
                            var koers = 30;
                        } else {
                            var koers = 30;
                        }
                    }
                    else if($('#oppervlakte').val() > 5) {
                        var koers = 30;
                    } else if($('#oppervlakte').val() > 2) {
                        var koers = 33;
                    } else if($('#oppervlakte').val() > 0.5) {
                        var koers = 35;
                    } else if($('#oppervlakte').val() >= 0.2) {
                        var koers = 50;
                    }
                } else if($('#formaat').val() == 'banner') {
                    if($('input[name="type"]:checked').val() != "normaal") {
                        if($('#oppervlakte').val() <= 5) {
                            var koers = 25;
                        } else {
                            var koers = 25;
                        }
                    }
                    else if($('#oppervlakte').val() > 5) {
                        var koers = 25;
                    } else if($('#oppervlakte').val() > 2) {
                        var koers = 25;
                    } else if($('#oppervlakte').val() > 0.5) {
                        var koers = 30;
                    } else if($('#oppervlakte').val() >= 0.2) {
                        var koers = 35;
                    }
                } else if($('#formaat').val() == 'poster') {
                    if($('input[name="type"]:checked').val() != "normaal") {
                        if($('#oppervlakte').val() <= 5) {
                            var koers = 20;
                        } else {
                            var koers = 20;
                        }
                    }
                    else if($('#oppervlakte').val() > 5) {
                        var koers = 20;
                    } else if($('#oppervlakte').val() > 2) {
                        var koers = 20;
                    } else if($('#oppervlakte').val() > 0.5) {
                        var koers = 20;
                    } else if($('#oppervlakte').val() >= 0.2) {
                        var koers = 30;
                    }
                } else if($('#formaat').val() == 'one-way') {
                    if($('input[name="type"]:checked').val() != "normaal") {
                        if($('#oppervlakte').val() <= 5) {
                            var koers = 45;
                        } else {
                            var koers = 45;
                        }
                    }
                    else if($('#oppervlakte').val() > 5) {
                        var koers = 50;
                    } else if($('#oppervlakte').val() > 2) {
                        var koers = 50;
                    } else if($('#oppervlakte').val() > 0.5) {
                        var koers = 55;
                    } else if($('#oppervlakte').val() >= 0.2) {
                        var koers = 60;
                    }
                } else if($('#formaat').val() == 'wrap') {
                    if($('input[name="type"]:checked').val() != "normaal") {
                        var koers = 60;
                    }
                    else if($('#oppervlakte').val() > 5) {
                        var koers = 60;
                    } else if($('#oppervlakte').val() > 2) {
                        var koers = 65;
                    } else if($('#oppervlakte').val() > 0.5) {
                        var koers = 70;
                    } else if($('#oppervlakte').val() >= 0.2) {
                        var koers = 75;
                    }
                } else if($('#formaat').val() == 'magneet') {
                    if($('input[name="type"]:checked').val() != "normaal") {
                        if($('#oppervlakte').val() <= 5) {
                            var koers = 30;
                        } else {
                            var koers = 25;
                        }
                    }
                    else if($('#oppervlakte').val() > 5) {
                        var koers = 30;
                    } else if($('#oppervlakte').val() > 2) {
                        var koers = 30;
                    } else if($('#oppervlakte').val() > 0.5) {
                        var koers = 35;
                    } else if($('#oppervlakte').val() >= 0.2) {
                        var koers = 40;
                    }
                }
                // if($('input:checkbox[name=checkbox]').prop("checked")) {
                // 	if($('#oppervlakte').val() <= 5) {
                // 		var koers = 70;
                // 	} else {
                // 		var koers = 65;
                // 	}
                // }
                if($('#oppervlakte').val() != '' && $('#aantal').val() != '' && $('#oppervlakte').val() >= 0.2 ) {
                    var opp = parseInt($('#oppervlakte').val());
                    var aantal = parseInt($('#aantal').val());
                    var output = koers * aantal;
                    // $('#prijsid').text(output+',-');

                    // Prijs is SRD
                    $('.prijs').attr('value', output+',-');

                    // Prijs is USD
                    var berekening_usd = Math.round((output / usd) * 100) / 100;
                    $('.prijs_usd').attr('value', berekening_usd +',-');

                    // Prijs is Euro
                    var berekening_euro = Math.round((output / euro) * 100) / 100;
                    $('.prijs_euro').attr('value', berekening_euro +',-');

                } else {
                    $('.prijs').attr('value', '');
                }
                if($('#formaat').val() == '') {
                    $('.prijs').attr('value', '');
                }
            })
        })
    })


</script>