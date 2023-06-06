part of app_constants;

/// all endpoint api
class ApiPath {
  static const baseUrl = "http://10.0.161.48/api"; //sesuaikan dengan domainnya
  
  //Auth
  static String getProfil(int idUser) => "$baseUrl/profile/$idUser";
  static String updateProfil(int idUser) => "$baseUrl/edit-profile/$idUser";
  static String updatePassword(int idUser) => "$baseUrl/reset-password/$idUser";
}
