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
  // String rating;

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
      // required this.rating
      });
}

final FAKE_COMPANY = new Company(
    inn: '666666666',
    ogrn: '666666666',
    name: 'КриптоЗайм',
    occupation: "Микрозаймы",
    description: "Микрозаймы в криптовалюте",
    address: "г. Томск, бизнес инкубатор Дружба",
    registrationDate: DateTime(2000, 10, 14),
    website: "2ch.hk",
    // photo: "photo",
    // rating: 'AA'
);

