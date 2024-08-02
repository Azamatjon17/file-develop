import 'package:dars88_upload_download/blocs/file/file_bloc.dart';
import 'package:dars88_upload_download/data/repositories/file_repository.dart';
import 'package:dars88_upload_download/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) {
        return FileRepository();
      },
      child: BlocProvider(
          create: (context) {
            return FileBloc(
              fileRepository: context.read<FileRepository>(),
            );
          },
          child: MaterialApp(
            themeMode: ThemeMode.dark,
            // theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
          )),
    );
  }
}

class AppTextStyles {
  static const blueTextStyle = TextStyle(color: Colors.blue);
}
