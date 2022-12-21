import 'package:flutter/cupertino.dart';
import 'package:shop_working_doi/data/repository/product_repo.dart';
import '../data/models/productModel.dart';

class ProductViewModel extends ChangeNotifier {
  ProductViewModel({required this.productRepo}) {
  }

  List<Products> products=[];

  bool isloading = false;

  AppRepository productRepo;

  fetchAlbum() async{
    products = (await productRepo.getAllProducts())!;
    notifyListeners();
  }

  notify(bool v) {
    isloading = v;
    notifyListeners();
  }
}
