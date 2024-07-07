use strict;
use warnings;
use HTTP::Tiny;
use HTML::TreeBuilder;
use FindBin;
use lib "$FindBin::Bin/../lib";
use currency;

exit main();

sub main{
    my $http = HTTP::Tiny->new();
    my $response = $http->get('https://www.x-rates.com/table/?from=EUR&amount=1');
    my $html_content = $response->{content};
    
    my $tree = HTML::TreeBuilder->new();
    
    $tree->parse($response->{content});

    my @exchange_rates = $tree->look_down('_tag', 'tr');

    my @currencies;

    for my $rate (@exchange_rates) {

        my @cells = $rate->look_down('_tag', 'td');

        my $name = "";
        my $one_eur = -1.0;
        my $inv_one_eur = -1.0;

        if(defined($cells[0])){
            $name = $cells[0]->as_text;
        }

        if(defined($cells[1])){
            $one_eur = $cells[1]->look_down('_tag', 'a')->as_text;
        }

        if(defined($cells[2])){
            $inv_one_eur = $cells[1]->look_down('_tag', 'a')->as_text;
        }

        my $currency = new Currency($name, $one_eur, $inv_one_eur);

        push @currencies, $currency;

        print "$name;$one_eur;$inv_one_eur\n"; 
    }
}