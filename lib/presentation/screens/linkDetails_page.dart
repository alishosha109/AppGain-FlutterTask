import 'package:appgain_flutter_app/business_logic/cubit/short_links_cubit.dart';
import 'package:appgain_flutter_app/business_logic/cubit/token_cubit.dart';
import 'package:appgain_flutter_app/constants/strings.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../data/models/shortlink.dart';

import 'dart:ui';

class LinkDetailsPage extends StatefulWidget {
  LinkDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LinkDetailsPage> createState() => _LinkDetailsPageState();
}

class _LinkDetailsPageState extends State<LinkDetailsPage> {
  bool loading = true;
  late ShortLink mainlink;

  Widget buildBlocWidget() {
    // BlocProvider.of<ShortLinksCubit>(context).getToken();
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    BlocProvider.of<ShortLinksCubit>(context).getOneLink(arg['linkID']);

    return BlocConsumer<ShortLinksCubit, ShortLinksState>(
        listener: (context, state) {
      if (state is linkLoaded) {
        mainlink = state.link;
        loading = false;
      }
    }, builder: (context, state) {
      if (state is linkLoaded) {
        return buildLoadedScrollerWidget();
      } else {
        return buildLoadedScrollerWidget();
      }
    });
  }

  Widget buildLoadedScrollerWidget() {
    return loading
        ? Center(
            child: SpinKitFadingFour(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.white : Colors.grey,
                  ),
                );
              },
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Slug: ${mainlink.slug}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Web: ${mainlink.web}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "IOS Primary: ${mainlink.ios!.primary}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "IOS Fallback: ${mainlink.ios!.fallback}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Android Primary: ${mainlink.android!.primary}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Android Fallback: ${mainlink.android!.fallback}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
            ],
          );
  }

  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      key: _key,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        // automaticallyImplyLeading: false,
        title: const Text('AppGain'),
      ),
      body: buildBlocWidget(),
    );
  }
}
