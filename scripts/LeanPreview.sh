echo -e "\nGenerating Preview of $LEANPUB_BOOK_NAME..\n"
curl -d "api_key=$LEANPUB_API_KEY" https://leanpub.com/$LEANPUB_BOOK_NAME/preview.json 
echo -e "\n"
