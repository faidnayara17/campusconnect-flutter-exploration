import 'package:flutter/material.dart';
import '../models/mata_kuliah.dart';

class DetailScreen extends StatelessWidget {
  final MataKuliah mk;
  const DetailScreen({super.key, required this.mk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(mk.nama)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: 'mk-${mk.id}',
                child: CircleAvatar(
                  radius: 56,
                  child: Text('${mk.sks}',
                      style: const TextStyle(fontSize: 40)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(mk.nama, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('Dosen: ${mk.dosen}'),
            Text('Bobot: ${mk.sks} SKS'),
            Text('Kode: ${mk.id}'),
          ],
        ),
      ),
    );
  }
}