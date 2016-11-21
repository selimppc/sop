
<script>
    $(document).ready(function() {

        // koersen
        var usd = $("#usd").val();
        var euro = $("#euro").val();

        $('.container ,.form-control').on('click change keyup', function() {

            var lengte = parseInt($('#lengte').val());
            var breedte = parseInt($('#breedte').val());
            var oppervlakte = lengte * breedte;
            $('#oppervlakte').val(oppervlakte);

            if ($('#soort').val() == 'snij' || $('#soort').val() == 'print') {
                if($('#oppervlakte').val() <= 60) {
                    var koers = 11.5;
                } else if($('#oppervlakte').val() <= 100) {
                    var koers = 17.5;
                } else if($('#oppervlakte').val() <= 200) {
                    var koers = 33.5;
                } else if($('#oppervlakte').val() <= 300) {
                    var koers = 47;
                } else if($('#oppervlakte').val() <= 400) {
                    var koers = 58.5;
                } else if($('#oppervlakte').val() <= 500) {
                    var koers = 68.5;
                } else if($('#oppervlakte').val() <= 600) {
                    var koers = 76;
                } else if($('#oppervlakte').val() <= 700) {
                    var koers = 81.5;
                } else if($('#oppervlakte').val() <= 800) {
                    var koers = 85;
                } else if($('#oppervlakte').val() <= 900) {
                    var koers = 86.5;
                } else if($('#oppervlakte').val() <= 1100) {
                    var koers = 94.5;
                } else if($('#oppervlakte').val() <= 1500) {
                    var koers = 113.5;
                } else if($('#oppervlakte').val() <= 1750) {
                    var koers = 114.5;
                } else if($('#oppervlakte').val() <= 2000) {
                    var koers = 120;
                }
            } else if($('#soort').val() == 'reflecterend' || $('#soort').val() == 'chromen' || $('#soort').val() == 'fluorecent' || $('#soort').val() == 'etch') {
                if($('#oppervlakte').val() <= 60) {
                    var koers = 23;
                } else if($('#oppervlakte').val() <= 100) {
                    var koers = 35;
                } else if($('#oppervlakte').val() <= 200) {
                    var koers = 67;
                } else if($('#oppervlakte').val() <= 300) {
                    var koers = 94;
                } else if($('#oppervlakte').val() <= 400) {
                    var koers = 117;
                } else if($('#oppervlakte').val() <= 500) {
                    var koers = 137;
                } else if($('#oppervlakte').val() <= 600) {
                    var koers = 152;
                } else if($('#oppervlakte').val() <= 700) {
                    var koers = 163;
                } else if($('#oppervlakte').val() <= 800) {
                    var koers = 170;
                } else if($('#oppervlakte').val() <= 900) {
                    var koers = 173;
                } else if($('#oppervlakte').val() <= 1100) {
                    var koers = 189;
                } else if($('#oppervlakte').val() <= 1500) {
                    var koers = 227;
                } else if($('#oppervlakte').val() <= 1750) {
                    var koers = 229;
                } else if($('#oppervlakte').val() <= 2000) {
                    var koers = 240;
                }
            }
            if($('#oppervlakte').val() && $('#aantal').val() != '') {
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