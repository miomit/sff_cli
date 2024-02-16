import 'package:args/command_runner.dart';

import 'cmd/compare_files_equality_command.dart';
import 'cmd/find_duplicates_command.dart';
import 'cmd/sync_dir_command.dart';
import 'cmd/copy_dir_command.dart';

void main(List<String> args) async {
  final runner =
      CommandRunner<String>('sff', 'Easy work with files/directories')
        ..addCommand(FindDuplicatesCommand())
        ..addCommand(SyncDirCommand())
        ..addCommand(CompareFilesEqualityCommand())
        ..addCommand(CopyDirCommand());

  try {
    if (await runner.run(args) == null) {
      print(runner.usage);
    }
  } catch (e) {
    print(e);
  }
}
