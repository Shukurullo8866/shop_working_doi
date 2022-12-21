import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_working_doi/view_model/praductViewModel.dart';


class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    Future.microtask(
            () => context.read<ProductViewModel>().fetchAlbum());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: double.infinity,
        margin: const EdgeInsets.all(15),
        child: Consumer<ProductViewModel>(
            builder: (context, companiesViewModel, child) {
              return companiesViewModel.isloading
                  ? const Center(child: CircularProgressIndicator())
                  : (companiesViewModel.products == null
                  ? const Text("no information ")
                  : GridView.builder(
                shrinkWrap: true,
                itemCount: companiesViewModel.products.length,
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
                              image: NetworkImage(companiesViewModel
                                  .products[index].imageUrl.toString()),
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