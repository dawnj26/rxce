part of 'ce_bloc.dart';

@freezed
abstract class CeEvent with _$CeEvent {
  const factory CeEvent.changed(CeRequirement? ceRequirement) = _Changed;
}
