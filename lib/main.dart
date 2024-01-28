import 'package:flutter/material.dart';
import 'package:flutter_localise/l10n/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lokalise_flutter_sdk/lokalise_flutter_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Lokalise.init(
    projectId: '2196550165b6402f350a51.65798445',
    sdkToken: '57abeb259584e1397c30c64bb0d071c4e953',
    preRelease: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lokalise SDK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      // You can use  Lt.localizationsDelegates for shorter declaration of localizationsDelegates
      localizationsDelegates: const [
        Lt.delegate, // This adds Lt to the delegate call stack
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Lt
          .supportedLocales, // This lists supported locales based on available languages in the generated `.dart` files
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Lokalise.instance.update().then(
          // This is an async call, handle it appropriately
          (_) => setState(() => _isLoading = false),
          onError: (error) => setState(() => _isLoading = false),
        );
  }

  @override
  Widget build(BuildContext context) {
    Lt.load(const Locale('fr', 'CH'));
    return Scaffold(
      appBar: AppBar(
        title: Text(Lt.of(context).welcome_header),
      ),
      body: Column(
        children: [
          DropdownMenu(
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: Locale('fr', 'CH'), label: 'Français'),
              DropdownMenuEntry(value: Locale('en', 'US'), label: 'English'),
              DropdownMenuEntry(value: Locale('ar'), label: 'Arabic'),
            ],
            onSelected: (value) => setState(() {
              Lt.load(value as Locale);
            }),
          ),
          Container(
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : Center(
                      child: Text(Lt.of(context).welcome_header),
                    )),
        ],
      ),
    );
  }
}
