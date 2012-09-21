use 5.10.0;
use strict;
use warnings;

use File::Basename;
use Path::Class;

sub LoadData {
    my $filename = shift;
    my $file = file( dirname(__FILE__), '_data', $filename );
    return scalar( $file->slurp );
}

1;
