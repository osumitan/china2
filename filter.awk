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
	# 鎌取_瑠夏 meta
	if(index(page, "鎌取_瑠夏") != 0 && match(s, /<meta.*\/>/) != 0) {
		gsub(/<meta.*\/>/, "", s);
	}
	# 鎌取_瑠夏 url
	if(index(page, "鎌取_瑠夏") != 0 && match(s, /\"https:\/\/static\.parastorage\.com\/.*\"/) != 0) {
		gsub(/\"https:\/\/static\.parastorage\.com\/.*\"/, "\"\"", s);
	}
	# 鎌取_瑠夏 url
	if(index(page, "鎌取_瑠夏") != 0 && match(s, /'https:\/\/static\.parastorage\.com\/.*'/) != 0) {
		gsub(/'https:\/\/static\.parastorage\.com\/.*'/, "\"\"", s);
	}
	# 鎌取_瑠夏 script serviceTopology
	if(index(page, "鎌取_瑠夏") != 0 && match(s, /var serviceTopology = .*$/) != 0) {
		gsub(/var serviceTopology = .*$/, "", s);
	}
	# 鎌取_瑠夏 script rendererModel
	if(index(page, "鎌取_瑠夏") != 0 && match(s, /var rendererModel = .*$/) != 0) {
		gsub(/var rendererModel = .*$/, "", s);
	}
	# 鎌取_瑠夏 script NREUM
	if(index(page, "鎌取_瑠夏") != 0 && match(s, /try \{window\.NREUM.*$/) != 0) {
		gsub(/try \{window\.NREUM.*$/, "", s);
	}

	
	printf("%s\n", s);
}

