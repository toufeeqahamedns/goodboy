import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodboy/blocs/base_bloc_event.dart';
import 'package:goodboy/blocs/base_bloc_state.dart';
import 'package:goodboy/providers/base_provider.dart';
import 'package:goodboy/providers/dialofflow_provider.dart';
import 'package:goodboy/providers/googleAPIs_auth_provider.dart';

class BaseBloc extends Bloc<BaseBlocEvent, BaseBlocState> {
  final GoogleAPIsAuthProvider _googleAPIsAuthProvider;
  final DialogFlowProvider _dialogFlowProvider;
  final BaseProvider _baseProvider;

  BaseBloc({
    @required GoogleAPIsAuthProvider googleAPIsAuthProvider,
    @required DialogFlowProvider dialogFlowProvider,
    @required BaseProvider baseProvider,
  })  : assert(googleAPIsAuthProvider != null),
        assert(dialogFlowProvider != null),
        assert(baseProvider != null),
        _googleAPIsAuthProvider = googleAPIsAuthProvider,
        _dialogFlowProvider = dialogFlowProvider,
        _baseProvider = baseProvider,
        super(AppUnintialized());

  @override
  Stream<BaseBlocState> mapEventToState(BaseBlocEvent event) async* {
    if (event is InitializeApp) {
      yield* _mapInitializeAppToState();
    }
  }

  Stream<BaseBlocState> _mapInitializeAppToState() async* {
    try {
      await _googleAPIsAuthProvider.authenticate();

      // Doing this for only one time as this is app initialization
      final dynamic res = await _dialogFlowProvider.detectIntent("Hello");

      await _baseProvider.initiateFirstIntent(res);

      yield AppInitialized();
    } catch (e) {
      print(e);
      yield SomethingWentWrong();
    }
  }
}
