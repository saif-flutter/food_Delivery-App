import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';



class BottomNavigationBarCubit extends Cubit<int> {
  BottomNavigationBarCubit(int initialState) : super(initialState);

  getIndex({required index}){

    emit(index);
  }

}
