use strict;
use warnings FATAL => 'all';
use JSON::XS;
use Data::Dumper;

my $json_text = '["some", "another"]';

my @perl_scalar = JSON::XS->new->utf8->decode ($json_text);

# $perl_scalar = ["it", "another"];

my $value = "'another'";

if (grep ( /^$value$/, @perl_scalar )) {
    print "fund"
} else {
    print "Not found"
}

print Dumper(@perl_scalar);
