import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:path/path.dart';
import 'package:sff_lib/sff_lib.dart';

class CopyDirCommand extends Command<String> {
  final _fileFormats = {
    'all': (_) => true,
    'img': (path) => [
          '.jpeg',
          '.jpg',
          '.png',
          '.webp',
          '.gif',
          '.raw',
          '.tiff',
          '.psd'
        ].contains(extension(path)),
    'vector': (path) =>
        ['.svg', '.esp', '.pdf', '.ai', '.cdr'].contains(extension(path)),
    'video': (path) => ['.avi', '.mkv', '.mp4', '.mpeg', '.ogv', '.webm']
        .contains(extension(path)),
    'audio': (path) => ['.m4a', '.mp3', '.wav', '.ogg', '.mpa', '.flac']
        .contains(extension(path)),
    'doc': (path) => ['.pdf', '.djvy', '.doc', '.docx', '.txt', '.md']
        .contains(extension(path)),
  };

  CopyDirCommand() {
    argParser.addOption('dirin', help: 'Path to directory in');
    argParser.addOption('dirout', help: 'Path to directory out');
    argParser.addFlag('cod', help: 'Copy only directories');
    argParser.addOption('format',
        allowed: [..._fileFormats.keys], defaultsTo: "all");
  }

  @override
  String get name => 'CopyDirRec';

  @override
  String get description => 'Copy Directory Recursive';

  @override
  List<String> get aliases => ['cdr'];

  @override
  FutureOr<String>? run() {
    if (argResults?["dirin"] case String pathIn) {
      if (argResults?["dirout"] case String pathOut) {
        final dirIn = Directory(pathIn);
        final dirOut = Directory(pathOut);

        if (dirIn.existsSync()) {
          copyDirRec(dirIn, dirOut,
                  isCopyFile: !argResults!.wasParsed("cod"),
                  filter: _fileFormats[argResults?["format"]])
              .listen((fl) {
            print(fl);
          });
          return "ok";
        } else {
          throw "Dir1 does not exist";
        }
      }
    }
    return "";
  }
}
