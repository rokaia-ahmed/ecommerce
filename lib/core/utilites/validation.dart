extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp( r'^\s*(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))*\s*$');
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName{
    final nameRegExp = RegExp(r'^[a-z A-Z]+$');
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword{
    final passwordRegExp =
    RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&,.])[A-Za-z\d@$!%*#?&,.]{8,}$');
    return passwordRegExp.hasMatch(this);
  }
  bool get isValidDate{
    final dateRegExp =
    RegExp(r'^[0-9]{4}-(((0[13578]|(10|12))-(0[1-9]|[1-2][0-9]|3[0-1]))|(02-(0[1-9]|[1-2][0-9]))|((0[469]|11)-(0[1-9]|[1-2][0-9]|30)))$');
    return dateRegExp.hasMatch(this);
  }
  /*bool get isNotNull{
    return this!=null;
  }
*/
  bool get isValidPhone{
    final phoneRegExp = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
    return phoneRegExp.hasMatch(this);
  }

}