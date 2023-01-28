import 'dart:async';

import 'package:appgain_flutter_app/business_logic/cubit/short_links_cubit.dart';
import 'package:appgain_flutter_app/business_logic/cubit/token_cubit.dart';
import 'package:appgain_flutter_app/data/apis/links_apis.dart';
import 'package:appgain_flutter_app/data/apis/token_apis.dart';
import 'package:appgain_flutter_app/data/repos/links_repo.dart';
import 'package:appgain_flutter_app/data/repos/tokens_repo.dart';
import 'package:appgain_flutter_app/presentation/screens/addShortlink_page.dart';
import 'package:appgain_flutter_app/presentation/screens/home_page.dart';
import 'package:appgain_flutter_app/presentation/screens/linkDetails_page.dart';
import 'package:flutter/material.dart';
import 'constants/strings.dart';
import 'presentation/screens/shortlinks_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appgain_flutter_app/constants/globals.dart' as globals;

Future<void> main() async {
  runApp(AppGainApp());
}

class AppGainApp extends StatelessWidget {
  const AppGainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        homePageScreen: (context) => BlocProvider(
              create: (context) => TokenCubit(tokensRepo(tokenApis())),
              child: HomePage(),
            ),
        linksScreen: (context) => BlocProvider(
              create: (context) => ShortLinksCubit(linksRepo(linksApis())),
              child: ShortLinksPage(),
            ),
        linkDetailsScreen: (context) => BlocProvider(
              create: (context) => ShortLinksCubit(linksRepo(linksApis())),
              child: LinkDetailsPage(),
            ),
        addLinkScreen: (context) => BlocProvider(
              create: (context) => ShortLinksCubit(linksRepo(linksApis())),
              child: AddShortLinkPage(),
            ),
      },
    );
  }
}
