import 'package:json_annotation/json_annotation.dart';

part 'campaign.g.dart';

@JsonSerializable()
class Player {
  final int id;
  final String name;
  final String label;
  final DateTime created;
  final DateTime updated;

  Player({this.id, this.name, this.label, this.created, this.updated});

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}

@JsonSerializable()
class Campaign {
  final int id;
  final int player_id;
  final String title;
  final String body;
  final String media_title;
  final String media_url;

  final DateTime start_time;
  final DateTime end_time;
  final DateTime created;
  final DateTime updated;

  Campaign(
      {this.id,
      this.player_id,
      this.title,
      this.body,
      this.media_title,
      this.media_url,
      this.start_time,
      this.end_time,
      this.created,
      this.updated});

  factory Campaign.fromJson(Map<String, dynamic> json) =>
      _$CampaignFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignToJson(this);
}

@JsonSerializable()
class CampaignResult {
  final Player player;
  final Campaign campaign;

  CampaignResult({this.player, this.campaign});

  factory CampaignResult.fromJson(Map<String, dynamic> json) =>
      _$CampaignResultFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignResultToJson(this);
}
