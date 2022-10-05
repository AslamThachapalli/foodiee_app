import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../../application/location/location_provider.dart';
import '../core/app_colors.dart';
import '../core/big_text.dart';
import '../core/dimensions.dart';
import '../core/no_data_widget.dart';
import './widgets/display_widget.dart';
import './widgets/image_preview_widget.dart';
import './widgets/choose_location_widget.dart';
import './widgets/bottom_nav_bar_widget.dart';

class SelectLocationScreen extends StatefulWidget {
  final bool? isPaying;
  final String userName;
  final int phoneNumber;
  const SelectLocationScreen({
    Key? key,
    this.isPaying = false,
    required this.userName,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then(
      (_) async =>
          await Provider.of<LocationProvider>(context, listen: false).getLocationCoordinates(),
    );
  }

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
            Get.back();
          },
        ),
      ),
      body: Consumer<LocationProvider>(
        builder: (context, locationProvider, _) {
          int selectedIndex = locationProvider.index;
          String key = selectedIndex == 0
              ? 'home'
              : selectedIndex == 1
                  ? 'work'
                  : 'currentLocation';
          return locationProvider.locationData == null
              ? const NoDataWidget(
                  text: 'Please Turn On Location Service',
                  imagePath: 'assets/images/no_location.jpg',
                )
              : Column(
                  children: [
                    //Preview Image Container
                    ImagePreviewWidget(
                      locationProvider: locationProvider,
                    ),

                    //Select locationType icons
                    ChooseLocationWidget(selectedIndex: selectedIndex),
                    SizedBox(height: Dimensions.pixels20),

                    //Address display
                    DisplayWidget(
                      text: locationProvider.addressMap[key]?.location!.getOrCrash() ??
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
      bottomNavigationBar: BottomNavBarWidget(isPaying: widget.isPaying!),
    );
  }
}
