// ignore_for_file: prefer_const_constructors

library profil;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipaku/app/login/views/login_view.dart';

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
          _buildNamaJabatan(),
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
                    subTitle: "Atur data diri anda disini",
                    route: "/ubah_akun"),
                _buildMenuProfil(
                    icon: const Icon(Icons.key),
                    title: "Ganti kata sandi",
                    subTitle: "Atur ulang kata sandi anda",
                    route: "/ubah_password"),
              ])
            ],
          ),
          const SizedBox(height: kSpacing),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Info Aplikasi',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: kSpacing / 2),
              Column(children: [
                _buildMenuProfil(
                    icon: const Icon(Icons.verified_user),
                    title: "Syarat dan ketentuan",
                    subTitle: "Baca syarat dan ketentuan"),
                _buildMenuProfil(
                    icon: const Icon(Icons.security),
                    title: "Kebijakan privasi",
                    subTitle: "Baca Kebijakan privasi"),
              ])
            ],
          ),
          const SizedBox(height: kSpacing * 2),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.maxFinite, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorderRadius),
              ),
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
              backgroundColor: Theme.of(Get.context!).primaryColor,
            ),
            child: const Text(
              'Keluar',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onPressed: () {
              Get.to(() => LoginView());
            },
          ),
          const SizedBox(height: kSpacing),
        ]),
      ),
    );
  }

  Widget _buildNamaJabatan() {
    return Column(
      children: [
        const Text(
          'Nama Akun',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: kSpacing / 2),
        Container(
          decoration: BoxDecoration(
            color: kColorDanger,
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: kSpacing / 2, vertical: kSpacing / 4),
          child: const Text(
            'Jabatan',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuProfil(
      {required Icon icon,
      required String title,
      required String subTitle,
      String? route}) {
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
