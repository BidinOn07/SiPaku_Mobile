part of ui_utils;

/// contains all snackbar templates
class AppSnackbar {
  static void showMessage(String msg) {
    final context = Get.context;
    if (context == null) return;

    final snackBar = SnackBar(
      content: Text(msg),
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void pesanSuccess (String msg) {
    final context = Get.context;
    if (context == null) return;

    final snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: kColorSuccess,
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void pesanDanger (String msg) {
    final context = Get.context;
    if (context == null) return;

    final snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: kColorDanger,
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void pesanWarning (String msg) {
    final context = Get.context;
    if (context == null) return;

    final snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: kColorWarning,
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showNotification({
    required String title,
    required String message,
    Widget? icon,
  }) {
    Get.snackbar(
      title,
      message,
      icon: icon,
      backgroundColor: Colors.white,
    );
  }

  static void showNotificationSuccess({
    required String title,
    required String message,
    Widget? icon,
  }) {
    Get.snackbar(
      title,
      message,
      icon: icon,
      colorText: Colors.white,
      backgroundColor: kColorSuccess,
    );
  }

  static void showNotificationDanger({
    required String title,
    required String message,
    Widget? icon,
  }) {
    Get.snackbar(
      title,
      message,
      icon: icon,
      colorText: Colors.white,
      backgroundColor: kColorDanger,
    );
  }

  static void showNotificationWarning({
    required String title,
    required String message,
    Widget? icon,
  }) {
    Get.snackbar(
      title,
      message,
      icon: icon,
      colorText: Colors.white,
      backgroundColor: kColorWarning,
    );
  }
}
