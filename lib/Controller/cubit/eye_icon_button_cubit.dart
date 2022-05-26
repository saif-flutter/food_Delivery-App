import 'package:bloc/bloc.dart';
class EyeIconButtonCubit extends Cubit<bool> {
  EyeIconButtonCubit(bool initialState) : super(initialState);
  getIcon({required test})
  {
    emit(test);
  }

}
