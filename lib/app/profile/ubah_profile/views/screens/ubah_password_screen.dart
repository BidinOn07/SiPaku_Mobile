library ubah_profil;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

//constants

//shared_components

//constants
import '../../../../components/txt_field.dart';
import '../../../../config/routes/app_pages.dart';
import '../../../../constans/app_constants.dart';
import '../../../../services/rest_api_services.dart';
import '../../../../utils/ui/ui_utils.dart';

// binding
part '../../bindings/ubah_password_binding.dart';

// controller
part '../../controllers/ubah_password_controller.dart';

// component
part '../components/form_ubah_password.dart';

class UbahPasswordScreen extends GetView<UbahPasswordController> {
  const UbahPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(Get.context!).primaryColor,
        leading: const BackButton(),
        title: const Center(
            child: Text(
          "Ubah Password",
          style: TextStyle(
            fontSize: 20,
          ),
          overflow: TextOverflow.ellipsis,
        )),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(Get.context!).primaryColor,
          onPressed: () {
            controller.updatePassword();
          },
          child: const Icon(Icons.check)),
      body: SafeArea(
        child: _buildDisplayUbahPassword(),
      ),
    );
  }

  Widget _buildDisplayUbahPassword() {
    return FormUbahPassword(controller: controller);
  }
}
