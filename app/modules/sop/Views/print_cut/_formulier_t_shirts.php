<script>

var koers_usd = $("#usd").val();
var koers_euro = $("#euro").val();

    function BerekenTotaal() {
        // Korting Checken, en indien hoger dan 100 advies geven
        var korting = 0;
        var aantal = $('#aantal').val();

        if (aantal <= 5) {
            korting = 0;
        }
        else if (aantal <= 20) {
            korting = 5;
        }
        else if (aantal <= 100) {
            korting = 10;
        }
        else if (aantal > 100){
            korting = 0;
            $('.error').text('Doet u dan liever screenprint, aantal boven 100');
            $('.error').stop().hide().fadeIn(100).delay(2000).fadeOut(400); //fade out after 3 seconds
        }

        $('#korting').text(korting);
        // Korting Checken, en indien hoger dan 100 advies geven

        // Totale prijs van T-shirt bestelling berekenen
        var prijzen = $(".prijs");
        var values = $(".prijs").map(function(){
            return this.value;
        }).get();

        var totaal = 0;

        for(var i=0; i<values.length; i++) {
            // values[i] = values[i];
            totaal += values[i];
        }

        var totaal_shirts = totaal * aantal;

        console.log(values);

        var uiteindelijke_prijs = totaal_shirts - ((totaal_shirts/100) * korting);

        // console.log(uiteindelijke_prijs);

        return uiteindelijke_prijs;

        // Totale prijs van T-shirt bestelling berekenen
    }

    $(document).on('click','#add',function() {
        var div = document.createElement('div');
        div.className = 'locatie';
        div.innerHTML = '<div class="col-xs-10 col-xs-offset-2 separator"></div>\
					        <button id="remove" class="btn btn-danger btn-sm">-</button>\
			 				<div class="form-group ">\
					        	<label for="locatie" class="col-xs-2 control-label">Locatie</label>\
					        	<div class="col-xs-10">\
								    <select id="locatie" class="form-control">\
								      <option value="">Selecteer locatie ...</option>\
								      <option value="mouwen">Mouwen</option>\
								      <option value="borst">Linker/ rechter borst</option>\
								      <option value="achter">Achter</option>\
								      <option value="a4">Achter/ voor - A4</option>\
								      <option value="a5">Achter/ voor - A5</option>\
								      <option value="petten">Petten</option>\
								    </select>\
								</div>\
					        </div>\
					        <div class="form-group">\
					            <label for="lengte" class="col-xs-2 control-label">Lengte</label>\
					            <div class="col-xs-4">\
					                <input type="number" class="form-control" id="lengte" placeholder="Lengte">\
					            </div>\
					            <label for="breedte" class="col-xs-2 control-label">Breedte</label>\
					            <div class="col-xs-4">\
					                <input type="number" class="form-control" id="breedte" placeholder="Breedte">\
					            </div>\
					        </div>\
					        <div class="form-group">\
						        <label for="prijs" class="col-xs-2 control-label">Prijs</label>\
						        <label for="prijs" class="col-xs-1 control-label">SRD</label>\
						        <div class="col-xs-9">\
						            <input type="number" readonly class="prijs" name="prijs" id="prijs" placeholder="0 ,-">\
						        </div>\
						    </div>';

        $('#extra-locatie').append(div);

    });

    $(document).on('click','#remove',function() {
        $(this).parent('div').remove();
        $('#totale_prijs').val(BerekenTotaal());
        $('#totale_prijs_usd').val(Math.round((BerekenTotaal() / koers_usd) * 100) / 100);
        $('#totale_prijs_euro').val(Math.round((BerekenTotaal() / koers_euro) * 100) / 100);
    });

    $(document).ready(function() {
        $('.error').stop().hide();


        $('.container, .form-control').on('change keyup', function() {

            $('#totale_prijs').val(BerekenTotaal());
            $('#totale_prijs_usd').val(Math.round((BerekenTotaal() / koers_usd) * 100) / 100);
            $('#totale_prijs_euro').val(Math.round((BerekenTotaal() / koers_euro) * 100) / 100);

            // Checken als select optie verandert is
            $(document).on('change', '#locatie', function() {
                var value =  $(this).val();
                // console.log($(this).val()); // value van de selected option

                // if you want to do stuff based on the OPTION element:
                var opt = $(this).find('option:selected')[0];
                // use switch or if/else etc.

                // class locatie van de change select
                var top = opt.closest('.locatie');

                var lengte = $(top).find('#lengte');
                var breedte = $(top).find('#breedte');
                var prijs = $(top).find('#prijs');
                var prijs_usd = $(top).find('#prijs_usd');
                var prijs_euro = $(top).find('#prijs_euro');

                // disable lengte en breedte bij A-formaten
                if(value == 'a4' || value == 'a5') {
                    lengte.attr('disabled', '');
                    lengte.val(0);
                    breedte.attr('disabled', '');
                    breedte.val(0);
                } else {
                    lengte.removeAttr('disabled');
                    breedte.removeAttr('disabled');
                }
                // disable lengte en breedte bij A-formaten

                // mouwen validation
                if (value == 'mouwen') {
                    lengte.val(6);
                    breedte.val(3);
                    prijs.val(11.5);
                    prijs_usd.val(Math.round((11.5 / koers_usd) * 100) / 100);
                    prijs_euro.val(Math.round((11.5 / koers_euro) * 100) / 100);
                    lengte.on('change keyup', function(){
                        if(lengte.val() > 6){
                            $('.error').text('lengte maximaal 6 cm - mouwen');
                            $('.error').stop().hide().fadeIn(400).delay(2000).fadeOut(400); //fade out after 3 seconds
                            lengte.val(6);
                        }
                    })

                    breedte.on('change keyup', function(){
                        if(breedte.val() > 3){
                            $('.error').text('breedte maximaal 3 cm - mouwen');
                            $('.error').stop().hide().fadeIn(400).delay(2000).fadeOut(400); //fade out after 3 seconds
                            breedte.val(3);
                        }
                    })
                };
                // mouwen validation


                // linker/rechter borst validation
                if (value == 'borst') {
                    lengte.val(11);
                    breedte.val(3);
                    prijs.val(17.5);
                    prijs_usd.val(Math.round((17.5 / koers_usd) * 100) / 100);
                    prijs_euro.val(Math.round((17.5 / koers_euro) * 100) / 100);
                    lengte.on('change keyup', function(){
                        if(lengte.val() >= 11){
                            $('.error').text('lengte breedte verhouding borst 11x3 - borst');
                            $('.error').stop().hide().fadeIn(400).delay(2000).fadeOut(400); //fade out after 3 seconds
                            lengte.val(11);
                            breedte.val(3);
                            prijs.val(10);
                            prijs_usd.val(Math.round((10 / koers_usd) * 100) / 100);
                            prijs_euro.val(Math.round((10 / koers_euro) * 100) / 100);
                        }
                    })

                    breedte.on('change keyup', function(){
                        if(breedte.val() > 3){
                            $('.error').text('lengte breedte verhouding 10x10 - borst');
                            $('.error').stop().hide().fadeIn(400).delay(2000).fadeOut(400); //fade out after 3 seconds
                            lengte.val(10);
                            prijs.val(33.5);
                            prijs_usd.val(Math.round((33.5 / koers_usd) * 100) / 100);
                            prijs_euro.val(Math.round((33.5 / koers_euro) * 100) / 100);
                        }
                        if(breedte.val() > 10){
                            breedte.val(10);
                            $('.error').text('max breedte 10 - verhouding:10x10');
                            $('.error').stop().hide().fadeIn(400).delay(2000).fadeOut(400); //fade out after 3 seconds
                        }
                    })
                };
                // linker/rechter borst  validation


                // achter validation
                if (value == 'achter') {
                    lengte.val(20);
                    breedte.val(4);
                    prijs.val(47);
                    prijs_usd.val(Math.round((47 / koers_usd) * 100) / 100);
                    lengte.on('change keyup', function(){
                        if(lengte.val() <= 20 && breedte.val() <= 4){
                            prijs.val(47);
                            prijs_usd.val(Math.round((47 / koers_usd) * 100) / 100);
                            prijs_euro.val(Math.round((47 / koers_euro) * 100) / 100);
                        }
                        if(lengte.val() > 20){
                            prijs.val(58.5);
                            prijs_usd.val(Math.round((58.5 / koers_usd) * 100) / 100);
                            prijs_euro.val(Math.round((58.5 / koers_euro) * 100) / 100);
                        }
                        if(lengte.val() > 30){
                            $('.error').text('max lengte 30cm - achter');
                            $('.error').stop().hide().fadeIn(400).delay(2000).fadeOut(400); //fade out after 3 seconds
                            lengte.val(30);
                            prijs.val(58.5);
                            prijs_usd.val(Math.round((58.5 / koers_usd) * 100) / 100);
                            prijs_euro.val(Math.round((58.5 / koers_euro) * 100) / 100);
                        }
                    })

                    breedte.on('change keyup', function(){
                        if(breedte.val() <= 4 && lengte.val() <= 20){
                            prijs.val(47);
                            prijs_usd.val(Math.round((47 / koers_usd) * 100) / 100);
                            prijs_euro.val(Math.round((47 / koers_euro) * 100) / 100);
                        }
                        if(breedte.val() > 6){
                            breedte.val(6);
                            $('.error').text('max lengte 6cm - achter');
                            $('.error').stop().hide().fadeIn(400).delay(2000).fadeOut(400); //fade out after 3 seconds
                        }
                    })
                };
                // achter  validation


                // a4 prijs validation
                if (value == 'a4') {
                    prijs.val(86.5);
                    prijs_usd.val(Math.round((86.5 / koers_usd) * 100) / 100);
                    prijs_euro.val(Math.round((86.5 / koers_euro) * 100) / 100);
                };
                // a4 prijs  validation

                // a5 prijs validation
                if (value == 'a5') {
                    prijs.val(68.5);
                    prijs_usd.val(Math.round((68.5 / koers_usd) * 100) / 100);
                    prijs_euro.val(Math.round((68.5 / koers_euro) * 100) / 100);
                };
                // a5 prijs  validation

                // petten validation
                if (value == 'petten') {
                    lengte.val(10);
                    breedte.val(10);
                    prijs.val(33.5);
                    prijs_usd.val(Math.round((33.5 / koers_usd) * 100) / 100);
                    prijs_euro.val(Math.round((33.5 / koers_euro) * 100) / 100);
                    lengte.on('change keyup', function(){
                        if(lengte.val() > 10){
                            $('.error').text('max lengte 10cm - petten');
                            $('.error').stop().hide().fadeIn(400).delay(2000).fadeOut(400); //fade out after 3 seconds
                            lengte.val(10);
                        }
                    })

                    breedte.on('change keyup', function(){
                        if(breedte.val() > 10){
                            breedte.val(10);
                            $('.error').text('max breedte 10 - petten');
                            $('.error').stop().hide().fadeIn(400).delay(2000).fadeOut(400); //fade out after 3 seconds
                        }
                    })
                };
                // petten  validation

                $('#totale_prijs').val(BerekenTotaal());
                $('#totale_prijs_usd').val(Math.round((BerekenTotaal() / koers_usd) * 100) / 100);
                $('#totale_prijs_euro').val(Math.round((BerekenTotaal() / koers_euro) * 100) / 100);
            });
        });
    });

</script>