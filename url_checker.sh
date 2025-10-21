#!/bin/bash
infile=${1:-urls.txt}              
while IFS= read -r url; do          #read each url and check its status 
  [ -z "$url" ] && continue         #skip empty lines
  code=$(curl -o /dev/null -s -w "%{http_code}" "$url")     #get http status code
  if [ "$code" = "200" ]; then          #print the url if the status is 200
    echo "[OK] $url"
  else
    echo "[FAIL $code] $url"
  fi
done < "$infile"

