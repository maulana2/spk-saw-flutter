class Jurusan {
  int? kode;
  String? namaJurusan;
  double? mtk;
  double? binggris;
  double? ipa;
  double? ips;
  double? preferensi; // Menambahkan atribut preferensi

  Jurusan({
    this.kode,
    this.namaJurusan,
    this.mtk,
    this.binggris,
    this.ipa,
    this.ips,
    this.preferensi,
  });

  Jurusan.fromJson(Map<String, dynamic> json) {
    kode = json['kode'];
    namaJurusan = json['nama_jurusan'];
    mtk = json['mtk'];
    binggris = json['binggris'];
    ipa = json['ipa'];
    ips = json['ips'];
    preferensi = json['preferensi']; // Menambahkan preferensi
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kode'] = this.kode;
    data['nama_jurusan'] = this.namaJurusan;
    data['mtk'] = this.mtk;
    data['binggris'] = this.binggris;
    data['ipa'] = this.ipa;
    data['ips'] = this.ips;
    data['preferensi'] = this.preferensi; // Menambahkan preferensi
    return data;
  }
}
