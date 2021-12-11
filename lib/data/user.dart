class User {
  int id;
  String fullName;
  String email;
  String phoneNumber;
  String password;
  int passportSerial;
  int passportNum;
  DateTime birthday;
  bool isVerified = false;

  User(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.phoneNumber,
      this.password = "",
      required this.passportSerial,
      required this.passportNum,
      required this.birthday,
      this.isVerified = false}) {}

  setVerified() {
    this.isVerified = true;
  }
}
