import 'package:appgain_flutter_app/business_logic/cubit/short_links_cubit.dart';
import 'package:appgain_flutter_app/data/apis/links_apis.dart';
import 'package:appgain_flutter_app/data/repos/links_repo.dart';

linksApis linksapis = linksApis();
linksRepo linksrepo = linksRepo(linksapis);
ShortLinksCubit linkcubit = ShortLinksCubit(linksrepo);
