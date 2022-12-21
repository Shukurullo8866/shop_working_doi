import 'package:shop_working_doi/data/models/carModel.dart';
import 'package:shop_working_doi/data/models/productModel.dart';

import '../apiServise/apiServise.dart';

class AppRepository {
  AppRepository({required this.apiService});

  ApiService apiService;

  // Future<Products?> getMyAlbum(int id) => apiService.getSingleAlbumById();

  Future<List<Products>?> getAllProducts() => apiService.getAllProducts();
  Future<List<CategoryModel>?> getAllCategories() => apiService.getCategories();

}