import 'package:dartz/dartz.dart';
import 'package:foodiee_app/domain/navigation_guide/navigation_failure.dart';
import 'package:foodiee_app/domain/navigation_guide/navigation_options.dart';

abstract class INavigationGuideRepo {
  Future<Either<NavigationFailure, NavigationOption>> getGuide();
}
