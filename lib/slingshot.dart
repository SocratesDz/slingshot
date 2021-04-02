import 'dart:convert';
import 'dart:io';

int calculate() {
  return 6 * 7;
}

void checkVersion() async {
  var checkVersion = await Process.start('flutter', ['--version']);
  await checkVersion.stdout.transform(utf8.decoder).forEach(print);
  var exitCode = await checkVersion.exitCode;

  print(exitCode == 0
      ? 'Flutter is installed!'
      : 'Error! Flutter is not installed.');
}
