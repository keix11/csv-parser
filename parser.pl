#!/usr/bin/perl
#
# This script parse the CSV file
# - usage $ perl parser.pl
#

use strict;
use warnings;
use utf8;
use Encode;

my $file = "testfile.csv";

# Open the file.
open(FH, "<:encoding(cp932)", $file)
    or die("Error occurred when Open the CSV File.");

# Main Method is This.
sub main {

    while (<FH>) {
        my @values = split(/,/, $_);
        my $html   = &convert_to_html(@values);

        print(&encode("UTF-8", $html));
    }

}

# Trim the $value.
sub trim {
    my $string = shift(@_);

    $string =~ s/^\s+//;
    $string =~ s/\s+$//;

    return $string;

}

# @values convert to html.
sub convert_to_html {

    my ($first, $second, $third, $fourth) = @_;
    my $html =               "\t<tr>\n\t\t<td>" .
            $first         . "</td>\n\t\t<td>" .
            $second        . "</td>\n\t\t<td>" .
            $third         . "</td>\n\t\t<td>" .
            &trim($fourth) . "</td>\n\t</tr>\n";

    return $html;

}

&main;


