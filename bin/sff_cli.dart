import 'package:args/command_runner.dart';

import 'cmd/CompareFilesEqualityCommand.dart';
import 'cmd/FindDuplicatesCommand.dart';
import 'cmd/SyncDirCommand.dart';

void main(List<String> args) async {
  final runner = CommandRunner<String>('sff', 'Easy work with files/directories')
    ..addCommand(FindDuplicatesCommand())
    ..addCommand(SyncDirCommand())
    ..addCommand(CompareFilesEqualityCommand());

  try {
    if (await runner.run(args) == null) {
      print(runner.usage);
    }
  } catch(e){
    print(e);
  }
}
