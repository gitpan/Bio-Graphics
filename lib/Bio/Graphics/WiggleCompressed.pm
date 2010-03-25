package Bio::Graphics::WiggleCompressed;

use strict;
use warnings;

use IO::Compress::Gzip;
use IO::Uncompress::Gunzip;
use base 'Bio::Graphics::Wiggle';

sub new_fh {
    my $self = shift;
    my ($path,$mode) = @_;
    $path ||= IO::File->new_tmpfile;
    if ($mode eq '+<' or $mode eq '+>') { # writable
	return IO::Compress::Gzip->new($path);
    } else {
	return IO::Uncompress::Gunzip->new($path);
    }
}

1;
