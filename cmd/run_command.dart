import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:sff_lib/sff_lib.dart' show Sff;

class RunCommand extends Command<String> {
  @override
  String get name => 'Run';

  @override
  String get description => 'Run sff config';

  @override
  List<String> get aliases => ['run'];

  @override
  FutureOr<String>? run() async {
    if (argResults?.arguments.length == 1) {
      Sff.runConfigFile(
        argResults!.arguments.first,
      ).listen(
        (fl) {
          print(fl);
        },
      );
      return "ok";
    } else {
      throw "specify the path";
    }
  }
}
