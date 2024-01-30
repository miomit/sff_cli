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

## Additional information

This utility is under development. With each new version, a new feature will be added.