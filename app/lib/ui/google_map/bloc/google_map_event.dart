import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'google_map_event.freezed.dart';

abstract class GoogleMapEvent extends BaseBlocEvent {
  const GoogleMapEvent();
}

@freezed
class GoogleMapPageInitiated extends GoogleMapEvent with _$GoogleMapPageInitiated {
  const factory GoogleMapPageInitiated() = _GoogleMapPageInitiated;
}
