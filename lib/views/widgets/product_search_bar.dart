import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopecart/controllers/search_provider.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (query) {
        Provider.of<SearchProvider>(context, listen: false)
            .searchProducts(query);
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: "Search",
      ),
    );
  }
}
