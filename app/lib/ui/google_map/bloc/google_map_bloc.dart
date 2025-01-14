import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'google_map.dart';
  
@Injectable()
class GoogleMapBloc extends BaseBloc<GoogleMapEvent, GoogleMapState> {
  GoogleMapBloc() : super(const GoogleMapState()) {
    on<GoogleMapPageInitiated>(
      _onGoogleMapPageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onGoogleMapPageInitiated(
    GoogleMapPageInitiated event,
    Emitter<GoogleMapState> emit,
  ) async {
    
  }
}
