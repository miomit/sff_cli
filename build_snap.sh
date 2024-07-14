make

# sudo chmod +x build/sff

mkdir -p build/org.snap.sff
mkdir -p build/snap

cp build/sff build/org.snap.sff
cp snap/makefile build/org.snap.sff
cp snap/snapcraft.yaml build/snap


cd build/org.snap.sff

tar -zcf ../org.snap.sff.tar.gz . 

cd ..

rm -r org.snap.sff

snapcraft

rm -r snap
rm -r org.snap.sff
rm build/org.snap.sff.tar.gz