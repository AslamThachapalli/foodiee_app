import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../domain/navigation_guide/navigation_failure.dart';
import '../../domain/navigation_guide/i_navigation_guide_repo.dart';
import '../../domain/navigation_guide/navigation_options.dart';

@injectable
class NavigationGuideProvider with ChangeNotifier {
  final INavigationGuideRepo _navigationGuideRepo;
  NavigationGuideProvider(this._navigationGuideRepo);

  Future<Either<NavigationFailure, NavigationOption>> checkOutButtonPressed() async {
    Either<NavigationFailure, NavigationOption> whereTo = await _navigationGuideRepo.getGuide();
    return whereTo;
  }
}
