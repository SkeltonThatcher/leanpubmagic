if [ ! -f "$LEANPUB_GIT_DIR/manuscript/Subset.txt" ];
	then
		echo -e "\nThe required 'Subset.txt' file is missing from the manuscript, cannot create partial sample, exiting.\n"
		exit 1
fi

curl -d "api_key=$LEANPUB_API_KEY" https://leanpub.com/$LEANPUB_BOOK_NAME/preview/subset.json 
