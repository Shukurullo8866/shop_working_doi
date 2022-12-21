

import '../apiServise/apiServise.dart';
import '../models/carModel.dart';

class CategoryRepository {
  CategoryRepository({required this.apiService});
  ApiService apiService;

  Future<List<CategoryModel?>> getMyProduct()=> apiService.getCategories();

}