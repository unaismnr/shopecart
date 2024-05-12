import 'package:flutter/material.dart';
import 'package:shopecart/api/get_products_api.dart';
import 'package:shopecart/views/common/products_inkwell.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProductsApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.data;
            return StaggeredGridView.countBuilder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              itemCount: data!.length,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              itemBuilder: (context, index) {
                return ProductsInkwell(
                  product: data[index],
                );
              },
              staggeredTileBuilder: (context) => const StaggeredTile.fit(1),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
