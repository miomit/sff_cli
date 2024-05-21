import 'dart:async';
import 'dart:io';

import 'package:path/path.dart' show extension;
import 'package:args/command_runner.dart';
import 'package:sff_lib/sff_lib.dart';

import '../helper/file_print.dart';

class SyncDirCommand extends Command<String> {

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

  SyncDirCommand() {
    argParser.addOption('dir1', help: 'Path to directory 1');
    argParser.addOption('dir2', help: 'Path to directory 2');
    argParser.addOption('format',
        allowed: [..._fileFormats.keys], defaultsTo: "all");
  }

  @override
  String get name => 'SyncDir';

  @override
  String get description => 'Sync 2 Directory';

  @override
  List<String> get aliases => ['sd'];

  @override
  FutureOr<String>? run() {
    if (argResults?["dir1"] case String path1) {
      if (argResults?["dir2"] case String path2) {
        final dir1 = Directory(path1);
        final dir2 = Directory(path2);

        if (dir1.existsSync()) {
          if (dir2.existsSync()) {
            syncDir(dir1, dir2, filter: _fileFormats[argResults?["format"]]).listen((event) {
              printDuoFilePath(event);
            });
            return "ok";
          } else {
            throw "Dir2 does not exist";
          }
        } else {
          throw "Dir1 does not exist";
        }
      }
    }
    return "";
  }
}
