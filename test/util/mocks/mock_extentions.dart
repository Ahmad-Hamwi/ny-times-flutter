import 'package:mockito/mockito.dart' as mockito;

extension MockExtensions on mockito.Mock {
  void reset() {
    mockito.reset(this);
  }
}