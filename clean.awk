{
	area  = $1;
	shop  = $2;
	frame = $6;
	printf("%s/clean.sh %s %s %s %s\n", home, logdir, area, shop, "top");
	printf("%s/clean.sh %s %s %s %s\n", home, logdir, area, shop, "staff");
	if(frame != ".") {
		printf("%s/clean.sh %s %s %s %s\n", home, logdir, area, shop, "frame");
	}
}

