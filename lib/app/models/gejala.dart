class GetGejalaResponse {
  bool success;
  List<Gejala> data;
  String message;

  GetGejalaResponse(
      {required this.success, required this.data, required this.message});

  factory GetGejalaResponse.fromJson(Map<String, dynamic> json) {
    return GetGejalaResponse(
      success: json['success'],
      data: List<Gejala>.from(json['data'].map((x) => Gejala.fromJson(x))),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
      'message': message,
    };
  }
}

class Gejala {
  final String nama;
  final String kode;

  Gejala(this.nama, this.kode);

  factory Gejala.fromJson(Map<String, dynamic> json) {
    return Gejala(
      json['nama'],
      json['kode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'kode': kode,
    };
  }
}
