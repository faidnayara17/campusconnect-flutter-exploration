class MataKuliah {
  final String id;
  final String nama;
  final int sks;
  final String dosen;

  MataKuliah(this.id, this.nama, this.sks, this.dosen)
      : assert(sks >= 1 && sks <= 6, 'SKS harus 1-6');
}