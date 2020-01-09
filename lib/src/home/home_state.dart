import 'package:equatable/equatable.dart';
import 'package:pay_wallet/src/home/campaign.dart';

abstract class HomeState extends Equatable {
  /// notify change state without deep clone state
  final int version;

  final List propss;
  HomeState(this.version, [this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  HomeState getStateCopy();

  HomeState getNewVersion();

  @override
  List<Object> get props => (propss);
}

/// UnInitialized
class UnHomeState extends HomeState {
  UnHomeState(int version) : super(version);

  @override
  String toString() => 'UnHomeState';

  @override
  UnHomeState getStateCopy() {
    return UnHomeState(0);
  }

  @override
  UnHomeState getNewVersion() {
    return UnHomeState(version + 1);
  }
}

/// Initialized
class InHomeState extends HomeState {
  final List<CampaignViewModel> campaigns;

  InHomeState(int version, this.campaigns) : super(version, [campaigns]);

  @override
  String toString() => 'InHomeState campaigns size = ${campaigns.length}';

  @override
  InHomeState getStateCopy() {
    return InHomeState(this.version, this.campaigns);
  }

  @override
  InHomeState getNewVersion() {
    return InHomeState(version + 1, this.campaigns);
  }
}

class ErrorHomeState extends HomeState {
  final String errorMessage;

  ErrorHomeState(int version, this.errorMessage)
      : super(version, [errorMessage]);

  @override
  String toString() => 'ErrorHomeState';

  @override
  ErrorHomeState getStateCopy() {
    return ErrorHomeState(this.version, this.errorMessage);
  }

  @override
  ErrorHomeState getNewVersion() {
    return ErrorHomeState(version + 1, this.errorMessage);
  }
}
