import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/features/settings/data/local_prefs_storage_service.dart';

final storageServiceProvider = Provider((ref) {
  final SharedPrefsService prefsService = SharedPrefsService();
  prefsService.init();
  return prefsService;
});
