import 'package:tomks_fintech_hack/constants/pages_ids.dart';
import 'package:tomks_fintech_hack/constants/pages_names.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userNameProvider = Provider((ref) => 'Алексей Кудашкин');
final userEmailProvider = Provider((ref) => 'avk224@tpu.ru');
final userPhoneProvider = Provider((ref) => '+7 (908) 954-76-94');
final userDateBirthProvider = Provider<DateTime>((ref) => DateTime(2000, 10, 14));
final userPositionProvider = Provider((ref) => 'Android-разработчик');

final userCompleteIntroductionProvider = StateProvider((ref) => false);

final bottomNavIndexProvider = StateProvider<int>((ref) {
  if (ref.watch(userCompleteIntroductionProvider).state)
    return MAIN_PAGE;
  else
    return 0;
});

final pageNameProvider = StateProvider<String?>((ref) {
  switch (ref.watch(bottomNavIndexProvider).state) {
    case MAIN_PAGE : {
      return MAIN_PAGE_NAME;
    }
  }
});

