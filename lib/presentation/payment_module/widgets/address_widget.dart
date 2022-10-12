import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/location/location_provider.dart';
import '../../../application/user_detail/user_detail_provider.dart';
import '../../../domain/user_detail/logged_in_user.dart';
import '../../core/big_text.dart';
import '../../core/dimensions.dart';
import '../../core/small_text.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserDetailProvider, LocationProvider>(
      builder: (context, userDetailProvider, locationProvider, _) {
        LoggedInUser loggedInUser = userDetailProvider.loggedInUser;
        int index = locationProvider.index;
        String addressKey = index == 0
            ? 'home'
            : index == 1
                ? 'work'
                : 'currentLocation';
        String address = locationProvider.addressMap[addressKey]!.location!.getOrCrash()!;

        return Container(
          padding: EdgeInsets.all(Dimensions.pixels20),
          margin: EdgeInsets.only(
            top: Dimensions.pixels20,
            bottom: Dimensions.pixels10,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 6,
                spreadRadius: 1,
                color: Colors.grey[300]!,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BigText(
                text: 'Deliver To:',
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: Dimensions.pixels10),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //Name
                  BigText(
                    text: loggedInUser.userName.getOrCrash()!,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(width: Dimensions.pixels10),

                  //selected location
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.pixels5, vertical: 2),
                    child: Center(
                        child: SmallText(
                      text: addressKey,
                      size: Dimensions.font12,
                      color: Colors.black38,
                    )),
                  )
                ],
              ),
              SizedBox(height: Dimensions.pixels5),

              //address
              Text(
                address,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  height: 1.5,
                  fontSize: Dimensions.font16,
                ),
              ),
              SizedBox(height: Dimensions.pixels5),

              //phone number
              Text(
                loggedInUser.phoneNumber.getOrCrash().toString(),
                style: TextStyle(fontSize: Dimensions.font16),
              )
            ],
          ),
        );
      },
    );
  }
}
