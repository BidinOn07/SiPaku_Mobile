// ignore_for_file: unused_element, prefer_const_constructors

part of app_helpers;

extension TaskTypeExtension on TaskType {
  Color getColor() {
    switch (this) {
      case TaskType.selengkapnya:
        onTap() {
          Get.to(() => DaftarPenyakitView());
        }
        return Colors.lightBlue;
      case TaskType.progres:
        onTap() {
          Get.to(() => DeteksiView());
        }
        return Colors.red;
      default:
        onTap() {
          Get.to(() => DiagnosaView());
        }
        return Colors.green;
    }
  }

  String toStringValue() {
    switch (this) {
      case TaskType.done:
        onTap() {
          Get.to(() => DiagnosaView());
        }
        return "Selesai";
      case TaskType.progres:
        onTap() {
          Get.to(() => DiagnosaView());
        }
        return "Progres";
      default:
        onTap() {
          Get.to(() => DiagnosaView());
        }
        return "Selengkapnya";
    }
  }
}

extension StringExtension on String {
  String getInitialName([int max = 2]) {
    String val = this;

    List<String> explode = val.split(" ");
    explode.removeWhere((element) => element.trim().isEmpty);

    String result = "";

    for (int i = 0; i < max; i++) {
      if (i < explode.length) {
        result += explode[i].split("").first;
      } else {
        break;
      }
    }

    return result;
  }
}
