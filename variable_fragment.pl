#!/usr/bin/perl

# Copy stdin to stdout replacing ${varname} with the contents of varname from
# the environment.  It is an error if varname is not in the environment.

use strict;
use warnings;

while (defined(my $line = <>)) {
	chomp $line;
	my $new = $line;
	while ($new =~ /^(.*)\$\{([^}]+)\}(.*)$/) {
		if (! exists($ENV{$2})) {
			printf(STDERR "Error: Variable '%s' not in environment.\nLocal file %s, line '%s'\n", $2, $ENV{'LOCAL_FILE'}, $line);
			exit 1;
		}
		$new = $1 . $ENV{$2} . $3;
	}
	print $new, "\n";
}
