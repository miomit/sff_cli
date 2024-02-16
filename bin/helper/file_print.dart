import 'dart:io';

void printDuoFilePath((File, File) files) {
  print("----------\n${files.$1.path}\n${files.$2.path}");
}
