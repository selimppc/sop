<script>
    $(document).ready(function() {
        //Checkbox functions...
        $('#enkelzijdig').on('click', function() {
            if($('input:checkbox[name=enkelzijdig]').prop("checked")) {
                $('input:checkbox[name=dubbelzijdig]').prop("checked", false);
                $('input:checkbox[name=lamineren]').prop("checked", false);
            } else {
                $('input:checkbox[name=dubbelzijdig]').prop("checked", true);
            }
        });
        $('#dubbelzijdig').on('click', function() {
            if($('input:checkbox[name=dubbelzijdig]').prop("checked")) {
                $('input:checkbox[name=enkelzijdig]').prop("checked", false);
                $('input:checkbox[name=lamineren]').prop("checked", false);
            } else {
                $('input:checkbox[name=enkelzijdig]').prop("checked", true);
            }
        });
        $('#lamineren').on('click', function() {
            if($('input:checkbox[name=lamineren]').prop("checked")) {
                $('input:checkbox[name=enkelzijdig]').prop("checked", false);
                $('input:checkbox[name=dubbelzijdig]').prop("checked", false);
            } else {
                $('input:checkbox[name=dubbelzijdig]').prop("checked", true);
            }
        });

        //Calculation
        $('.container, .form-control').on('click change keyup', function() {
            if($('#laser-card').val() == 'visite') {
                if($('input:checkbox[name=enkelzijdig]').prop("checked")) {
                    var koers = 0.6;
                } else {
                    var koers = 0.75;
                }
            } else if($('#laser-card').val() == 'visite-laminaat') {
                if($('input:checkbox[name=enkelzijdig]').prop("checked")) {
                    var koers = 0.95;
                } else {
                    var koers = 1.1;
                }
            } else if($('#laser-card').val() == 'a3') {
                if($('input:radio[id=150gr]').prop("checked")) {
                    if($('input:checkbox[name=enkelzijdig]').prop("checked")) {
                        var koers = 4;
                    } else {
                        var koers = 7;
                    }
                } else if($("input[type=radio][value=250]:checked")) {
                    if($('input:checkbox[name=enkelzijdig]').prop("checked")) {
                        var koers = 11;
                    } else {
                        var koers = 15;
                    }
                }
            } else if($('#laser-card').val() == 'a4') {
                if($('input:checkbox[name=enkelzijdig]').prop("checked")) {
                    if($('input:radio[id=80gr]').prop("checked")) {
                        var koers = 2;
                    } else if($('input:radio[id=150gr]').prop("checked")) {
                        var koers = 2;
                    } else {
                        var koers = 5.5;
                    }
                } else if($('input:checkbox[name=dubbelzijdig]').prop("checked")) {
                    if($('input:radio[id=80gr]').prop("checked")) {
                        var koers = 3;
                    } else if($('input:radio[id=150gr]').prop("checked")) {
                        var koers = 3.5;
                    } else {
                        var koers = 7.5;
                    }
                } else if($('input:checkbox[name=lamineren]').prop("checked")) {
                    if($('input:radio[id=80gr]').prop("checked")) {
                        var koers = 3;
                    } else if($('input:radio[id=150gr]').prop("checked")) {
                        var koers = 3;
                    } else {
                        var koers = 3;
                    }
                }
            } else if($('#laser-card').val() == 'a5') {
                if($('input:radio[id=150gr]').prop("checked")) {
                    if($('input:checkbox[name=enkelzijdig]').prop("checked")) {
                        var koers = 1;
                    } else {
                        var koers = 2;
                    }
                } else if($("input[type=radio][value=250]:checked")) {
                    if($('input:checkbox[name=enkelzijdig]').prop("checked")) {
                        var koers = 3.5;
                    } else {
                        var koers = 4;
                    }
                }
            } else if($('#laser-card').val() == 'a6') {
                if($('input:radio[id=150gr]').prop("checked")) {
                    if($('input:checkbox[name=enkelzijdig]').prop("checked")) {
                        var koers = 0.75;
                    } else {
                        var koers = 1.25;
                    }
                } else if($("input[type=radio][value=250]:checked")) {
                    if($('input:checkbox[name=enkelzijdig]').prop("checked")) {
                        var koers = 2.5;
                    } else {
                        var koers = 3;
                    }
                }
            } else if($('#laser-card').val() == 'brievenhoofd') {
                var stuks = parseInt($('#stuks').val());
                if(stuks <= 100) {
                    var koers = 200;
                } else if(stuks > 100) {
                    var k_stuks = stuks/100;
                    result = Math.ceil(k_stuks);
                    var koers = result * 200;
                    console.log(result);
                }
            }

            //Validation if Lase Card is brievenhoofd...
            if($('#laser-card').val() == 'brievenhoofd') {
                $('#fr-aantal').hide(400);
                $('#fr-stuks').slideDown(400);
                $('#dubbelzijdig').attr('disabled', '');
                $('#lamineren').attr('disabled', '');
                $('input:checkbox[name=dubbelzijdig]').prop("checked", false);
                $('input:checkbox[name=lamineren]').prop("checked", false);
                $('input:checkbox[name=enkelzijdig]').prop("checked", true);
            } else if($('#laser-card').val() != 'brievenhoofd') {
                $('#fr-aantal').show(400);
                $('#fr-stuks').slideUp(400);
                $('#dubbelzijdig').removeAttr('disabled');
                $('#lamineren').removeAttr('disabled');
            }

            //Validationt to shows radio buttons for grams..
            if($('#laser-card').val() == 'a3' || $('#laser-card').val() == 'a4' || $('#laser-card').val() == 'a5' || $('#laser-card').val() == 'a6') {
                $('.grams').slideDown(400);
            } else {
                $('.grams').fadeOut(400);
            }

            //Validation voor de laminaat checkbox
            if($('#laser-card').val() == 'a4') {
                $('#lamineren').removeAttr('disabled');
            } else {
                $('#lamineren').attr('disabled', '');
            }
            if($('#laser-card').val() != 'a4') {
                $('input:checkbox[name=lamineren]').prop("checked", false);
            }

            //Validation if Laser Card is A4...
            if($('#laser-card').val() == 'a4') {
                $('#80grams').slideDown(400);
            } else {
                $('#80grams').slideUp(400);
            }

            //Prijs
            if($('#aantal').val() != '' && $('#laser-card').val() != '') {
                var aantal = parseInt($('#aantal').val());
                var output = koers * aantal;
                $('.prijs').attr('value', output+',-');
            } else if($('#laser-card').val() == 'brievenhoofd') {
                if($('#stuks').val() != '') {
                    var output = koers;
                    $('.prijs').attr('value', output+',-');
                } else {
                    $('.prijs').attr('value', '');
                }
            }
        })
    })
</script>