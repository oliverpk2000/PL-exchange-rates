use strict;
use warnings;

use HTTP::Tiny;
use HTML::TreeBuilder;

exit main();

sub main{
    my $http = HTTP::Tiny->new();
    my $response = $http->get('https://www.x-rates.com/table/?from=EUR&amount=1');
    my $html_content = $response->{content};
    
    print "$html_content\n";
}