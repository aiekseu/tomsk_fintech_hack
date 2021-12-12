import 'package:tomks_fintech_hack/constants/pages_ids.dart';
import 'package:tomks_fintech_hack/constants/pages_names.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userNameProvider = Provider((ref) => 'Алексей Кудашкин');
final userEmailProvider = Provider((ref) => 'avk224@tpu.ru');
final userPhoneProvider = Provider((ref) => '+7 (908) 954-76-94');
final userDateBirthProvider =
    Provider<DateTime>((ref) => DateTime(2000, 10, 14));
final userPositionProvider = Provider((ref) => 'Android-разработчик');

final userCompleteIntroductionProvider = StateProvider((ref) => true); //TODO: false
final userCompleteAuthenticationProvider = StateProvider((ref) => true); //TODO: false
final userVerifiedProvider = StateProvider((ref) => false);

final bottomNavIndexProvider = StateProvider<int>((ref) {
  if (!ref.watch(userCompleteIntroductionProvider).state) return INTRODUCTION_PAGE;
  if (!ref.watch(userCompleteAuthenticationProvider).state) return AUTH_PAGE;
  return MARKET_PAGE;
});

final pageNameProvider = StateProvider<String?>((ref) {
  switch (ref.watch(bottomNavIndexProvider).state) {
    case PORTFOLIO_PAGE:
      {
        return PORTFOLIO_PAGE_NAME;
      }
    case MARKET_PAGE:
      {
        return MARKET_PAGE_NAME;
      }
    case MY_COMPANY_PAGE:
      {
        return MY_COMPANY_PAGE_NAME;
      }
    case FEED_PAGE:
      {
        return FEED_PAGE_NAME;
      }
    case FAQ_PAGE:
      {
        return FAQ_PAGE_NAME;
      }
  }
});
