sub logmsg {
	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
	my $time = sprintf("%4.4d.%2.2d.%2.2d %2.2d:%2.2d.%2.2d",($year+1900), ($mon+1), $mday, $hour, $min, $sec);
	my $msgStr = "$time $dID: ";
	#$cd =~ tr/A-Za-z0-9\ \.\,\"\'\<\>/ /c;
	#$cd =~ s/\s+/ /g;

	$msgStr .= join(" ", @_);
	if ($cd ne $lastcmd) {
		$msgStr .= ": \"$cd\"";
	}
	seek(STDOUT, 0, 2);
	print "$msgStr\n";
	$lastcmd = $cd;
}
1;
