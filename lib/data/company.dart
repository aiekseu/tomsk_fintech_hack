class Company {
  int id;
  String inn;
  String ogrn;
  String name;
  String occupation;
  String description;
  String address;
  DateTime registrationDate;
  String website;
  // String photo;
  String rating;

  Company(
      {this.id = -1,
      required this.inn,
      required this.ogrn,
      required this.name,
      required this.occupation,
      required this.description,
      required this.address,
      required this.registrationDate,
      required this.website,
      // required this.photo,
      required this.rating
      });
}
