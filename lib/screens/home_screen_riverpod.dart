import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/mata_kuliah.dart';
import '../providers/course_notifier.dart';
import '../widgets/course_card.dart';

class HomeScreenRiverpod extends ConsumerWidget {
  const HomeScreenRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final daftar = ref.watch(courseProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('CampusConnect (Riverpod)')),
      body: ListView.builder(
        itemCount: daftar.length,
        itemBuilder: (context, i) => CourseCard(
          mk: daftar[i],
          onDelete: () => ref.read(courseProvider.notifier).hapus(i),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(courseProvider.notifier).tambah(
          MataKuliah(DateTime.now().microsecondsSinceEpoch.toString(),
              'Mata Kuliah Baru', 2, 'Dosen Uji'),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}