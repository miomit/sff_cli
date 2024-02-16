import 'dart:async';
import 'dart:io';

import 'package:path/path.dart' show extension;
import 'package:args/command_runner.dart';
import 'package:sff_lib/sff_lib.dart';

import '../helper/file_print.dart';

class FindDuplicatesCommand extends Command<String> {
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

  FindDuplicatesCommand() {
    argParser.addFlag('cfe', help: 'additional check of the file contents');
    argParser.addOption('format',
        allowed: [..._fileFormats.keys], defaultsTo: "all");
    argParser.addOption('dir', help: 'Directory where to start the find');
  }

  @override
  String get name => 'findDuplicates';

  @override
  String get description => 'Find duplicates';

  @override
  List<String> get aliases => ['fd'];

  @override
  FutureOr<String>? run() {
    if (argResults?["dir"] case String path) {
      final dir = Directory(path);
      if (dir.existsSync()) {
        findDuplicates(
          [dir],
          filter: _fileFormats[argResults?["format"]],
        ).listen((event) {
          if (argResults!.wasParsed("cfe")) {
            compareFilesEquality(event.$1, event.$2).then((isEq) {
              if (isEq) {
                printDuoFilePath(event);
              }
            });
          } else {
            printDuoFilePath(event);
          }
        });
        return "ok";
      } else {
        throw "This directory does not exist";
      }
    }
    return "";
  }
}
