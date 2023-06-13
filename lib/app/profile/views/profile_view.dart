// ignore_for_file: prefer_const_constructors, unused_import

library profil;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipaku/app/profile/ubah_profile/views/screens/ubah_akun_screen.dart';
import 'package:sipaku/app/profile/ubah_profile/views/screens/ubah_password_screen.dart';

//components
import '../../constans/app_constants.dart';
import '../controllers/profile_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(50),
        child: Column(children: [
          const SizedBox(height: 50),
          const SizedBox(height: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Profil Pengguna',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: kSpacing / 2),
              Column(children: [
                _buildMenuProfil(
                  icon: const Icon(Icons.account_circle),
                  title: "Pengaturan akun",
                  subTitle: "Atur data diri anda disini", onTap: () {},
                  // route: "/ubah_akun",
                ),
                _buildMenuProfil(
                    icon: const Icon(Icons.key),
                    title: "Ganti kata sandi",
                    subTitle: "Atur ulang kata sandi anda",
                    onTap: () {
                      Get.to(() => UbahPasswordScreen());
                    }
                    // route: "/ubah_password",
                    ),
              ])
            ],
          ),
          const SizedBox(height: kSpacing * 2),
        ]),
      ),
    );
  }

  Widget _buildMenuProfil(
      {required Icon icon,
      required String title,
      required String subTitle,
      String? route,
      required Null Function() onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(kBorderRadius),
      onTap: () {
        route != null ? Get.toNamed(route) : null;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacing / 2),
        child: Row(
          children: [
            icon,
            const SizedBox(width: kSpacing),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: kSpacing / 2),
                    Text(
                      subTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: kFontColorPallets[1],
                      ),
                    ),
                    const Divider()
                  ]),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: kFontColorPallets[1],
            ),
          ],
        ),
      ),
    );
  }
}
