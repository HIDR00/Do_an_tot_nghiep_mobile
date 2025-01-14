import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'google_map_state.freezed.dart';

@freezed
class GoogleMapState extends BaseBlocState with _$GoogleMapState {
  const GoogleMapState._();

  const factory GoogleMapState({
    @Default('') String id,
  }) = _GoogleMapState;
}
