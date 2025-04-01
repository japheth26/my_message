import 'package:flutter_test/flutter_test.dart';
import 'package:my_message/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('RecentChatsServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
