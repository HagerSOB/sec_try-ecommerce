import 'package:ecommerce/views/navBar/logic/nav-bar-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarCubit extends Cubit<NavBarState>{
  NavBarCubit(): super(NavBarInitial());
  int currentIndex=0;
  void changeCurrentIndex(int index){
    currentIndex = index;
    emit(IndexChenged());
  }
}