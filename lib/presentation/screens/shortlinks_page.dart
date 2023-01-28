import 'package:appgain_flutter_app/business_logic/cubit/short_links_cubit.dart';
import 'package:appgain_flutter_app/constants/strings.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../data/models/shortlink.dart';

import 'dart:ui';

class ShortLinksPage extends StatefulWidget {
  ShortLinksPage({
    Key? key,
  }) : super(key: key);
  @override
  State<ShortLinksPage> createState() => _ShortLinksPageState();
}

class _ShortLinksPageState extends State<ShortLinksPage> {
  late List<ShortLink> shortlinks;
  bool loading = true;

  Widget buildBlocWidget() {
    // BlocProvider.of<ShortLinksCubit>(context).getToken();
    BlocProvider.of<ShortLinksCubit>(context).getAllShortLinks();

    return BlocConsumer<ShortLinksCubit, ShortLinksState>(
        listener: (context, state) {
      if (state is linksLoaded) {
        shortlinks = state.links;
        loading = false;
      }
    }, builder: (context, state) {
      if (state is linksLoading) {
        return buildLoadedScrollerWidget();
      } else if (state is linksEmpty) {
        shortlinks = [];
        return buildNoPostsWidget();
      } else {
        return buildLoadedScrollerWidget();
      }
    });
  }

  Widget buildNoPostsWidget() {
    return SingleChildScrollView(
      child: Center(
        child: Container(
            // color: Colors.black,
            child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            const Text(
              "No Links",
            ),
          ],
        )),
      ),
    );
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
        : ListView.builder(
            itemCount: shortlinks.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () async {
                      Navigator.pushNamed(
                        context,
                        linkDetailsScreen,
                        arguments: {'linkID': shortlinks[index].id},
                      );
                    },
                    child: ListTile(
                        // leading: const Icon(Icons.list),
                        trailing: const Icon(
                          Icons.check_box,
                          color: Colors.green,
                        ),
                        title: Text(
                          shortlinks[index].slug!,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        )),
                  ),
                  const Divider()
                ],
              );
            });
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
