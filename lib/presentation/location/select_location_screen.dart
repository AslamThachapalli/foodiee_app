import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../../application/location/location_provider.dart';
import '../core/app_colors.dart';
import '../core/big_text.dart';
import '../core/dimensions.dart';
import '../routes/route_helper.dart';
import './widgets/display_widget.dart';
import './widgets/image_preview_widget.dart';
import './widgets/choose_location_widget.dart';
import './widgets/bottom_nav_bar_widget.dart';

class SelectLocationScreen extends StatefulWidget {
  final bool isPaying;
  final bool isFromCart;
  final String userName;
  final int phoneNumber;
  const SelectLocationScreen({
    Key? key,
    required this.isPaying,
    required this.userName,
    required this.phoneNumber,
    required this.isFromCart,
  }) : super(key: key);

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  bool isInitial = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInitial) {
      Provider.of<LocationProvider>(context, listen: false)
          .getPreviewImage(addressMap: Provider.of<LocationProvider>(context).addressMap);
      isInitial = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: 'Select Location',
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            widget.isFromCart ? Get.toNamed(RouteHelper.getCartScreen()) : Get.back();
          },
        ),
      ),
      body: Consumer<LocationProvider>(
        builder: (context, locationProvider, _) {
          int selectedIndex = locationProvider.index;
          String addressKey = selectedIndex == 0
              ? 'home'
              : selectedIndex == 1
                  ? 'work'
                  : 'currentLocation';
          return Column(
            children: [
              //Preview Image Container
              ImagePreviewWidget(
                locationProvider: locationProvider,
                addressKey: addressKey,
              ),

              //Select locationType icons
              ChooseLocationWidget(selectedIndex: selectedIndex),
              SizedBox(height: Dimensions.pixels20),

              //Address display
              DisplayWidget(
                text: locationProvider.addressMap[addressKey]!.location?.getOrCrash() ??
                    "No Location Added Yet",
                icon: Icons.library_books_rounded,
                backgroundColor: Colors.red,
              ),

              //UserName display
              DisplayWidget(
                text: widget.userName,
                icon: Icons.person,
              ),

              //PhoneNumber display
              DisplayWidget(
                text: widget.phoneNumber.toString(),
                icon: Icons.phone,
                backgroundColor: AppColors.yellowColor,
              )
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavBarWidget(isPaying: widget.isPaying),
    );
  }
}
