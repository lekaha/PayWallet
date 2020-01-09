import 'dart:async';
import 'dart:developer' as developer;

import 'package:pay_wallet/src/data/model/campaign.dart';
import 'package:pay_wallet/src/home/campaign.dart';
import 'package:pay_wallet/src/home/index.dart';
import 'package:meta/meta.dart';
import 'package:pay_wallet/src/utils.dart';

import '../constants.dart';

@immutable
abstract class HomeEvent {
  Future<HomeState> applyAsync({HomeState currentState, HomeBloc bloc});
}

class UnHomeEvent extends HomeEvent {
  @override
  Future<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async {
    return UnHomeState(0);
  }
}

class LoadHomeEvent extends HomeEvent {
  final bool isError;
  @override
  String toString() => 'LoadHomeEvent';

  LoadHomeEvent(this.isError);

  @override
  Future<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async {
    try {
      if (currentState is InHomeState) {
        return currentState.getNewVersion();
      }
      // await Future.delayed(Duration(seconds: 2));
      List<CampaignResult> results = await bloc.getCampaigns();
      return InHomeState(0, results.map(_toCampaignViewModel).toList());
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadHomeEvent', error: _, stackTrace: stackTrace);
      return ErrorHomeState(0, _?.toString());
    }
  }

  CampaignViewModel _toCampaignViewModel(CampaignResult result) {
    return CampaignViewModel(
      campaign: result,
      campaignLogoPath: switchTo(result.player.label, {
        'origamipay': 'assets/${result.player.label}.png',
        'linepay': 'assets/${result.player.label}.png',
        'paypay': 'assets/${result.player.label}.png',
        'rakutenpay': 'assets/${result.player.label}.png',
        'merpay': 'assets/${result.player.label}.png',
        'dpay': 'assets/${result.player.label}.png',
        'yuchopay': 'assets/${result.player.label}.png',
        'famipay': 'assets/${result.player.label}.png',
        'payidpay': 'assets/${result.player.label}.png',
        'pixivpay': 'assets/${result.player.label}.png',
        'kyashpay': 'assets/${result.player.label}.png',
        'googlepay': 'assets/${result.player.label}.png',
        'alipay': 'assets/${result.player.label}.png',
        'wechatpay': 'assets/${result.player.label}.png',
      }),
      appLink: switchTo(result.player.label, {
        'origamipay': AppLink(
            launchLink: APP_URL_ORIGAMI,
            storeUrl: isAndroid() ? PLAY_STORE_ORIGAMI : APP_STORE_ORIGAMI),
        'linepay': AppLink(
            launchLink: APP_URL_LINE,
            storeUrl: isAndroid() ? PLAY_STORE_LINE : APP_STORE_LINE),
        'paypay': AppLink(
            launchLink: APP_URL_PAYPAY,
            storeUrl: isAndroid() ? PLAY_STORE_PAYPAY : APP_STORE_PAYPAY),
        'rakutenpay': AppLink(
            launchLink: APP_URL_RAKUTEN,
            storeUrl: isAndroid() ? PLAY_STORE_RAKUTEN : APP_STORE_RAKUTEN),
        'merpay': AppLink(launchLink: '', storeUrl: ''),
        'dpay': AppLink(launchLink: '', storeUrl: ''),
        'yuchopay': AppLink(launchLink: '', storeUrl: ''),
        'famipay': AppLink(launchLink: '', storeUrl: ''),
        'payidpay': AppLink(
            launchLink: APP_URL_PAYID,
            storeUrl: isAndroid() ? PLAY_STORE_PAYID : APP_STORE_PAYID),
        'pixivpay': AppLink(
            launchLink: APP_URL_PIXIV,
            storeUrl: isAndroid() ? PLAY_STORE_PIXIV : APP_STORE_PIXIV),
        'kyashpay': AppLink(launchLink: '', storeUrl: ''),
        'googlepay': AppLink(launchLink: '', storeUrl: ''),
        'alipay': AppLink(
            launchLink: APP_URL_ALIPAY,
            storeUrl: isAndroid() ? PLAY_STORE_ALIPAY : APP_STORE_ALIPAY),
        'wechatpay': AppLink(
            launchLink: APP_URL_WECHAT,
            storeUrl: isAndroid() ? PLAY_STORE_WECHAT : APP_STORE_WECHAT),
      }),
    );
  }
}
