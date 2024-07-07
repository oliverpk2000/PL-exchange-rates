package Currency;

use strict;
use warnings;

sub new {
    my $class = shift;
    my $self = {
        name => shift,
        one_eur => shift,
        inv_one_eur => shift,
    };
    bless $self, $class;
    return $self;
}

sub get_name {
    my ($self) = @_;
    return $self->{name};
}

sub get_one_eur {
    my ($self) = @_;
    return $self->{one_eur};
}

sub get_inv_one_eur {
    my ($self) = @_;
    return $self->{inv_one_eur};
}

# why is this necessary

1;