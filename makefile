build:
	@mkdir build
	@exec dart pub get
	@exec dart compile exe bin/sff.dart -o build/sff

package: build
	@mkdir .temp
	@mkdir -p .temp/usr/bin & mkdir -p .temp/usr/share/sff
	@cp build/sff .temp/usr/bin/ & cp build/sff .temp/usr/share/sff/
	@mkdir ./.temp/DEBIAN
	@echo "Package: sff" >> ./.temp/DEBIAN/control
	@echo "Priority: optional " >> ./.temp/DEBIAN/control
	@echo "Section: shells " >> ./.temp/DEBIAN/control
	@echo "Maintainer: Harry " >> ./.temp/DEBIAN/control
	@echo "Architecture: all " >> ./.temp/DEBIAN/control
	@echo "Version: 1.0 " >> ./.temp/DEBIAN/control
	@echo "Depends: " >> ./.temp/DEBIAN/control
	@echo "Description: simple makefile"  >> ./.temp/DEBIAN/control
	@chmod +x .temp/usr/bin/sff
	@dpkg -b .temp build/sff.deb
	@sudo rm -r .temp
	@echo "Done!"

install:
	@install -d $(DESTDIR)/usr/share/sff/
	@install -d $(DESTDIR)/usr/bin
	@install -v -m 755 build/sff $(DESTDIR)/usr/bin/
    
remove:
	@echo "Removing..."
	@rm -rf $(DESTDIR)/usr/share/sff
	@rm -rf $(DESTDIR)/usr/bin/sff
	@echo "Done!"