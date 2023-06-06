import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/picker_image.dart';
import '../controllers/deteksi_controller.dart';

class DeteksiView extends GetView<DeteksiController> {
  const DeteksiView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<DeteksiController>(() => DeteksiController());
    Get.lazyPut(() => ImagePickerService());
    Get.lazyPut(() => PickerController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Deteksi'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => controller.compressImagePath.value == ''
                    ? Text(
                        'Silahkan pilih gambar kulit anda :',
                        style: TextStyle(fontSize: 20),
                      )
                    : Image.file(
                        File(controller.compressImagePath.value),
                        width: double.infinity,
                        height: 300,
                      ),
              ),

              SizedBox(
                height: 10,
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.lightBlue,
              ),

              Obx(() => Text(
                    controller.compressImageSize.value == ''
                        ? ''
                        : controller.compressImageSize.value,
                    style: TextStyle(fontSize: 20),
                  )),

              //Crop

              XPickerImage(
                onImagePicked: (image) {},
                size: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
