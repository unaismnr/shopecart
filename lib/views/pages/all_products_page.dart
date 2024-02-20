import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopecart/views/widgets/custom_app_bar.dart';
import 'package:shopecart/views/widgets/product_search_bar.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../controllers/search_provider.dart';
import '../widgets/products_inkwell.dart';

class AllProductsPage extends StatelessWidget {
  const AllProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        'All Products',
        context,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const ProductSearchBar(),
              const SizedBox(height: 16),
              Consumer<SearchProvider>(builder: (context, searchProvider, _) {
                final displayedProducts = searchProvider.displayedProducts;
                if (displayedProducts == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (displayedProducts.isEmpty) {
                  return const Center(
                    child: Text('Nothing Found'),
                  );
                } else {
                  return StaggeredGridView.countBuilder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    itemCount: displayedProducts.length,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      final product = displayedProducts[index];
                      return ProductsInkwell(product: product);
                    },
                    staggeredTileBuilder: (context) =>
                        const StaggeredTile.fit(1),
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
