{
	s = $0;
	# 共通 パラメータ除去
	if(match(s, /\?[^\"].*\"/) != 0) {
		gsub(/\?[^\"].*\"/, "\"", s);
	}
	# 共通 パラメータ除去
	if(match(s, /\?[^']*'/) != 0) {
		gsub(/\?[^']*'/, "'", s);
	}
	# 千葉_リゾートイン banner
	if(index(page, "千葉_リゾートイン") != 0 && match(s, /bannerAD\[[0-9]*\]='[^']*';/) != 0) {
		gsub(/bannerAD\[[0-9]*\]='[^']*';/, "", s);
	}
	# 千葉_MyRoom slide-img
	if(index(page, "千葉_MyRoom") != 0 && match(s, /<span class=\"slide-img\"><img[^>]*> <\/span>/) != 0) {
		gsub(/<span class=\"slide-img\"><img[^>]*> <\/span>/, "<span class=\"slide-img\"></span>", s);
	}
	
	printf("%s\n", s);
}
