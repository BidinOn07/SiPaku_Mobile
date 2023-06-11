import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipaku/app/daftarpenyakit/views/daftarpenyakit_view.dart';
import 'package:sipaku/app/urls/urls.dart';

class DiagnosaView extends StatefulWidget {
  const DiagnosaView({super.key});

  @override
  State<DiagnosaView> createState() => _DiagnosaViewState();
}

class _DiagnosaViewState extends State<DiagnosaView> {
  List<Map<String, dynamic>> categories = [];

  void getGejala() async {
    var urls = Urls();
    var userList = await urls.getGejala();

    userList.forEach((gejala) {
      Map<String, dynamic> gejalaMap = {
        'nama': gejala.nama,
        'kode': gejala.kode,
        'isChecked': false,
      };
      categories.add(gejalaMap);
    });

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getGejala();
  }

  void toggleCheckbox(int index) {
    setState(() {
      categories[index]['isChecked'] = !categories[index]['isChecked'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pilih Gejala yang Anda Rasakan:",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.lightBlue,
              ),
              const SizedBox(height: 10),
              Column(
                children: categories.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> category = entry.value;
                  return CheckboxListTile(
                    activeColor: Colors.lightBlue,
                    checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    title: Text(category["nama"]),
                    value: category['isChecked'],
                    onChanged: (val) {
                      toggleCheckbox(index);
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              Card(
                color: Colors.lightBlue,
                elevation: 5,
                child: Container(
                  height: 30,
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      Get.to(() => const DaftarPenyakitView());
                    },
                    child: const Center(
                      child: Text(
                        "Selanjutnya",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Column(
        children: [
          Text("Diagnosa"),
        ],
      ),
      centerTitle: true,
    );
  }
}
