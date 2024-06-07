part of 'get_wheather_cubit.dart';

@immutable
sealed class GetWheatherState {}

final class GetWheatherInitial extends GetWheatherState {}

final class NoWheatherState extends GetWheatherState {}

final class WheatherLoadedState extends GetWheatherState {}

final class WheatherFailedState extends GetWheatherState {}
