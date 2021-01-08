import 'dart:io';
import 'package:args/command_runner.dart';
import 'commands/now.dart';
import 'constants.dart';

Future<void> weatherCli(List<String> args) async {
  final runner = CommandRunner(
      'weather', 'A command line interface for getting the weather.');

  runner..addCommand(Current());

  return await runner.run(args).catchError((e) {
    stderr.writeln(e.message ?? 'An Error Occured');
    exit(fail);
  });
}
