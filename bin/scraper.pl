#!/usr/local/bin/perl

use strict;
use warnings;
use HTTP::Tiny;
use HTML::TreeBuilder;
use DateTime;
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
        my $datetime = DateTime->now;

        if(defined($cells[0])){
            $name = $cells[0]->as_text;
        }

        if(defined($cells[1])){
            $one_eur = $cells[1]->look_down('_tag', 'a')->as_text;
        }

        if(defined($cells[2])){
            $inv_one_eur = $cells[2]->look_down('_tag', 'a')->as_text;
        }

        my $currency = new Currency($name, $one_eur, $inv_one_eur, $datetime);

        push @currencies, $currency unless ((($name cmp "") == 0) || ($one_eur == -1) || ($inv_one_eur == -1.0));
    }

    my @data = @currencies;
    
    mkdir "data" unless(-d "data" );

    #if data.csv doesn't exist, create it, otherwise append the data
    unless(-e "data/data.csv"){
        my $file;
        open($file, ">data/data.csv")||die("Cannot open file:".$!);

        print $file "name;one_eur;inv_one_eur;timestamp;\n";

        close($file);
    }
    
    my $file;


    open $file, '>>:encoding(utf8)', 'data/data.csv' or die "cannot append to file /data.csv $!";        

    foreach my $currency_data (@data) {
        my $row = $currency_data->get_as_csv_string;
        print $file "$row\n";
    }
    close $file;

    return 0;

}