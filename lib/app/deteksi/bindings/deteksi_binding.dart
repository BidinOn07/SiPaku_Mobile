import 'package:get/get.dart';
import '../../common/picker_image.dart';
import '../controllers/deteksi_controller.dart';

class DeteksiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeteksiController>(
      () => DeteksiController(),
    );
    Get.lazyPut(
      () => ImagePickerService(),
    );
    Get.lazyPut(
      () => PickerController(),
    );
  }
}
