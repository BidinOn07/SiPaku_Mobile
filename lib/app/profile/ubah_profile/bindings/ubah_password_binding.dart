part of ubah_profil;

class UbahPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UbahPasswordController());
  }
}

