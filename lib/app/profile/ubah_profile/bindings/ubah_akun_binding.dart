part of ubah_profil;

class UbahAkunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UbahAkunController());
  }
}
