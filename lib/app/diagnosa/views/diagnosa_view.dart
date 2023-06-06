import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipaku/app/daftarpenyakit/views/daftarpenyakit_view.dart';


class DiagnosaView extends StatefulWidget {
  const DiagnosaView({super.key});

  @override
  State<DiagnosaView> createState() => _DiagnosaViewState();
}

class _DiagnosaViewState extends State<DiagnosaView> {
  List<Map> categories = [
    {"name": "Kulit memerah", "isChecked": false},
    {"name": "Kulit seperti bersisik", "isChecked": false},
    {"name": "Kulit terasa gatal tidak tertahan", "isChecked": false},
    {"name": "Kulit gatal pada malam hari", "isChecked": false},
    {"name": "Tumbuh benjolan di permukaan kulit", "isChecked": false},
    {"name": "tumbuh benjolan merah kecoklatan", "isChecked": false},
    {"name": "Kulit meradang", "isChecked": false},
    {"name": "kulit terasa perih", "isChecked": false},
    {
      "name": "Gatal dibagian selangkangan kaki/ketiak/leher/dsb",
      "isChecked": false
    },
    {"name": "Tumbuh benjolan merah", "isChecked": false},
    {"name": "Tumbuh benjolan kecil agak memutih", "isChecked": false},
    {"name": "Kulit terasa berminyak", "isChecked": false},
    {"name": "Rasa gatal yang panas", "isChecked": false},
    {"name": "Rasa gatal yang perih", "isChecked": false},
    {"name": "Tumbuh benjolan berisi nanah", "isChecked": false},
    {"name": "Ruam", "isChecked": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: (ResponsiveBuilder.isDesktop(context))
      //     ? null
      //     : Drawer(
      //         child: Padding(
      //           padding: const EdgeInsets.only(top: kSpacing),
      //           child: _Sidebar(data: controller.getSelectedProject()),
      //         ),
      //       ),
      appBar: _appBarZ(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pilih Gejala yang anda rasakan :",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.lightBlue,
              ),
              SizedBox(height: 10),
              Column(
                  children: categories.map((favorite) {
                return CheckboxListTile(
                    activeColor: Colors.lightBlue,
                    checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    title: Text(favorite["name"]),
                    value: favorite['isChecked'],
                    onChanged: (val) {
                      setState(() {
                        favorite['isChecked'] = val;
                      });
                    });
              }).toList()),
              SizedBox(height: 10),
              Card(
                color: Colors.lightBlue,
                elevation: 5,
                child: Container(
                  height: 30,
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      Get.to(() => DaftarpenyakitView());
                    },
                    child: Center(
                        child: Text("Selanjutnya",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white))),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class _Sidebar extends StatelessWidget {
//   const _Sidebar({
//     required this.data,
//     Key? key,
//   }) : super(key: key);

//   final ProjectCardData data;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Theme.of(context).cardColor,
//       child: SingleChildScrollView(
//         controller: ScrollController(),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(kSpacing),
//               child: ProjectCard(
//                 data: data,
//               ),
//             ),
//             const Divider(thickness: 1),
//             SelectionButton(
//               data: [
//                 SelectionButtonData(
//                   activeIcon: EvaIcons.grid,
//                   icon: EvaIcons.gridOutline,
//                   label: "Beranda  ",
//                   onTap: () {
//                     Get.to(() => DashboardScreen());
//                   },
//                 ),
//                 SelectionButtonData(
//                   activeIcon: EvaIcons.archive,
//                   icon: EvaIcons.archiveOutline,
//                   label: "Daftar Penyakit",
//                   onTap: () {
//                     Get.to(() => DaftarPenyakit());
//                   },
//                 ),
//                 SelectionButtonData(
//                   activeIcon: EvaIcons.calendar,
//                   icon: EvaIcons.calendarOutline,
//                   label: "Diagnosa",
//                   onTap: () {
//                     Get.to(() => Diagnosa());
//                   },
//                 ),
//                 SelectionButtonData(
//                   activeIcon: EvaIcons.email,
//                   icon: EvaIcons.emailOutline,
//                   label: "Deteksi",
//                   onTap: () {
//                     Get.to(() => DeteksiView(), binding: DashboardBinding());
//                   },
//                 ),
//                 SelectionButtonData(
//                   activeIcon: EvaIcons.person,
//                   icon: EvaIcons.personOutline,
//                   label: "Profil",
//                 ),
//                 SelectionButtonData(
//                   activeIcon: EvaIcons.settings,
//                   icon: EvaIcons.settingsOutline,
//                   label: "Log Out ",
//                 ),
//               ],
//               onSelected: (index, value) {
//                 log("index : $index | label : ${value.label}");
//               },
//             ),
//             const Divider(thickness: 1),
//             const SizedBox(height: kSpacing * 2),
//           ],
//         ),
//       ),
//     );
//   }
// }

AppBar _appBarZ() {
  return AppBar(
    title: Column(
      children: [Text("Diagnosa")],
    ),
    centerTitle: true,
  );
}
