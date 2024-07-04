part of 'get_wheather_cubit.dart';

@immutable
sealed class GetWheatherState {}

final class WheatherInitialState extends GetWheatherState {}

final class WheatherLoadingState extends GetWheatherState {}

final class WheatherLoadedState extends GetWheatherState {}

final class WheatherFailedState extends GetWheatherState {
  final String errMessage;

  WheatherFailedState({required this.errMessage});
}
