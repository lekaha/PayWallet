// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return Player(
    id: json['id'] as int,
    name: json['name'] as String,
    label: json['label'] as String,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    updated: json['updated'] == null
        ? null
        : DateTime.parse(json['updated'] as String),
  );
}

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'label': instance.label,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
    };

Campaign _$CampaignFromJson(Map<String, dynamic> json) {
  return Campaign(
    id: json['id'] as int,
    player_id: json['player_id'] as int,
    title: json['title'] as String,
    body: json['body'] as String,
    media_title: json['media_title'] as String,
    media_url: json['media_url'] as String,
    start_time: json['start_time'] == null
        ? null
        : DateTime.parse(json['start_time'] as String),
    end_time: json['end_time'] == null
        ? null
        : DateTime.parse(json['end_time'] as String),
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    updated: json['updated'] == null
        ? null
        : DateTime.parse(json['updated'] as String),
  );
}

Map<String, dynamic> _$CampaignToJson(Campaign instance) => <String, dynamic>{
      'id': instance.id,
      'player_id': instance.player_id,
      'title': instance.title,
      'body': instance.body,
      'media_title': instance.media_title,
      'media_url': instance.media_url,
      'start_time': instance.start_time?.toIso8601String(),
      'end_time': instance.end_time?.toIso8601String(),
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
    };

CampaignResult _$CampaignResultFromJson(Map<String, dynamic> json) {
  return CampaignResult(
    player: json['player'] == null
        ? null
        : Player.fromJson(json['player'] as Map<String, dynamic>),
    campaign: json['campaign'] == null
        ? null
        : Campaign.fromJson(json['campaign'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CampaignResultToJson(CampaignResult instance) =>
    <String, dynamic>{
      'player': instance.player,
      'campaign': instance.campaign,
    };
