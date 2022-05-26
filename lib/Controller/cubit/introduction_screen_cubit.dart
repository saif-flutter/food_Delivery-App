import 'package:bloc/bloc.dart';
class IntroductionScreenCubit extends Cubit<int> {
  IntroductionScreenCubit(int initialState) : super(0);

  getIntroduction({required index})
  {
    emit(index);
  }

}
