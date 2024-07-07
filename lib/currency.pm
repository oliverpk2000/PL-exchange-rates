package Currency;

use strict;
use warnings;

sub new {
    my $class = shift;
    my $self = {
        name => shift,
        one_eur => shift,
        inv_one_eur => shift,
        timestamp => shift,
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

sub get_timestamp {
    my ($self) = @_;
    return $self->{timestamp};
}

sub get_as_csv_string {
    my ($self) = @_;
    my $name = $self->get_name;
    my $one_eur = $self->get_one_eur;
    my $inv_one_eur  = $self->get_inv_one_eur;
    my $timestamp = $self->get_timestamp;

    return "$name;$one_eur;$inv_one_eur;$timestamp;"
}

# why is this necessary

1;