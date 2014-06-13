OS=`uname -s`
case $OS in
  Darwin)
	# MacOSX 10.9.3 (at least) has deprecated the -r option to cp, preserved for compatibility - RT 13/06/2014
	# So we use rsync instead
	rsync -auv $LEANPUB_GIT_DIR/manuscript $DROPBOX_DIR/$LEANPUB_BOOK_NAME/ ;;
  Linux)
	# Linux cp, i.e. from GNU Coreutils 
	cp -pru $LEANPUB_GIT_DIR/manuscript/ $DROPBOX_DIR/$LEANPUB_BOOK_NAME/ ;;
  *)
	echo -e "\nUnable to determine *nix variant, so we bailed out.\n"
	exit 1
esac
