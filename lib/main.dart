import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/pages/home_page.dart';
import 'presentation/pages/kanban_bloc_page.dart';
import 'presentation/state_managers/bloc/kanban_bloc.dart';
import 'utils/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutterban',
      theme: AppTheme.lightTheme(),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) {
          final bloc = KanbanBloc();
          bloc.add(const KanbanEvent.getColumns());
          return bloc;
        },
        child: const KanbanBlocPage(),
      ),
    );
  }
}


//home: const HomePage(),