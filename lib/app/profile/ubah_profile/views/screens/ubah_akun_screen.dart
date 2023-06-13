// ignore_for_file: unused_import

library ubah_profil;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

//constants

//shared_components
import '../../../../components/radio_button.dart';
import '../../../../components/txt_field.dart';
import '../../../../constans/app_constants.dart';
//constants
import '../../../../models/user.dart';
import '../../../../services/rest_api_services.dart';
import '../../../../utils/ui/ui_utils.dart';

// binding
part '../../bindings/ubah_akun_binding.dart';

// controller
part '../../controllers/ubah_akun_controller.dart';

// component
part '../components/form_ubah_akun.dart';

class UbahAkunScreen extends GetView<UbahAkunController> {
  const UbahAkunScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Theme.of(Get.context!).primaryColor,
          leading: const BackButton(),
          title: const Center(
              child: Text(
            "Ubah Data Akun",
            style: TextStyle(
              fontSize: 20,
            ),
            overflow: TextOverflow.ellipsis,
          )),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(Get.context!).primaryColor,
          onPressed: () {
            (controller.activeTabIndex.value == 0)
                ? controller.tabController.animateTo(1)
                : controller.tabController.animateTo(0);
          },
          child: Obx(() => (controller.activeTabIndex.value == 0)
              ? const Icon(Icons.done_rounded)
              : const Icon(Icons.check)),
        ),
        body: SafeArea(
          child: TabBarView(controller: controller.tabController, children: [
            _buildDisplayUbahAkun(),
          ]),
        ));
  }

  Widget _buildDisplayUbahAkun() {
    return FormUbahAkun(controller: controller);
  }
}
