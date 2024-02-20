import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopecart/api/get_category_api.dart';
import 'package:shopecart/views/pages/category_wise_products.dart';
import 'package:shopecart/views/widgets/navigation_helper.dart';

class HomeCategoryBox extends StatelessWidget {
  HomeCategoryBox({super.key});

  final List<FaIcon> iconDataList = [
    const FaIcon(FontAwesomeIcons.person),
    const FaIcon(FontAwesomeIcons.computer),
    const FaIcon(FontAwesomeIcons.personDress),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getCategoriesApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => InkWell(
                  child: InkWell(
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
                          Icon(
                            iconDataList[index].icon,
                            size: 40,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            snapshot.data![index].category.toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
