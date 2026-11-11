import 'package:flutter/material.dart';
import '../models/mata_kuliah.dart';
import '../screens/detail_screen.dart';

class CourseCard extends StatelessWidget {
  final MataKuliah mk;
  final VoidCallback onDelete;
  const CourseCard({super.key, required this.mk, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Hero(
          tag: 'mk-${mk.id}',
          child: CircleAvatar(child: Text('${mk.sks}')),
        ),
        title: Text(mk.nama),
        subtitle: Text('${mk.sks} SKS • ${mk.dosen}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailScreen(mk: mk)),
        ),
      ),
    );
  }
}