// ignore_for_file: avoid_print

part of ubah_profil;

class UbahAkunController extends GetxController with GetSingleTickerProviderStateMixin{

  final List<String> radioJenisKelamin = ["Laki-laki", "Perempuan"]; //value
  var selectJenisKelamin = ''.obs; //group value
  
  late TabController tabController;
  RxInt activeTabIndex = 0.obs;
  
  Rx<User> detailProfil = User().obs;

  var username = TextEditingController();
  var namaKader = TextEditingController();
  var jenisKelamin = TextEditingController();
  var alamatLengkap = TextEditingController();
  var nomorTelp = TextEditingController();

  RxBool isLoadingSimpanDatabase = false.obs;
  final List<Tab> myTabs = <Tab> [
    const Tab(
      text: "Edit Data Pribadi"
    ),
  ];

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(vsync: this, length: myTabs.length);
    tabController.addListener(tabIndexActive);
    await readDetailProfil();
  }
  
  Future readDetailProfil() async {
    await AuthService().getProfile(/*ini ambil dari mana? dari storage!['idUser'] ?*/ 1).then(
      (value) {
        detailProfil.value = value;
        update();
      },
      onError: (err) {
        AppSnackbar.pesanDanger(err.toString());
      }
    ).catchError((err) {
      AppSnackbar.pesanDanger(err.toString());
    });
}

  /*@override
  void onClose() {
    controller.dispose();
    super.onClose();
  }*/

  void tabIndexActive() {
    activeTabIndex.value = tabController.index;
    print(activeTabIndex.value);
  }

  void onClickRadioButtonJenisKelamin(value) {
    selectJenisKelamin.value = value;
  }

}
