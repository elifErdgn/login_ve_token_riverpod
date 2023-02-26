import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_riverpod.dart';
import 'login_riverpod.dart';

final loginRiverpod = ChangeNotifierProvider((_) =>LoginRiverpod());
final homeRiverpod = ChangeNotifierProvider((_) => HomeRiverpod());