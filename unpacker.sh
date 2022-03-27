if [ -z "$1" ]
then
	echo "usage: unpacker app.apk outputdir (excluding / and .)"
	exit
fi
if [ -z "$2" ]
then
	echo "usage: unpacker app.apk outputdir (excluding / and .)"
	exit
fi
mkdir $2

echo "Unzipping APK..."
unzip $1 -d $2'/app.unzip/'
echo "Unzipping Complete"

echo "Extracting contents with APKTool..."
apktool d $1 -o $2'/app.apktooled/'
echo "APKTool Complete"

echo "Decompiling with JADX..."
jadx -d $(pwd)/$2'/app.jadxdecompiled' $(pwd)/$2'/app.unzip/classes.dex'
echo "Decompiling complete"
