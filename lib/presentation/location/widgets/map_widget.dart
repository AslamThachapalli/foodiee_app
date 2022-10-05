import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../../application/location/location_provider.dart';
import '../../core/dimensions.dart';

class MapWidget extends StatelessWidget {
  final LocationData locationData;
  const MapWidget({
    Key? key,
    required this.locationData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context, listen: false);
    return FlutterMap(
      options: MapOptions(
        center: LatLng(
          locationData.latitude!,
          locationData.longitude!,
        ),
        onTap: (_, position) async {
          await locationProvider.displayAddressOnMap(
              latitude: position.latitude, longitude: position.longitude);
          locationProvider.updatePickedLocation(position);
        },
        zoom: 13,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate:
              'https://api.mapbox.com/styles/v1/knowaslamts/cl8tvtkn300gn14lj0of9iirm/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia25vd2FzbGFtdHMiLCJhIjoiY2w4dHZpZDMyMGI3aTN1bW5ydnBqcDFkeCJ9.ToIUkDmXTw7BTbhwAy_87Q',
          additionalOptions: {
            'accessToken':
                'pk.eyJ1Ijoia25vd2FzbGFtdHMiLCJhIjoiY2w4dHZpZDMyMGI3aTN1bW5ydnBqcDFkeCJ9.ToIUkDmXTw7BTbhwAy_87Q',
            'id': 'mapbox.mapbox-streets-v8',
          },
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              point: Provider.of<LocationProvider>(context).pickedLocation ??
                  LatLng(
                    locationData.longitude!,
                    locationData.longitude!,
                  ),
              builder: (ctx) => Icon(
                Icons.location_pin,
                color: Colors.red.shade900,
                size: Dimensions.pixels30,
              ),
            ),
          ],
        )
      ],
    );
  }
}
