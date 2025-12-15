part of 'ce_bloc.dart';

@freezed
abstract class CeState with _$CeState {
  const factory CeState.initial({
    CeRequirement? ceRequirement,
  }) = _Initial;
}
