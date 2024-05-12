import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopecart/api/get_category_api.dart';
import 'package:shopecart/views/category/category_wise_products.dart';
import 'package:shopecart/views/common/custom_app_bar.dart';
import 'package:shopecart/views/common/navigation_helper.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({
    super.key,
  });

  final List<FaIcon> iconDataList = [
    const FaIcon(FontAwesomeIcons.person),
    const FaIcon(FontAwesomeIcons.computer),
    const FaIcon(FontAwesomeIcons.personDress),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        'Categories',
        context,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
              future: getCategoriesApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        NavigationHelper.push(
                          context,
                          CategoryWiseProducts(
                            categoryName:
                                snapshot.data![index].category.toString(),
                            categoryId: snapshot.data![index].id.toString(),
                          ),
                        );
                      },
                      child: Container(
                        width: 94,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 235, 235, 235),
                              spreadRadius: .1,
                              blurRadius: 10,
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(iconDataList[index].icon, size: 40),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              snapshot.data![index].category.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
