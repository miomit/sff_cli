import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:sff_lib/sff_lib.dart';
import 'package:crypto/crypto.dart';

class ChecksumCommand extends Command<String> {
  final _hashMethods = {
    "md5": md5,
    "sha1": sha1,
    "sha224": sha224,
    "sha256": sha256,
    "sha384": sha384,
    "sha512": sha512,
    "sha512224": sha512224,
    "sha512256": sha512256,
  };

  ChecksumCommand() {
    argParser.addOption(
      'file',
      help: 'Path to file',
    );
    argParser.addOption(
      'hm',
      allowed: [..._hashMethods.keys],
      defaultsTo: "sha1",
      help: "Hash Method",
    );
  }

  @override
  String get name => 'Checksum';

  @override
  String get description => 'Checksum';

  @override
  List<String> get aliases => ['cs'];

  @override
  FutureOr<String>? run() async {
    if (argResults?["file"] case String path) {
      final file = File(path);

      if (file.existsSync()) {
        final hashMethod = _hashMethods[argResults?["hm"]] ?? sha1;
        print(await generateHashFile(file, hashMethod));
        return "ok";
      } else {
        throw "File does not exist";
      }
    }
    return "";
  }
}
