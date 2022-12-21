import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_working_doi/view_model/categoryViewModel.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    Future.microtask(
            () => context.read<CategoriesViewModel>().fetchCategories());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: double.infinity,
        margin: const EdgeInsets.all(15),
        child: Consumer<CategoriesViewModel>(
            builder: (context, categoryViewModel, child) {
              return categoryViewModel.isloading
                  ? const Center(child: CircularProgressIndicator())
                  : (categoryViewModel.categories == null
                  ? const Text("no information ")
                  : GridView.builder(
                shrinkWrap: true,
                itemCount: categoryViewModel.categories.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      child:
                      Container(
                        margin:
                        const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:
                          Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Center(
                            child: Image(
                              image: NetworkImage(categoryViewModel
                                  .categories[index].imageUrl.toString()),
                              width: 150,
                            )),
                      ),
                    ),
                  );
                },
              ));
            }),
      ),
    );
  }
}
