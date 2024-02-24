#!/usr/bin/env perl

=pod

=head1 Using the script for create hosts for Check Point R80.x mgmt_cli
#===============================================================================
#
#         FILE: add_host_xlsx_R80.pl
#
#        USAGE: $ sudo dnf install perl-App-cpanminus
#        		$ cpanm Spreadsheet::ParseExcel Spreadsheet::XLSX Spreadsheet::Read
#
#               $./add_host_xlsx_R80.pl in_hosts.xlsx
#
#		$ cat ./add_host_R80.txt'
#		  add host name "comp01.domain.net" ip-address 10.1.1.1 --version 1.3 --format json
#		  add host name "comp02.domain.net" ip-address 10.2.2.2 --version 1.3 --format json
#		  add host name "comp03.domain.net" ip-address 10.3.3.3 --version 1.3 --format json
#		  add host name "comp04.domain.net" ip-address 10.4.4.4 --version 1.3 --format json
#
#  DESCRIPTION: Create hosts for Check Point R80.x mgmt_cli
#
#      OPTIONS: ---
# REQUIREMENTS: Perl v5.14+ 
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Vladislav Sapunov 
# ORGANIZATION:
#      VERSION: 1.0
#      CREATED: 13.02.2024 22:22:08
#     REVISION: ---
#===============================================================================
=cut

use strict;
use warnings;
use v5.14;
use utf8;
use Spreadsheet::Read;

#use Data::Dumper; # for debug
my $inHosts = $ARGV[0];

# Source XLSX File with fqdn & IP adresses
my $workbook = ReadData($inHosts) or die "Couldn't Open file " . "$!\n";

# Result outFile for mgmt_cli
my $outFile     = 'add_host_R80.txt';
my $addHostName = "add host name";
my $ipAddress   = "ip-address";
my $version     = "--version 1.3";
my $format      = "--format json";

# Open result outFile for writing
open( FHW, '>', $outFile ) or die "Couldn't Open file $outFile" . "$!\n";

for ( 1 .. 10 ) {
    #say "$workbook->[1]{cell}[2][$_]" . " " . "$workbook->[1]{cell}[1][$_]";
    say FHW "$addHostName" . " " . "\"" . "$workbook->[1]{cell}[1][$_]" . "\"" . " " . "$ipAddress" . " " . "\"" . "$workbook->[1]{cell}[2][$_]" ."\"" . " " ."$version" . " " . "$format";
}

# Close the filehandle
close(FHW) or die "$!\n";

say "**********************************************************************************\n";
say "Host TXT file: $outFile created successfully!";

my $cpUsage = <<__USAGE__;

***************************************************************************************
* # Create the actual object
* > add host name "comp01.domain.net" ip-address 10.1.1.1 --version 1.3 --format json
* > add host name "comp02.domain.net" ip-address 10.2.2.2 --version 1.3 --format json
* > add host name "comp03.domain.net" ip-address 10.3.3.3 --version 1.3 --format json
* > add host name "comp04.domain.net" ip-address 10.4.4.4 --version 1.3 --format json
* > add host name "comp05.domain.net" ip-address 10.5.5.5 --version 1.3 --format json
* > add host name "comp06.domain.net" ip-address 10.6.6.1 --version 1.3 --format json
* > add host name "comp07.domain.net" ip-address 10.7.7.7 --version 1.3 --format json
* > add host name "comp08.domain.net" ip-address 10.8.8.8 --version 1.3 --format json
* > add host name "comp09.domain.net" ip-address 10.9.9.9 --version 1.3 --format json
* > add host name "comp10.domain.net" ip-address 10.10.10.10 --version 1.3 --format json
* #				
***************************************************************************************

__USAGE__

say $cpUsage;

