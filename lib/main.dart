import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_working_doi/data/apiServise/apiServise.dart';
import 'package:shop_working_doi/data/repository/product_repo.dart';
import 'package:shop_working_doi/ui/navigation_bar.dart';
import 'package:shop_working_doi/view_model/categoryViewModel.dart';
import 'package:shop_working_doi/view_model/praductViewModel.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ProductViewModel(
          productRepo: AppRepository(apiService: ApiService()),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => CategoriesViewModel(
          appRepository: AppRepository(apiService: ApiService()),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: NavigationPage(),
    );
  }
}
