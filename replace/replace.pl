#! /usr/bin/perl
#
#  replace pattern by new_pat for inside given files
#  usage : replace pattern new_pat <filename 1> ... <filename n>

$pattern = shift;
$new_pat = shift;

if (($pattern eq "-h") or ($pattern eq "--help") or (@ARGV[0] eq ""))  {
    print "\n  usage   : replace pattern new_pat <filename 1> ... <filename n>\n";
    print   "  example : replace  toto    titi    foo*.c\n";
    print   "      will replace every occurence of toto by titi in the files foo*.c\n\n";
    exit;
}

print "applying s/$pattern/$new_pat/g ...\n";

foreach $file (@ARGV) {
    rename $file,"$file.bak" or die ("\n ERROR : Can't open $file: $!\n");
    open(FILE,"$file.bak");
    open(NEW,">$file");

    $change = 0;
    while (<FILE>) {
        $change += s/$pattern/$new_pat/g;
        print NEW;
    }
    print "$change change(s) made in $file\n";
    close FILE;
    close NEW;
}
