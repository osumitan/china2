{
	area  = $1;
	shop  = $2;
	url   = $3;
	top   = $4;
	staff = $5;
	frame = $6;
	enc   = $7;
	printf("echo %s %s\n", area, shop);
	# top
	fn_top = sprintf("%s/%s_%s_top_%s", logdir, area, shop, dt);
	printf("wget -O %s.tmp %s%s 2>/dev/null\n", fn_top, url, top);
	printf("cat %s.tmp | iconv -f %s -t utf-8 -c | gawk -f %s/filter.awk -v page=\"%s\" > %s.html\n", fn_top, enc, homedir, fn_top, fn_top);
	printf("rm -f %s.tmp\n", fn_top);
	# staff
	fn_staff = sprintf("%s/%s_%s_staff_%s", logdir, area, shop, dt);
	printf("wget -O %s.tmp %s%s 2>/dev/null\n", fn_staff, url, staff);
	printf("cat %s.tmp | iconv -f %s -t utf-8 -c | gawk -f %s/filter.awk -v page=\"%s\" > %s.html\n", fn_staff, enc, homedir, fn_staff, fn_staff);
	printf("rm -f %s.tmp\n", fn_staff);
	# frame
	if(frame != ".") {
		fn_frame = sprintf("%s/%s_%s_frame_%s", logdir, area, shop, dt);
		printf("wget -O %s.tmp %s%s 2>/dev/null\n", fn_frame, url, frame);
		printf("cat %s.tmp | iconv -f %s -t utf-8 -c | gawk -f %s/filter.awk -v page=\"%s\" > %s.html\n", fn_frame, enc, homedir, fn_frame, fn_frame);
		printf("rm -f %s.tmp\n", fn_frame);
	}
}

