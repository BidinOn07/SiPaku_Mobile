// ignore_for_file: deprecated_member_use, avoid_print

part of rest_api_services;

class AuthService {
  Future<User> getProfile(int idUser) async {
    try {
      final response = await Dio()
          .get(ApiPath.getProfil(idUser))
          .timeout(const Duration(seconds: 10));
      List jsonResponse = response.data;
      return User.fromJson(jsonResponse[0]);
    } on DioError catch (e) {
      AppSnackbar.pesanDanger(e.toString());
      return Future.error(e);
    } on TimeoutException catch (e) {
      AppSnackbar.pesanDanger(e.toString());
      return Future.error(e);
    } on SocketException catch (e) {
      AppSnackbar.pesanDanger(e.toString());
      return Future.error(e);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<String> updatePassword(
      {required int idUser,
      required String oldPassword,
      required String newPassword,
      required String verifyPassword}) async {
    try {
      final body = {
        'old_password': oldPassword,
        'new_password': newPassword,
        'verify_password': verifyPassword
      };

      final response = await Dio()
          .post(
            ApiPath.updatePassword(idUser),
            data: body,
            options: Options(contentType: 'application/json', headers: {
              'Accept': 'application/json',
            }),
          )
          .timeout(const Duration(seconds: 30));
      print(response);
      if (response.data['error'] == 0) {
        //lihat response API nya, jika 'error' nya 0 berarti berhasil
        return response.data['message'];
      } else {
        return Future.error(response.data['message']);
      }
    } on DioError catch (e) {
      print(e.toString());
      AppSnackbar.pesanDanger(e.toString());
      return Future.error(e);
    } on TimeoutException catch (e) {
      AppSnackbar.pesanDanger(e.toString());
      print(e.toString());
      return Future.error(e);
    } on SocketException catch (e) {
      AppSnackbar.pesanDanger(e.toString());
      print(e.toString());
      return Future.error(e);
    } catch (e) {
      return Future.error(e);
    }
  }
}
