import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:sff_lib/sff_lib.dart';

import '../helper/file_print.dart';

class CopyDirCommand extends Command<String> {
  CopyDirCommand() {
    argParser.addOption('dirin', help: 'Path to directory in');
    argParser.addOption('dirout', help: 'Path to directory out');
    argParser.addFlag('cod', help: 'Copy only directories');
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
          copyDirRec(dirIn, dirOut, isCopyFile: !argResults!.wasParsed("cod")).listen((event) {
            printDuoFilePath(event);
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
