#!/usr/bin/perl

use strict;
use warnings;
use CGI;

my $q = CGI->new;
#my $data = $p->param('POSTDATA');


print "Content-type: text/html\n\n";
print "<h1>", time(), "</h1>\n";
print "<div class='data'>\n";

#my @names = $q->param;
#foreach my $name (@names){
#    print "<strong>" . $name . ": </strong><span>" . $q->param($name) . "</span><br>\n";
#}

## this, unfortunately is merely the filename
$q->param('inventoryCSVFile');

## this does not work
#print $q->upload('inventoryCSVFile') . "\n";
open (IN, $q->upload('inventoryCSVFile'));
my $g = join('', <IN>);
close(IN);
print $g . "\n";
#print $q->upload('inventoryCSVFile') . "\n";

# ok y'know what, this is a pain in the arse
# thinking I'm just gonna go full REST and take
# a single JSON object
# oh god. oh wait. this is perl. no json.

# I really hate to have to install node and 6GB of node_modules for this
# ... buhgoddayum ...
# perl is great. CPAN sucks the donkeynut


#if ( my $io_handle = $q->upload('inventoryCSVFile') ) {
#    my $buffer;
#    while ( my $bytesread = $io_handle->read($buffer,1024) ) {
#        print "<pre>" . $buffer . "</pre>";
#    }
#}

print "</div>"
