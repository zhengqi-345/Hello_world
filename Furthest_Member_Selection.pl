#!/usr/bin/perl

BEGIN{unshit @INC, "/path/to/PhyTree.pm"};

use warnings;
use strict;
use POSIX qw(strftime);
use Filename::Basename;
use Getopt::Std;
use vars qw($opt_i $opt_o $opt_d);
getopts('i:o:d:');

use PhyTree; ##use personel perl module

if( $opt_i && $opt_o && $opt_d){
    print " Input: $opt_i\n";
    print "Output: $opt_o\n";
    print strftime(" Start: %Y-%m-%d %H:%M:%S\n",localtime(time));
    
    open FILE, "<$opt_i" or die "Can not open the file:$!";
    #PhyTree
    my %hash=PhyTree::fasta_db("$opt_d");
    
    print strftime("   End: %Y-%m-%d %H-%M-%S\n",localtime(time));
}else{
    &usage;
}

sub usage{
    die(
        qq!
        Usage: perl Furthest_Member_Selection.pl [ -i Input_file ] [ -o Output_file ]
    Arguments: -i Input file name. File type is the output of blastp with "outfmt 6" (Required)
               -o Output file name. File name provided is to store the selected members' sequences(Required).
      Version: V1.0
      \n!
    )
}
