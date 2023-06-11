class GetPenyakitResponse {
  bool success;
  List<Penyakit> data;
  String message;

  GetPenyakitResponse(
      {required this.success, required this.data, required this.message});

  factory GetPenyakitResponse.fromJson(Map<String, dynamic> json) {
    return GetPenyakitResponse(
      success: json['success'],
      data: List<Penyakit>.from(json['data'].map((x) => Penyakit.fromJson(x))),
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

class Penyakit {
  final String nama;
  final String kode;
  final String penyebab;

  Penyakit(this.nama, this.kode, this.penyebab);

  factory Penyakit.fromJson(Map<String, dynamic> json) {
    return Penyakit(
      json['nama'],
      json['kode'],
      json['penyebab'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'kode': kode,
      'penyebab': penyebab,
    };
  }
}
