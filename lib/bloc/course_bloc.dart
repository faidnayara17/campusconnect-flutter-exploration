import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/mata_kuliah.dart';
import '../data/dummy_data.dart';
import 'course_event.dart';

class CourseBloc extends Bloc<CourseEvent, List<MataKuliah>> {
  CourseBloc() : super(daftarMataKuliahDummy) {
    on<TambahMataKuliah>((event, emit) => emit([...state, event.mk]));
    on<HapusMataKuliah>((event, emit) {
      final list = [...state]..removeAt(event.index);
      emit(list);
    });
  }
}