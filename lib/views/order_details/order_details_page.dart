import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopecart/utils/consts.dart';
import 'package:shopecart/controllers/load_username_provider.dart';
import 'package:shopecart/views/common/custom_app_bar.dart';
import '../../api/get_order_details_api.dart';
import 'package:intl/intl.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Orders', context),
      body: Consumer<LoadUsernameProvider>(
        builder: (context, user, _) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FutureBuilder(
              future: getOrderDetailsApi(
                user.username.toString(),
              ),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No Orders Yet'),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'Something Error',
                    ),
                  );
                } else if (snapshot.hasData) {
                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var orderData = snapshot.data![index];
                      DateTime dateTime = DateTime.parse(
                        orderData.date,
                      );
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                          left: 10,
                          right: 10,
                        ),
                        child: Container(
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
                          child: ExpansionTile(
                            iconColor: mainColor,
                            collapsedIconColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: mainColor),
                            ),
                            trailing: const Icon(
                                Icons.arrow_drop_down_circle_outlined),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                  DateFormat.yMMMEd().format(dateTime),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  orderData.paymentmethod.toString(),
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                Text(
                                  '₹${orderData.totalamount}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                            children: [
                              ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16, bottom: 16),
                                    child: Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(
                                            255, 240, 247, 252),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 16,
                                            ),
                                            child: SizedBox(
                                              height: 80,
                                              width: 75,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Image.network(
                                                  imageurl +
                                                      orderData
                                                          .products[index].image
                                                          .toString(),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Wrap(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Text(
                                                    orderData.products[index]
                                                        .productname
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 12,
                                                          top: 12,
                                                          right: 12),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        orderData
                                                            .products[index]
                                                            .price
                                                            .toString(),
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      const Text(
                                                        '×',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Text(
                                                        orderData
                                                            .products[index]
                                                            .quantity
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(),
                                itemCount:
                                    snapshot.data![index].products.length,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: ((context, index) => const SizedBox()),
                    itemCount: snapshot.data!.length,
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
