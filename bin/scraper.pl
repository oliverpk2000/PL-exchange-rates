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

    for my $rate (@exchange_rates) {

        my @data = $rate->look_down('_tag', 'td');

        my $name = $data[0]->as_text;

        my $currency = new Currency("test", 1.0, 1.0);
        print "$name\n"; 
    }

    #print "$html_content\n";
}