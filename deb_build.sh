mkdir build

rm ./deb/usr/bin/sff

dart compile exe ./bin/sff_cli.dart -o ./deb/usr/bin/sff

dpkg-deb --build ./deb/ ./build/sff.deb