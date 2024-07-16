```                                 
  .--.--.       ,---,.    ,---,. 
 /  /    '.   ,'  .' |  ,'  .' | 
|  :  /`. / ,---.'   |,---.'   | 
;  |  |--`  |   |   .'|   |   .' 
|  :  ;_    :   :  :  :   :  :   
 \  \    `. :   |  |-,:   |  |-, 
  `----.   \|   :  ;/||   :  ;/| 
  __ \  \  ||   |   .'|   |   .' 
 /  /`--'  /'   :  '  '   :  '   
'--'.     / |   |  |  |   |  |   
  `--'---'  |   :  \  |   :  \   
            |   | ,'  |   | ,'   
            `----'    `----'                            
```                     

Command-line application that implements the functionality of the [sff library](https://github.com/yuraMovsesyan/sff_lib).

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/miomit-sff-cli0)

## Installation
### Install from pub:
`dart pub global activate sff`

### Install from clone:
`dart pub global activate -s path .`

## Usage
```bash
sff <command> [arguments]
```

See `--help` or `-h` for more options.

## Examples

### Synchronization of two directories

```bash
sff sd --dir1 path/to/dir2 --dir2 path/to/dir2
```

### Find duplicate files

```bash
sff fd --dir path/to/dir2
```

### Compare files for equality

```bash
sff cfe --fiel1 path/to/file1 --fiel2 path/to/file2
```

## Contributing

```bash
git clone https://github.com/yuraMovsesyan/sff_cli.git

cd ./sff_cli

dart pub get
dart run ./bin/sff_cli.dart
```

## deb package 
### Build
```bash
make package
```

### Install
```bash
sudo apt install ./build/sff.deb
```

### Remove
```bash
sudo apt remove sff
```

## Additional information

This utility is under development. With each new version, a new feature will be added.