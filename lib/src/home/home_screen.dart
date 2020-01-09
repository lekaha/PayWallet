import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_wallet/src/home/campaign.dart';
import 'package:pay_wallet/src/home/index.dart';
import 'package:pay_wallet/src/utils.dart';

import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
    @required HomeBloc homeBloc,
  })  : _homeBloc = homeBloc,
        super(key: key);

  final HomeBloc _homeBloc;

  @override
  HomeScreenState createState() {
    return HomeScreenState(_homeBloc);
  }
}

class HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc;
  HomeScreenState(this._homeBloc);

  @override
  void initState() {
    super.initState();
    this._load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        bloc: widget._homeBloc,
        builder: (
          BuildContext context,
          HomeState currentState,
        ) {
          if (currentState is UnHomeState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorHomeState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ackAlert(context, currentState.errorMessage);
            });
          }

          List<CampaignViewModel> list = [];
          if (currentState is InHomeState) {
            list = currentState.campaigns;
          }

          return Center(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  if (index >= list.length) {
                    return null;
                  }

                  return _buildCampaignItem(context, list[index]);
                }),
          );
        });
  }

  Widget _buildCampaignItem(context, CampaignViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          GestureDetector(
              onTap: () {
                _launchAppLink(viewModel.appLink);
              },
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  viewModel.campaignLogoPath,
                  fit: BoxFit.fill,
                  width: 64,
                  height: 64,
                ),
              )),
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    _launchUrl(viewModel.campaign.campaign.media_url);
                  },
                  child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: (viewModel.campaign.campaign != null)
                            ? <Widget>[
                                Text(viewModel.campaign.campaign.title,
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      color: Color(0xFF222222),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                    )),
                                (viewModel.campaign.campaign.start_time !=
                                            null ||
                                        viewModel.campaign.campaign.end_time !=
                                            null)
                                    ? Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Text(
                                            '${formatDate(viewModel.campaign.campaign.start_time, [
                                              yyyy,
                                              '-',
                                              mm,
                                              '-',
                                              dd
                                            ])}~${formatDate(viewModel.campaign.campaign.end_time, [
                                              yyyy,
                                              '-',
                                              mm,
                                              '-',
                                              dd
                                            ])}',
                                            softWrap: true,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                              color: Color(0xFFAAAAAA),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 10,
                                            )))
                                    : Container()
                              ]
                            : <Widget>[Text('キャンペーン情報なし')],
                      )))),
        ],
      ),
    );
  }

  void _load([bool isError = false]) {
    widget._homeBloc.add(UnHomeEvent());
    widget._homeBloc.add(LoadHomeEvent(isError));
  }

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      final snackBar = SnackBar(content: Text('Couldn\'t launch URL'));
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  void _launchAppLink(AppLink appLink) async {
    if (await canLaunch(appLink.launchLink)) {
      await launch(appLink.launchLink);
    } else {
      await launch(appLink.storeUrl);
    }
  }
}
