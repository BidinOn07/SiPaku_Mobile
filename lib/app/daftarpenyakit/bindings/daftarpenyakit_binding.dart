import 'package:get/get.dart';

import '../controllers/daftarpenyakit_controller.dart';

class DaftarpenyakitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarpenyakitController>(
      () => DaftarpenyakitController(),
    );
  }
}
