import 'package:flutter/material.dart';
import 'package:shopecart/api/category_wise_products_api.dart';
import 'package:shopecart/views/widgets/custom_app_bar.dart';
import 'package:shopecart/views/widgets/products_inkwell.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class CategoryWiseProducts extends StatelessWidget {
  final String categoryName;
  final String categoryId;
  const CategoryWiseProducts({
    super.key,
    required this.categoryName,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        categoryName,
        context,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              FutureBuilder(
                  future: getCategoryWiseProductsApi(categoryId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return StaggeredGridView.countBuilder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        itemCount: snapshot.data!.length,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        itemBuilder: (context, index) {
                          final product = snapshot.data![index];
                          return ProductsInkwell(product: product);
                        },
                        staggeredTileBuilder: (context) =>
                            const StaggeredTile.fit(1),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
