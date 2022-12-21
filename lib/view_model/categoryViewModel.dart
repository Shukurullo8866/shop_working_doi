import 'package:flutter/cupertino.dart';
import 'package:shop_working_doi/data/models/carModel.dart';
import 'package:shop_working_doi/data/repository/product_repo.dart';
import '../data/models/productModel.dart';

class CategoriesViewModel extends ChangeNotifier {
  CategoriesViewModel({required this.appRepository}) {
  }

  List<CategoryModel> categories =[];

  bool isloading = false;

  AppRepository appRepository;

  fetchCategories() async{
    categories = (await appRepository.getAllCategories())!;
    notifyListeners();
  }

  notify(bool v) {
    isloading = v;
    notifyListeners();
  }
}
