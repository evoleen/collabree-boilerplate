import 'package:collabree/collabreeLocalizations.dart';
import 'package:collabree/collabreeLocalizationsDelegate.dart';
import 'package:collabree/collabreeLogger.dart';
import 'package:collabree/constants.dart';
import 'package:collabree/example/exampleBloc.dart';
import 'package:collabree/example/pages/examplePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  CollabreeLogger.setup();
  Bloc.observer = LoggingBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(CollabreeApp());
}

class CollabreeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Collabree',
      theme: ThemeConstants.lightTheme,
      localizationsDelegates: const [
        CollabreeLocalizationsDelegate(),
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: CollabreeLocalizationsDelegate.supportedLocals,
      onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
      home: BlocProvider<ExampleBloc>(
        create: (context) => ExampleBloc(),
        child: ExamplePage(),
      ),
    );
  }
}
