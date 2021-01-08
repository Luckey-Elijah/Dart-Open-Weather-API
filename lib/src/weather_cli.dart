import 'dart:io';
import 'package:args/command_runner.dart';
import 'commands/now.dart';
import 'constants.dart';

Future<void> weatherCli(List<String> args) async {
  final runner = CommandRunner('weather', 'Dart weather CLI');

  runner..addCommand(Current());

  return await runner.run(args).catchError((e) {
    stdout.write("${e ?? "An Error Occured"}");

    exit(success);
  });
}
