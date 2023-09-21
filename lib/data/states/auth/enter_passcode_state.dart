
import 'package:flutter/material.dart';
import '../../constants/enum/view_state.dart';

class EnterPasscodeState extends ChangeNotifier{
  ViewState _state = ViewState.Idle ;
  ViewState get state => _state;

  void setState(ViewState viewState){
    _state = viewState ;
    notifyListeners() ;
  }
}