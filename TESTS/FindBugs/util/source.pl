#!/usr/bin/perl
# Copying and condensing source ready for review in 
# findbugs GUI

use File::Copy;
use File::Find;

my $root="/home/alan/Desktop/SAKIOAE/GIT/nakamura"; # Location of source
my $target="/home/alan/Desktop/SAKIOAE/src"; # Where to put Java files.

# Where can we find Java files, pattern becomes more complex over time
my $filter="main/java/"; 
my @parts;

print "Copying and condensing source ready for htmlzing\n";
mkdir("$target", 0755);
mkdir("$target", 0755);
find (\&wanted, $root);

sub wanted{
@parts=split(/$filter/,$File::Find::name);
    if ((-d $_)&&($parts[1] ne "")){
        if (!(-d "$target/$parts[1]" )){
        mkdir("$target/$parts[1]", 0755);
        }
    }else{
        if ($_=~/.java$/){
            copy($File::Find::name,"$target/$parts[1]") or print "Naming convention error: File cannot be copied.\n[$File::Find::name]";
        }
    }
}

