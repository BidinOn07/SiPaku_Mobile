// ignore_for_file: prefer_const_constructors, unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/project_card.dart';
import '../../components/task_card.dart';
import '../../constans/app_constants.dart';
import '../../daftarpenyakit/views/daftarpenyakit_view.dart';
import '../../deteksi/views/deteksi_view.dart';
import '../../diagnosa/views/diagnosa_view.dart';
import '../../utils/helpers/app_helpers.dart';

class DashboardController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // static var key;

  void openDrawer() {
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState!.openDrawer();
    }
  }

  // Profile getProfil() {
  //   return Profile(
  //     photo: AssetImage(ImageRasterPath.avatar1),
  //     name: "Firgia",
  //     email: "flutterwithgia@gmail.com",
  //   );
  // }

  List<TaskCardData> getAllTask() {
    return [
      TaskCardData(
        title: "Daftar Penyakit",
        dueDay: 2,
        totalComments: 50,
        type: TaskType.selengkapnya,
        totalContributors: 30,
        profilContributors: [
          AssetImage(ImageRasterPath.avatar1),
          AssetImage(ImageRasterPath.avatar2),
          AssetImage(ImageRasterPath.avatar3),
          AssetImage(ImageRasterPath.avatar4),
        ],
        onPressed: () {
          Get.to(() => DaftarpenyakitView());
        },
      ),
      TaskCardData(
        title: "Diagnosa",
        dueDay: -1,
        totalComments: 50,
        totalContributors: 34,
        type: TaskType.selengkapnya,
        profilContributors: [
          AssetImage(ImageRasterPath.avatar5),
          AssetImage(ImageRasterPath.avatar6),
          AssetImage(ImageRasterPath.avatar7),
          AssetImage(ImageRasterPath.avatar8),
        ],
        onPressed: () {
          Get.to(() => DiagnosaView());
        },
      ),
      TaskCardData(
        title: "Deteksi",
        dueDay: 1,
        totalComments: 50,
        totalContributors: 34,
        type: TaskType.selengkapnya,
        profilContributors: [
          AssetImage(ImageRasterPath.avatar5),
          AssetImage(ImageRasterPath.avatar3),
          AssetImage(ImageRasterPath.avatar4),
          AssetImage(ImageRasterPath.avatar2),
        ],
        onPressed: () {
          Get.to(() => DeteksiView());
        },
      ),
    ];
  }

  ProjectCardData getSelectedProject() {
    return ProjectCardData(
      projectImage: const AssetImage('assets/images/logo_sipaku.png'),
      projectName: "SiPaku",
    );
  }
}
