#!/usr/bin/perl

use strict;
use warnings;

use PDF::API2;

my $filename = shift;

my $pdf = PDF::API2->new();
my $source = PDF::API2->open($filename);

my $pagecount = $source->pages();
my $bookcount = $pagecount / 2;


#rotate page
for(1..$bookcount){
#		my $page = $source->openpage($_);
		my $page = $pdf->import_page($source,$_ * 2 -1, 0);

		$page->rotate(270);
		$page = $pdf->import_page($source,    $_ * 2  , 0);
		$page->rotate(270);
		$page = $pdf->import_page($source,$_ * 2 -1, 0);
		$page->rotate(270);
}


$pdf->saveas("newpdf.pdf");


