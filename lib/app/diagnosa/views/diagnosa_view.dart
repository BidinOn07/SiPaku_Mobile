// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_import, non_constant_identifier_names

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipaku/app/components/sidebar.dart';
import 'package:sipaku/app/daftarpenyakit/views/daftarpenyakit_view.dart';
import 'package:sipaku/app/dashboard/views/dashboard_view.dart';

import '../../components/responsive_builder.dart';
import '../../constans/app_constants.dart';

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
      appBar: _AppBarZ(),
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

  AppBar _AppBarZ() {
    return AppBar(
      title: Column(
        children: [Text("Diagnosa")],
      ),
      centerTitle: true,
    );
  }
}
