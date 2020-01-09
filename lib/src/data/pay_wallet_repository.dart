import 'package:pay_wallet/src/data/model/campaign.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:pay_wallet/src/data/model/response_result.dart';

abstract class PayWalletRepository {
  Future<List<CampaignResult>> fetchCampaigns();
}

class PayWalletRepositoryImpl extends PayWalletRepository {
  static const String url = 'https://pay.hackerth.com/api/campaign';

  @override
  Future<List<CampaignResult>> fetchCampaigns() {
    return http.get(url).then((response) {
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        var result = ResponseResult(result: jsonResponse['result']);
        return List.from(result.result)
            .map((r) => CampaignResult.fromJson(r))
            .toList();
      } else {
        throw Error();
      }
    });
  }
}
