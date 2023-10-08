import 'package:dartz/dartz.dart';
import 'package:note_app/core/error/failures.dart';
import 'package:note_app/features/settings/domain/entities/setting.dart';

abstract class SettingRepository {
  Future<Either<Failure, Setting>> getSetting();

  Future<Either<Failure, void>> changeAppThemeMode(AppThemeMode appThemeMode);
}