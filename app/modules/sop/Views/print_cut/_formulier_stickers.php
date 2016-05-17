
<script>
    $(document).ready(function() {
        $('.container ,.form-control').on('click change keyup', function() {
            if ($('#soort').val() == 'snij' || $('#soort').val() == 'print') {
                if($('#oppervlakte').val() <= 60) {
                    var koers = 5;
                } else if($('#oppervlakte').val() <= 100) {
                    var koers = 9.5;
                } else if($('#oppervlakte').val() <= 200) {
                    var koers = 12.5;
                } else if($('#oppervlakte').val() <= 300) {
                    var koers = 20;
                } else if($('#oppervlakte').val() <= 400) {
                    var koers = 25;
                } else if($('#oppervlakte').val() <= 500) {
                    var koers = 30;
                } else if($('#oppervlakte').val() <= 600) {
                    var koers = 35;
                } else if($('#oppervlakte').val() <= 700) {
                    var koers = 40;
                } else if($('#oppervlakte').val() <= 800) {
                    var koers = 45;
                } else if($('#oppervlakte').val() <= 900) {
                    var koers = 50;
                } else if($('#oppervlakte').val() <= 1100) {
                    var koers = 55;
                } else if($('#oppervlakte').val() <= 1500) {
                    var koers = 60;
                } else if($('#oppervlakte').val() <= 1750) {
                    var koers = 70;
                } else if($('#oppervlakte').val() <= 2000) {
                    var koers = 75;
                }
            } else if($('#soort').val() == 'reflecterend' || $('#soort').val() == 'chromen' || $('#soort').val() == 'fluorecent' || $('#soort').val() == 'etch') {
                if($('#oppervlakte').val() <= 60) {
                    var koers = 10;
                } else if($('#oppervlakte').val() <= 100) {
                    var koers = 19;
                } else if($('#oppervlakte').val() <= 200) {
                    var koers = 25;
                } else if($('#oppervlakte').val() <= 300) {
                    var koers = 40;
                } else if($('#oppervlakte').val() <= 400) {
                    var koers = 50;
                } else if($('#oppervlakte').val() <= 500) {
                    var koers = 60;
                } else if($('#oppervlakte').val() <= 600) {
                    var koers = 70;
                } else if($('#oppervlakte').val() <= 700) {
                    var koers = 80;
                } else if($('#oppervlakte').val() <= 800) {
                    var koers = 90;
                } else if($('#oppervlakte').val() <= 900) {
                    var koers = 100;
                } else if($('#oppervlakte').val() <= 1100) {
                    var koers = 110;
                } else if($('#oppervlakte').val() <= 1500) {
                    var koers = 120;
                } else if($('#oppervlakte').val() <= 1750) {
                    var koers = 140;
                } else if($('#oppervlakte').val() <= 2000) {
                    var koers = 150;
                }
            }
            if($('#oppervlakte').val() && $('#aantal').val() != '') {
                var opp = parseInt($('#oppervlakte').val());
                var aantal = parseInt($('#aantal').val());
                var output = koers * aantal;
                // $('#prijsid').text(output+',-');
                $('.prijs').attr('value', output+',-');
            } else {
                $('.prijs').attr('value', '');
            }
            if($('#soort').val() == '') {
                // $('#prijsid').text('0,-');
                $('.prijs').attr('value', '');
            }
            if($('#oppervlakte').val() > 2000) {
                $('.prijs').attr('value', '');
            }
        });
    });
</script>