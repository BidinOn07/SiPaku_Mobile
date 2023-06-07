// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipaku/app/daftarpenyakit/views/daftarpenyakit_view.dart';
import 'package:sipaku/app/diagnosa/views/diagnosa_view.dart';

import '../dashboard/views/dashboard_view.dart';
import '../deteksi/views/deteksi_view.dart';
import '../login/views/login_view.dart';
import '../profile/views/profile_view.dart';
import 'project_card.dart';
import 'selection_button.dart';
import '../constans/app_constants.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    required this.data,
    Key? key,
  }) : super(key: key);

  final ProjectCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(kSpacing),
              child: ProjectCard(
                data: data,
              ),
            ),
            const Divider(thickness: 1),
            SelectionButton(
              data: [
                SelectionButtonData(
                  activeIcon: EvaIcons.grid,
                  icon: EvaIcons.gridOutline,
                  label: "Beranda  ",
                  onTap: () {
                    Get.to(() => DashboardScreen());
                  },
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.archive,
                  icon: EvaIcons.archiveOutline,
                  label: "Daftar Penyakit",
                  onTap: () {
                    Get.to(() => DaftarpenyakitView());
                  },
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.calendar,
                  icon: EvaIcons.calendarOutline,
                  label: "Diagnosa",
                  onTap: () {
                    Get.to(() => DiagnosaView());
                  },
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.email,
                  icon: EvaIcons.emailOutline,
                  label: "Deteksi",
                  onTap: () {
                    Get.to(() => DeteksiView());
                  },
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.person,
                  icon: EvaIcons.personOutline,
                  label: "Profil",
                  onTap: () {
                    Get.to(() => ProfilView());
                  },
                ),
                SelectionButtonData(
                    activeIcon: EvaIcons.settings,
                    icon: EvaIcons.settingsOutline,
                    label: "Log Out ",
                    onTap: () {
                      Get.to(() => LoginView());
                    }),
              ],
              onSelected: (index, value) {
                log("index : $index | label : ${value.label}");
              },
            ),
            const Divider(thickness: 1),
            const SizedBox(height: kSpacing * 2),
          ],
        ),
      ),
    );
  }
}
