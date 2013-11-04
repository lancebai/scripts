# Name: codelite_prj.pl
# the perl script for codelite project file customization
#  -- eliminating files/directories from the pre-set list
#
# Author: Lance Bai

#!/usr/bin/perl
use strict;
use warnings;
use XML::LibXML;

##############################
#directories and files to remove
##############################
my @eliminating_dir=qw(diri_a dir_b dir_c);

my @eliminating_file=qw(file_a.c file_b.c file_c.cpp);


my $filename = $ARGV[0];
my $new_file_name = $ARGV[1];
my $parser = XML::LibXML->new();
my $xmldoc = $parser->parse_file($filename);


#remove directories
for my $dir (@eliminating_dir) {
	my $str_query = ".//VirtualDirectory[contains(\@Name, \"${dir}\")]";
	for my $dead ($xmldoc->findnodes($str_query)) {
		$dead->unbindNode;
	}
}

#remove files
for my $file (@eliminating_file) {
	my $str_query = ".//File[contains(\@Name, \"${file}\")]";
	for my $dead ($xmldoc->findnodes($str_query)) {
    		$dead->unbindNode;
	}
}

#print $xmldoc->toString;
$xmldoc->toFile($new_file_name);
