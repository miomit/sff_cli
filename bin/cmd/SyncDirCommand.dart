import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:sff_lib/sff_lib.dart';

import '../helper/file_print.dart';

class SyncDirCommand extends Command<String> {
  SyncDirCommand() {
    argParser.addOption('dir1', help: 'Path to directory 1');
    argParser.addOption('dir2', help: 'Path to directory 2');
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
            syncDir(dir1, dir2).listen((event) {
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
    return null;
  }
}
