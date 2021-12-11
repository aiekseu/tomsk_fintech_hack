import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tomks_fintech_hack/data/company.dart';
import 'package:tomks_fintech_hack/data/request.dart';

final companyProvider = StateProvider<Company?>((ref) => null);

final companyNameProvider = StateProvider<String?>((ref) => '');
final companyINNProvider = StateProvider<String?>((ref) => '');
final companyOGRNProvider = StateProvider<String?>((ref) => '');
final companyOccupationProvider = StateProvider<String?>((ref) => '');
final companyAddressProvider = StateProvider<String?>((ref) => '');
final companyRegDateProvider = StateProvider<String?>((ref) => '');
final companySiteProvider = StateProvider<String?>((ref) => '');
final companyDescProvider = StateProvider<String?>((ref) => '');

final companyIsVerifiedProvider = StateProvider<bool>((ref) => false);

final requestGoalProvider = StateProvider<String?>((ref) => '');
final requestMinPaymentProvider = StateProvider<String?>((ref) => '');
final requestRateProvider = StateProvider<String?>((ref) => '');
final requestSoftCapProvider = StateProvider<String?>((ref) => '');
final requestHardCapProvider = StateProvider<String?>((ref) => '');

final requestsProvider = StateProvider<List<Request?>>((ref) => []);