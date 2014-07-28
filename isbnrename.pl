#!/usr/bin/perl

use strict;
use warnings;

use File::Copy;

my ($pdfprefix,$isbnfile) = @_;
#Adobe Acrobat�Ńt�@�C���𕪊�����ƁAxxxxx_PartX.pdf�Ƃ����t�@�C�����ł���̂ŁA
#"xxxx_Part"�̕����܂ł���͂���

open my $fh,'<',$isbnfile or die "Cannot open $isbnfile:$!";

my @lines = <$fh>;

print my $a = @lines;
print "\n";

close $fh or die "close $isbnfile failed:$!";

my $i = 1;
foreach my $line(@lines){
#		chomp ($line); #cygwin������chomp�����܂������Ȃ�
		$line =~ s/\x0D?\x0A$//g;
		my $oldFileName = "$pdfprefix$i.pdf";
		my $newFileName = "$line.pdf";
		File::Copy::move($oldFileName, $newFileName) or die "Cannot move $oldFileName to $newFileName";
}

