

import 'package:flutter/cupertino.dart';

class RoleService with ChangeNotifier{
String _role='USER_ROLE' ;

String get role =>this._role;
set role(String role){
  this._role= role;
  notifyListeners();
}

void userDefault(){
  this._role='USER_ROLE';
  notifyListeners();
}

}