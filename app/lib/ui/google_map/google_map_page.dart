import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../app.dart';
import 'bloc/google_map.dart';

@RoutePage()
class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GoogleMapPageState();
  }
}

class _GoogleMapPageState extends BasePageState<GoogleMapPage, GoogleMapBloc> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    super.initState();
    bloc.add(const GoogleMapPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: BlocBuilder<GoogleMapBloc, GoogleMapState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: <Marker>{
              const Marker(
                markerId: MarkerId('1'),
                position:  LatLng(37.42796133580664, -122.085749655962),
              ),
            },
          );
        },
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
