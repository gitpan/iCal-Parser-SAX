# $Id$
use strict;
use ExtUtils::MakeMaker qw(WriteMakefile prompt);
my @scripts=();
if (prompt('Would you like to install ical2xml, a command line frontend?', 
	   "y") =~ /^y/i) {
    push @scripts,'scripts/ical2xml';
}
if (prompt(q{Would you like to test a remote (http) calendar?
(Requires LWP::UserAgent and may fail if you don't have access
to the internet or the remote file has moved) }, "y") =~ /^y/i) {
    open OUT, '>t/DOHTTP';
    close(OUT);
}
WriteMakefile(
	      'VERSION_FROM' => 'lib/iCal/Parser/SAX.pm',
	      'NAME' => 'iCal::Parser::SAX',
	      ABSTRACT_FROM => 'lib/iCal/Parser/SAX.pm',
	      'EXE_FILES' => [@scripts ],
	      'PREREQ_PM' => {
			      'DateTime' => '0.22',
			      'IO::File' => '1.1',
			      'IO::String' => '1.05',
			      'Test::XML' => '0.06',
			      'iCal::Parser' => '1.01',
			      'Test::More' => '0.47',
			      'XML::SAX::Writer' => '0.44',
			      'XML::SAX::Base' => '1.04'
			     },
	      clean=>{FILES=>'t/DOHTTP'},
	     );
