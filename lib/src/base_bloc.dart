import 'package:bloc/bloc.dart';
import 'package:pay_wallet/src/data/pay_wallet_repository.dart';

abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  PayWalletRepository repository;
  BaseBloc() {
    repository = PayWalletRepositoryImpl();
  }
}
