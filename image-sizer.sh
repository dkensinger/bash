# f=/Users/davekensinger/Desktop/NYC pics/New York3.jpg

for f in "$@"
do
	# have to use full identify path for Automator shell to see it
	PATH=`/usr/local/bin/identify -format %d "$f"`
	FNAME=`/usr/local/bin/identify -format %f "$f"`
	DIM=`/usr/local/bin/identify -format "%[fx:w/300*2.54]x%[fx:h/300*2.54]cm" "$f"`

	# constructing a new filename -> adding "__" before filename and (DIM) after
	g=${PATH}/__${FNAME}\(${DIM}\).jpg

	# finally - converting the original to a 256 pixel thumbnail with new filename
	/usr/local/bin/convert "$f" -thumbnail 256 "$g"
done