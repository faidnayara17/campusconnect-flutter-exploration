import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/mata_kuliah.dart';
import '../data/dummy_data.dart';

class CourseNotifier extends StateNotifier<List<MataKuliah>> {
  CourseNotifier() : super(daftarMataKuliahDummy);

  void tambah(MataKuliah mk) => state = [...state, mk];

  void hapus(int index) {
    final list = [...state]..removeAt(index);
    state = list;
  }
}

final courseProvider =
StateNotifierProvider<CourseNotifier, List<MataKuliah>>(
        (ref) => CourseNotifier());