part of ubah_profil;

class UbahPasswordController extends GetxController {
  final passwordLama = TextEditingController();
  final password = TextEditingController();
  final verPassword = TextEditingController();

  final List<String> radioJenisKelamin = ["Laki-laki", "Perempuan"]; //value
  var selectJenisKelamin = ''.obs; //group value

  RxBool isLoadingSimpanDatabase = false.obs;
  final List<Tab> myTabs = <Tab>[
    const Tab(text: "Edit Profil"),
  ];

  /*@override
  void onClose() {
    controller.dispose();
    super.onClose();
  }*/

  /* void tabIndexActive() {
    activeTabIndex.value = tabController.index;
    print(activeTabIndex.value);
  }*/

  void onClickRadioButtonJenisKelamin(value) {
    selectJenisKelamin.value = value;
  }

  Future updatePassword() async {
    print("method accessed");
    await AuthService()
        .updatePassword(
      idUser:
          3, // temporary aja ini, nanti ganti pake idUser yang authenticated
      oldPassword: passwordLama.text,
      newPassword: password.text,
      verifyPassword: verPassword.text,
    )
        .then((value) {
      Get.offAllNamed(
        //pergi ke halaman daftarAnak dengan menghapus semua layar halaman
        Routes.bottomBar,
        arguments: 4, //langsung ke tab array ke 1 (Anak)
      );
      AppSnackbar.pesanSuccess(value);
    }, onError: (err) {
      print('5: $err');
      AppSnackbar.pesanDanger(err.toString());
    }).catchError((err) {
      print('6: $err');
      AppSnackbar.pesanDanger(err.toString());
    });
  }
}
