import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tomks_fintech_hack/data/company.dart';
import 'package:tomks_fintech_hack/data/request.dart';

final CATEGORY_UP = 'category_up';
final CATEGORY_DOWN = 'category_down';
final RATING_UP = 'rating_up';
final RATING_DOWN = 'rating_down';
final RATE_UP = 'rate_up';
final RATE_DOWN = 'rate_down';

final categoryArrowUpProvider = StateProvider<bool>((ref) => true);
final reliabilityArrowUpProvider = StateProvider<bool>((ref) => false);
final rateArrowUpProvider = StateProvider<bool>((ref) => false);
final pressedButtonProvider = StateProvider<String>((ref) => CATEGORY_UP);

final searchCompanyProvider = StateProvider<String>((ref) => "");


// final companiesProvider = FutureProvider((ref) async {
//   final fakeCompanies = [
//     Company(
//         id: 1,
//         inn: '123456789',
//         ogrn: '123456789',
//         name: 'Альфа',
//         occupation: 'Разработка сайтов',
//         description: 'Номер 1 среди web-клубов Томска',
//         address: 'г. Томск ул. Вершинина 39А',
//         registrationDate: DateTime(2016, 10, 1),
//         website: 'alfa.com',
//         photo: 'alfa.jpg',
//         rating: 'AA'),
//     Company(
//         id: 2,
//         inn: '123456789',
//         ogrn: '123456789',
//         name: 'Бета',
//         occupation: 'Разработка андроид приложений',
//         description: 'Команда из Сибири',
//         address: 'г. Томск ул. Вершинина 39А',
//         registrationDate: DateTime(2016, 4, 12),
//         website: 'beta.com',
//         photo: 'alfa.jpg',
//         rating: 'AA'),
//     Company(
//         id: 3,
//         inn: '123456789',
//         ogrn: '123456789',
//         name: 'Гамма',
//         occupation: 'Разработка андроид приложений',
//         description: 'Андроид - наше все',
//         address: 'г. Томск ул. Вершинина 39А',
//         registrationDate: DateTime(2017, 6, 22),
//         website: 'gamma.com',
//         photo: 'alfa.jpg',
//         rating: 'CC'),
//     Company(
//         id: 4,
//         inn: '123456789',
//         ogrn: '123456789',
//         name: 'Кирпич',
//         occupation: 'Разработка онлайн игр',
//         description: 'Разработали ворлд ов тэнкс',
//         address: 'г. Томск ул. Ленина 32',
//         registrationDate: DateTime(2016, 9, 1),
//         website: 'rus.menma.com',
//         photo: 'alfa.jpg',
//         rating: 'B'),
//     Company(
//         id: 5,
//         inn: '123456789',
//         ogrn: '123456789',
//         name: 'Ход конем',
//         occupation: 'Разработка ботов',
//         description: 'Команда из Сибири',
//         address: 'г. Москва ул. Шишкина 3',
//         registrationDate: DateTime(2021, 4, 21),
//         website: 'ford.com',
//         photo: 'alfa.jpg',
//         rating: 'C'),
//   ];

//   return Future.delayed(Duration(seconds: 2)).then((value) => fakeCompanies);
// });

final requestsProvider = FutureProvider<List<Request>>((ref) async {
  final fakeRequests = [
    Request(
        companyName:"ООО Амбит",
        minPayment: 1000,
        rating: "CCC",
        rate: 12.4,
        goal: 'на проект',
        softCap: 900000,
        hardCap: 1000000,
        accumulatedSum: 1000,
        softEndDate: DateTime(2021, 12),
        hardEndDate: DateTime(2022, 2)),
    Request(
        companyName: "ZENNEX",
        minPayment: 1000,
        rating: "AAA",
        rate: 13.7,
        goal: 'На сайт',
        softCap: 900000,
        hardCap: 1000000,
        accumulatedSum: 500000,
        softEndDate: DateTime(2021, 12),
        hardEndDate: DateTime(2022, 2)),
    Request(
        companyName: "АО ГАРАНТ",
        minPayment: 1000,
        rating: "BBB",
        rate: 23.7,
        goal: 'На сайт',
        softCap: 900000,
        hardCap: 1000000,
        accumulatedSum: 870000,
        softEndDate: DateTime(2021, 12),
        hardEndDate: DateTime(2022, 2)),
    // Request(
    //     companyId: 1,
    //     minPayment: 1000,
    //     rate: 12.4,
    //     goal: 'на проект',
    //     softCap: 900000,
    //     hardCap: 1000000,
    //     softEndDate: DateTime(2021, 12),
    //     hardEndDate: DateTime(2022, 2)),
    // Request(
    //     companyId: 2,
    //     minPayment: 1000,
    //     rate: 12.4,
    //     goal: 'На сайт',
    //     softCap: 900000,
    //     hardCap: 1000000,
    //     softEndDate: DateTime(2021, 12),
    //     hardEndDate: DateTime(2022, 2)),
    // Request(
    //     companyId: 1,
    //     minPayment: 1000,
    //     rate: 12.4,
    //     goal: 'на проект',
    //     softCap: 900000,
    //     hardCap: 1000000,
    //     softEndDate: DateTime(2021, 12),
    //     hardEndDate: DateTime(2022, 2)),
    // Request(
    //     companyId: 2,
    //     minPayment: 1000,
    //     rate: 12.4,
    //     goal: 'На сайт',
    //     softCap: 900000,
    //     hardCap: 1000000,
    //     softEndDate: DateTime(2021, 12),
    //     hardEndDate: DateTime(2022, 2)),
    // Request(
    //     companyId: 1,
    //     minPayment: 1000,
    //     rate: 12.4,
    //     goal: 'на проект',
    //     softCap: 900000,
    //     hardCap: 1000000,
    //     softEndDate: DateTime(2021, 12),
    //     hardEndDate: DateTime(2022, 2)),
    // Request(
    //     companyId: 2,
    //     minPayment: 1000,
    //     rate: 12.4,
    //     goal: 'На сайт',
    //     softCap: 900000,
    //     hardCap: 1000000,
    //     softEndDate: DateTime(2021, 12),
    //     hardEndDate: DateTime(2022, 2)),
  ];
  return Future.delayed(Duration(seconds: 2)).then((value) => fakeRequests);
});
