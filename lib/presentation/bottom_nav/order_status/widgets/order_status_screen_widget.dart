import 'package:flutter/material.dart';
import 'package:foodiee_app/presentation/core/dimensions.dart';
import 'package:foodiee_app/presentation/core/no_data_widget.dart';
import 'package:foodiee_app/presentation/core/small_text.dart';

import '../../../../domain/order/order.dart';
import '../../../core/app_colors.dart';

class OrderStatusScreenWidget extends StatelessWidget {
  final List<Order> orders;
  const OrderStatusScreenWidget({
    Key? key,
    required this.orders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return orders.isEmpty
        ? const NoDataWidget(
            text: 'You Have Not Ordered Anything Yet!',
            imagePath: 'assets/images/no_orders.jpg',
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return Container(
                padding: EdgeInsets.only(
                  top: Dimensions.pixels20,
                  left: Dimensions.pixels20,
                  right: Dimensions.pixels20,
                  bottom: Dimensions.pixels10,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[300]!),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                      text: 'Order Id - ${order.orderId.getOrCrash()}',
                      size: Dimensions.font16 - 2,
                    ),
                    Divider(height: Dimensions.pixels20),
                    SmallText(
                      text: 'Ordered on ${order.orderedOn.getOrCrash()}',
                      size: Dimensions.font16 - 2,
                      color: Colors.black54,
                    ),
                    Divider(height: Dimensions.pixels20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: SmallText(
                            text: 'Need Help?',
                            size: Dimensions.font16 - 2,
                            color: AppColors.mainColor,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          );
  }
}
