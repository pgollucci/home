#!/bin/sh

while read dog; do
  echo "dog=[$dog]: \c"
  url=
  page=0
  while [ x"$url" == x"" ]; do
    target="http://luckydoganimalrescue.org/adopt/pets?page=$page&order=title&sort=asc"
    url=$(curl -sL $target | grep -w "\"$dog\"" | sed -e 's,.*href="https,https,' -e 's,".*,,' -e 's,\&amp\;,\&,')
    page=$(($page+1))
  done
  echo $url

  $HOME/bin/pdfcrowd.sh "$url" > "$dog.pdf"
done <<EOF
Roscoe
EOF
