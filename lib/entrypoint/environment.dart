import 'dart:io';

bool isTestingEnv() {
  return Platform.environment.containsKey("FLUTTER_TEST");
}
