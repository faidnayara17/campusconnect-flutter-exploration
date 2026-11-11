import '../models/mata_kuliah.dart';

abstract class CourseEvent {}

class TambahMataKuliah extends CourseEvent {
  final MataKuliah mk;
  TambahMataKuliah(this.mk);
}

class HapusMataKuliah extends CourseEvent {
  final int index;
  HapusMataKuliah(this.index);
}