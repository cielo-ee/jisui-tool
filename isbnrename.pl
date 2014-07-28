#!/usr/bin/perl

use strict;
use warnings;

use PDF::API2;

my ($pdffile,$isbnfile) = @_;


my $source = PDF::API2->open($pdffile);

open my $fh, '<', $isbnfile or die "Cannot open $isbnfile :$!";

my @lines = <$fh>;

my $pagecount = $source->pages();
my $bookcount = $pagecount / 3;

my $bookcount2 = @lines;
if($bookcount2 != $bookcount2){ die "Invalid file!\n"};



for(1..$bookcount){
		my $pdf = PDF::API2->new();
		$pdf->import_page($source,$_ * 3 -2 , 1);
		$pdf->import_page($source,$_ * 3 -1 , 2);
		$pdf->import_page($source,$_ * 3    , 3);
		$pdf->preferences(
				-twocolumnright => 1,
				);
		
		$pdf->saveas("$lines[$_].pdf");
}



