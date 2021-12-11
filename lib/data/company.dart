class Company {
  int id;
  String inn;
  String ogrn;
  String companyName;
  int ownerId;
  String occupation;
  String description;
  String address;
  DateTime registrationDate;
  String website;
  String photo;
  String rating;

  Company(
      {required this.id,
      required this.inn,
      required this.ogrn,
      required this.companyName,
      required this.ownerId,
      required this.occupation,
      required this.description,
      required this.address,
      required this.registrationDate,
      required this.website,
      required this.photo,
      required this.rating}) {}
}
