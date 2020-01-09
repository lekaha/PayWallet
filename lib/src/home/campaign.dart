import 'package:pay_wallet/src/data/model/campaign.dart';

class CampaignViewModel {
  final CampaignResult campaign;
  final String campaignLogoPath;
  final AppLink appLink;

  CampaignViewModel({this.campaign, this.campaignLogoPath, this.appLink});
}

class AppLink {
  final String launchLink;
  final String storeUrl;

  AppLink({this.launchLink, this.storeUrl});
}
