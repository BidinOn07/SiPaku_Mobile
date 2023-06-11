import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../constans/app_constants.dart';
import '../../urls/urls.dart';

class DaftarPenyakitView extends StatefulWidget {
  const DaftarPenyakitView({super.key});

  @override
  State<DaftarPenyakitView> createState() => _DaftarpenyakitViewState();
}

class _DaftarpenyakitViewState extends State<DaftarPenyakitView> {
  List<Map<String, dynamic>> penyakitlist = [];

  void getPenyakit() async {
    var urls = Urls();
    var userList = await urls.getPenyakit();

    userList.forEach((penyakit) {
      Map<String, dynamic> penyakitMap = {
        'nama': penyakit.nama,
        'kode': penyakit.kode,
        'penyebab': penyakit.penyebab,
      };
      penyakitlist.add(penyakitMap);
    });

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPenyakit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Penyakit'),
        backgroundColor: Colors.lightBlue,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: penyakitlist.length,
                    itemBuilder: (context, index) {
                      return IntrinsicWidth(
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${penyakitlist[index]['nama']}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Text(
                                      "${penyakitlist[index]['penyebab']}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.note,
                                color: Colors.white,
                                size: 50,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _button({
    required bool selected,
    required String label,
    required Function() onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
        ),
        style: ElevatedButton.styleFrom(
          primary: selected
              ? Theme.of(Get.context!).cardColor
              : Theme.of(Get.context!).canvasColor,
          onPrimary: selected ? kFontColorPallets[0] : kFontColorPallets[2],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
