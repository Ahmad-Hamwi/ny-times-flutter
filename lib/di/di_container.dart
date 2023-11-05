import 'package:bab_alomda_assessment_flutter/di/data_module.dart';
import 'package:bab_alomda_assessment_flutter/di/domain_module.dart';
import 'package:bab_alomda_assessment_flutter/di/presentation_module.dart';

import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void initDiContainer() {
  registerPresentationLayer();
  registerDomainLayer();
  registerDataLayer();
}

void disposeDiContainer() {
  sl.reset(dispose: true);
}
