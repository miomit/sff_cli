import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:sff_lib/sff_lib.dart';

class FindDuplicatesCommand extends Command<String> {
  FindDuplicatesCommand() {
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
        findDuplicates(dir).listen((event) { 
          print("----------\n${event.$1.path}\n${event.$1.path}");
        });
        return "ok";
      } else {
        throw "This directory does not exist";
      }
    }
    return null;
  }
}