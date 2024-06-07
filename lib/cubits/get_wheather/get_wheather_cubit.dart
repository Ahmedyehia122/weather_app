import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_wheather_state.dart';

class GetWheatherCubit extends Cubit<GetWheatherState> {
  GetWheatherCubit() : super(NoWheatherState());
}
