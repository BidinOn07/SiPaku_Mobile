// ignore_for_file: must_be_immutable, prefer_const_constructors, sort_child_properties_last, unnecessary_overrides, unnecessary_null_comparison, sized_box_for_whitespace

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sipaku/app/common/rounded_container.dart';

class XPickerImage extends GetView<PickerController> {
  Function(XFile) onImagePicked;
  String? networkImage;
  double? size;
  XPickerImage({
    this.networkImage,
    required this.onImagePicked,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      height: size! + 40,
      width: size! + 40,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      hasShadow: false,
      hasBorder: false,
      child: InkWell(
        onTap: () {
          showPicker();
        },
        onLongPress: () {
          showDetail();
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            controller.obx(
              (state) {
                return Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: Image.file(File(state.path)).image,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                );
              },
              onEmpty: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  image: networkImage != null
                      ? DecorationImage(
                          image: NetworkImage(networkImage!),
                          fit: BoxFit.cover,
                        )
                      : DecorationImage(
                          image: AssetImage('assets/images/placeholder.jpg'),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            Positioned(
                child: RoundedContainer(
                  hasBorder: true,
                  hasShadow: false,
                  width: 40,
                  height: 40,
                  child: Icon(Icons.camera, color: Colors.black),
                ),
                bottom: 10,
                right: 10)
          ],
        ),
      ),
    );
  }

  void showDetail() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          color: Colors.transparent,
          height: Get.height,
          width: Get.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // close button in top right corner

              Container(
                width: Get.width,
                child: controller.obx(
                  (state) {
                    return networkImage != null
                        ? Image.network(
                            networkImage!,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(state.path),
                            fit: BoxFit.fill,
                          );
                  },
                  onEmpty: Container(
                    width: Get.width,
                    height: Get.height,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      image: networkImage != null
                          ? DecorationImage(
                              image: NetworkImage(networkImage!),
                              fit: BoxFit.cover,
                            )
                          : DecorationImage(
                              image:
                                  AssetImage('assets/images/placeholder.jpg'),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  onLoading: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () => Get.back(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showPicker() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        color: Colors.white,
        height: 150,
        child: Column(
          children: [
            RoundedContainer(
              width: Get.width,
              height: 50,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                leading: Icon(Icons.camera),
                title: Text(
                  'Pilih Dari Kamera',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  controller.pickImageFromCamera().then((value) {
                    onImagePicked(value);
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            RoundedContainer(
              width: Get.width,
              height: 50,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                leading: Icon(Icons.image),
                title: Text(
                  'Pilih Dari Galeri',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  controller.pickImageFromGallery().then((value) {
                    onImagePicked(value);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PickerController extends GetxController with StateMixin {
  Rx<XFile> image = XFile('').obs;
  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<XFile> pickImageFromGallery() async {
    final pickedFile =
        await Get.find<ImagePickerService>().pickImageFromGallery();
    change(pickedFile, status: RxStatus.loading());
    if (pickedFile != null) {
      change(pickedFile, status: RxStatus.success());
      image.value = pickedFile;
      Get.back();
    }
    return image.value;
  }

  Future<XFile> pickImageFromCamera() async {
    final pickedFile =
        await Get.find<ImagePickerService>().pickImageFromCamera();
    if (pickedFile != null) {
      change(pickedFile, status: RxStatus.loading());
      change(pickedFile, status: RxStatus.success());
      image.value = pickedFile;
      Get.back();
    }
    return image.value;
  }
}

class ImagePickerService extends GetxService {
  ImagePicker imagePicker = ImagePicker();
  Future<XFile?> pickImageFromGallery() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  Future<XFile> pickImageFromCamera() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    return pickedFile!;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
