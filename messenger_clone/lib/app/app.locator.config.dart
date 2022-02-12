// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i5;

import '../model/call_data_model.dart' as _i6;
import '../services/authentication_service.dart' as _i4;
import '../services/database_service.dart' as _i7;
import '../services/image_picker_service.dart' as _i8;
import '../services/thirdparty_services_module.dart' as _i9;
import 'app.router.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.singleton<_i3.AppRouter>(_i3.AppRouter());
  gh.singleton<_i4.AuthenticationService>(_i4.AuthenticationService());
  gh.lazySingleton<_i5.BottomSheetService>(
      () => thirdPartyServicesModule.bottomSheetService);
  gh.lazySingleton<_i6.CallDataModel>(() => _i6.CallDataModel(
      type: get<List<String>>(),
      name: get<List<String>>(),
      imageUrl: get<List<String>>()));
  gh.singleton<_i7.DataBaseService>(_i7.DataBaseService());
  gh.lazySingleton<_i5.DialogService>(
      () => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<_i8.ImagePickerService>(() => _i8.ImagePickerService());
  gh.singleton<_i5.SnackbarService>(thirdPartyServicesModule.snackBarService);
  return get;
}

class _$ThirdPartyServicesModule extends _i9.ThirdPartyServicesModule {
  @override
  _i5.BottomSheetService get bottomSheetService => _i5.BottomSheetService();
  @override
  _i5.DialogService get dialogService => _i5.DialogService();
  @override
  _i5.SnackbarService get snackBarService => _i5.SnackbarService();
}
