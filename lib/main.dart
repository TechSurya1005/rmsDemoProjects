import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rms_demo/app/routes/routes_call.dart';
import 'package:rms_demo/app/theme/theme.dart';
import 'package:rms_demo/repository/counter_provider.dart';
import 'package:rms_demo/screens/Employees/viewModel/employeeViewModel.dart';
import 'package:rms_demo/screens/MainHome/viewModal/mainHomeViewModal.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => MainHomeViewViewModal()),
        ChangeNotifierProvider(create: (_) => EmployeeViewmodel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "RMS Demo",
      debugShowCheckedModeBanner: false,
      theme: MyTheme.darkTheme(),
      routerConfig: GoRouteCall().router,
    );
  }
}
