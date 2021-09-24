String validateEmail(String email) {
  String _msg;
  RegExp regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (email.isEmpty) {
    _msg = "Email is required";
  } else if (!regex.hasMatch(email)) {
    _msg = "Enter a valid email address";
  }
  return _msg;
}
