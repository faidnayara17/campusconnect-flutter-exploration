import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'bloc/course_bloc.dart';
import 'screens/home_screen_bloc.dart';
import 'screens/home_screen_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CourseBloc(),
      child: MaterialApp(
        title: 'CampusConnect Flutter',
        theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
        home: const RootScreen(),
      ),
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});
  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: const [HomeScreenRiverpod(), HomeScreenBloc()],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.bolt), label: 'Riverpod'),
          NavigationDestination(icon: Icon(Icons.account_tree), label: 'Bloc'),
        ],
      ),
    );
  }
}