import 'dart:io';

import 'package:grinder/grinder.dart';

void main(List<String> args) => grind(args);

@DefaultTask('Run build_runner')
Future<void> runner() async {
  await _runProcess(
    'flutter',
    ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
  );
}

@Task('Run Flavor(debug-dev)')
Future<void> debugDev() async {
  await _runProcess(
    'flutter',
    [
      'run',
      '--debug',
      '--flavor',
      'dev',
      '--dart-define=FLAVOR=dev',
      '-t',
      'lib/main-dev.dart',
    ],
  );
}

@Task('Run Flavor(debug-prod)')
Future<void> debugProd() async {
  await _runProcess(
    'flutter',
    [
      'run',
      '--debug',
      '--flavor',
      'prod',
      '--dart-define=FLAVOR=prod',
      '-t',
      'lib/main-prod.dart',
    ],
  );
}

@Task('Run Flavor(release-dev)')
Future<void> releaseDev() async {
  await _runProcess(
    'flutter',
    [
      'run',
      '--release',
      '--flavor',
      'dev',
      '--dart-define=FLAVOR=dev',
      '-t',
      'lib/main-dev.dart',
    ],
  );
}

@Task('Run Flavor(release-prod)')
Future<void> releaseProd() async {
  await _runProcess(
    'flutter',
    [
      'run',
      '--release',
      '--flavor',
      'prod',
      '--dart-define=FLAVOR=prod',
      '-t',
      'lib/main-prod.dart',
    ],
  );
}

@Task('Get packages')
Future<void> pubGet({String? directory}) async {
  await _runProcess(
    'flutter',
    ['pub', 'get', if (directory != null) directory],
  );
}

@Task('Format dart files')
Future<void> format({String path = '.'}) async {
  await _runProcess('flutter', ['format', path]);
}

@Task('Run Flutter unit tests')
Future<void> test() async => await _runProcess('flutter', ['test']);

Future<void> _runProcess(String executable, List<String> arguments) async {
  final result = await Process.run(executable, arguments);
  stdout.write(result.stdout);
  stderr.write(result.stderr);
}
