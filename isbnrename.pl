#!/usr/bin/perl

use strict;
use warnings;

use File::Copy;

my ($pdfprefix,$isbnfile) = @_;
#Adobe Acrobatでファイルを分割すると、xxxxx_PartX.pdfというファイルができるので、
#"xxxx_Part"の部分までを入力する

open my $fh,'<',$isbnfile or die "Cannot open $isbnfile:$!";

my @lines = <$fh>;

print my $a = @lines;
print "\n";

close $fh or die "close $isbnfile failed:$!";

my $i = 1;
foreach my $line(@lines){
#		chomp ($line); #cygwin環境だとchompがうまく動かない
		$line =~ s/\x0D?\x0A$//g;
		my $oldFileName = "$pdfprefix$i.pdf";
		my $newFileName = "$line.pdf";
		File::Copy::move($oldFileName, $newFileName) or die "Cannot move $oldFileName to $newFileName";
}

