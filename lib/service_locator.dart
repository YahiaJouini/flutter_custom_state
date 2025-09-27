import "package:flutter_custom_state/services/auth_service.dart";
import "package:flutter_custom_state/viewmodels/login_model.dart";
import "package:get_it/get_it.dart";

final GetIt serviceLocator = GetIt.instance;

void setupLocator() {
  // setup services
  // this is a lazy initialization so it won't create a service object until it's provoked
  // after that, the same instance is returned every time.
  serviceLocator.registerLazySingleton<AuthService>(() => AuthService());

  // setup view models
  // serviceLocator<AuthService>() will retrieve AuthService instance and include it with LoginViewModel
  // this is a factory so every time you ask for LoginViewModel, a new instance is created4
  // this is because view models are tied to the lifecycle of a screen
  // each screen has it's own independed viewModel state
  serviceLocator.registerFactory(
    () => LoginViewModel(serviceLocator<AuthService>()),
  );
}
