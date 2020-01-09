import 'dart:async';
import 'dart:developer' as developer;

import 'package:pay_wallet/src/base_bloc.dart';
import 'package:pay_wallet/src/data/model/campaign.dart';
import 'package:pay_wallet/src/home/index.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  static final HomeBloc _homeBlocSingleton = HomeBloc._internal();
  factory HomeBloc() {
    return _homeBlocSingleton;
  }
  HomeBloc._internal();

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  HomeState get initialState => UnHomeState(0);

  Future<List<CampaignResult>> getCampaigns() {
    return repository.fetchCampaigns();
  }

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    try {
      yield await event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'HomeBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
