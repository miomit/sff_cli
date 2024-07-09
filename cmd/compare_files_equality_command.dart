import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:sff_lib/sff_lib.dart';

class CompareFilesEqualityCommand extends Command<String> {
  CompareFilesEqualityCommand() {
    argParser.addOption(
      'file1',
      help: 'Path to file 1',
    );
    argParser.addOption(
      'file2',
      help: 'Path to file 2',
    );
  }

  @override
  String get name => 'CompareFilesEquality';

  @override
  String get description => 'Compare 2 files for equality';

  @override
  List<String> get aliases => ['cfe'];

  @override
  FutureOr<String>? run() {
    if (argResults?["file1"] case String path1) {
      if (argResults?["file2"] case String path2) {
        final file1 = File(path1);
        final file2 = File(path2);

        if (file1.existsSync()) {
          if (file2.existsSync()) {
            compareFilesEquality(
              file1,
              file2,
            ).then(
              (value) => print(
                value ? "Files are equal" : "Files are not equal",
              ),
            );
            return "ok";
          } else {
            throw "File2 does not exist";
          }
        } else {
          throw "File1 does not exist";
        }
      }
    }
    return "";
  }
}
