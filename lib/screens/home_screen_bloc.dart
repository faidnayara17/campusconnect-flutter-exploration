import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/course_bloc.dart';
import '../bloc/course_event.dart';
import '../models/mata_kuliah.dart';
import '../widgets/course_card.dart';

class HomeScreenBloc extends StatelessWidget {
  const HomeScreenBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CampusConnect (Bloc)')),
      body: BlocBuilder<CourseBloc, List<MataKuliah>>(
        builder: (context, daftar) => ListView.builder(
          itemCount: daftar.length,
          itemBuilder: (context, i) => CourseCard(
            mk: daftar[i],
            onDelete: () =>
                context.read<CourseBloc>().add(HapusMataKuliah(i)),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CourseBloc>().add(
          TambahMataKuliah(MataKuliah(
              DateTime.now().microsecondsSinceEpoch.toString(),
              'Mata Kuliah Baru', 2, 'Dosen Uji')),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}