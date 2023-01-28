import 'package:appgain_flutter_app/business_logic/cubit/short_links_cubit.dart';
import 'package:appgain_flutter_app/business_logic/cubit/token_cubit.dart';
import 'package:appgain_flutter_app/constants/strings.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../data/models/shortlink.dart';

import 'dart:ui';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool token = false;

  Widget buildBlocWidget() {
    // BlocProvider.of<ShortLinksCubit>(context).getToken();
    // BlocProvider.of<TokenCubit>(context).getToken();

    return BlocConsumer<TokenCubit, TokenState>(listener: (context, state) {
      if (state is gotToken) {
        token = true;
      }
    }, builder: (context, state) {
      return buildLoadedScrollerWidget();
    });
  }

  Widget buildLoadedScrollerWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              BlocProvider.of<TokenCubit>(context).getToken();
            },
            child: const Center(
              child: Text(
                'Get Token',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: token == false
                ? null
                : () {
                    Navigator.of(context).pushNamed(linksScreen);
                  },
            child: const Center(
              // ignore: unnecessary_const
              child: Text(
                'Get ShortLinks',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: token == false
                ? null
                : () {
                    Navigator.of(context).pushNamed(addLinkScreen);
                  },
            child: const Center(
              // ignore: unnecessary_const
              child: Text(
                'Add ShortLink',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      key: _key,
      body: buildBlocWidget(),
    );
  }
}
