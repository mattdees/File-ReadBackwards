#!/usr/bin/perl

# This test is intended to test taking an existing filehandle and passing it to File::ReadBackwards.

use Test::More tests => 1;
use File::Temp  qw/:seekable/;
use File::ReadBackwards;

my $tmp_file_fh = File::Temp->new();

print ${tmp_file_fh} "first\nsecond\nthird\nlast";

sysseek $tmp_file_fh, 0, SEEK_SET;

my $file_rb_obj = File::ReadBackwards->new($tmp_file_fh);
my $line = $file_rb_obj->readline();
print $line
is($line, $last, 'Last line was read in first when passed an open handle');