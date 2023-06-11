class GetGejalaPenyakitResponse {
  bool success;
  List<GejalaPenyakit> data;
  String message;

  GetGejalaPenyakitResponse(
      {required this.success, required this.data, required this.message});

  factory GetGejalaPenyakitResponse.fromJson(Map<String, dynamic> json) {
    return GetGejalaPenyakitResponse(
      success: json['success'],
      data: List<GejalaPenyakit>.from(json['data'].map((x) => GejalaPenyakit.fromJson(x))),
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

class GejalaPenyakit {
  final String nama;
  final String kode;

  GejalaPenyakit(this.nama, this.kode);

  factory GejalaPenyakit.fromJson(Map<String, dynamic> json) {
    return GejalaPenyakit(
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
