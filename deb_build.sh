mkdir build
mkdir -p ./deb/usr/bin 

rm ./build/sff.deb
rm ./deb/usr/bin/sff 

dart compile exe ./bin/sff_cli.dart -o ./deb/usr/bin/sff

dpkg-deb --build ./deb/ ./build/sff.deb