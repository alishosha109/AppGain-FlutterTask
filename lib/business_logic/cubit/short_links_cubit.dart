import 'package:appgain_flutter_app/constants/strings.dart';
import 'package:appgain_flutter_app/data/models/shortlink.dart';
import 'package:appgain_flutter_app/data/repos/links_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'short_links_state.dart';

class ShortLinksCubit extends Cubit<ShortLinksState> {
  final linksRepo linksrepo;

  ShortLinksCubit(this.linksrepo) : super(ShortLinksInitial());

  List<ShortLink> links = [];
  bool added = false;
  ShortLink link = ShortLink();
  List<ShortLink> getAllShortLinks() {
    linksrepo.getAllLinks().then((links) {
      if (links.length == 0) {
        emit(linksEmpty(links));
      } else {
        emit(linksLoaded(
          links,
        ));
      }

      this.links = links;
    });
    return links;
  }

  ShortLink getOneLink(linkID) {
    linksrepo.getOneLink(linkID).then((link) {
      emit(linkLoaded(link));
      this.link = link;
    });
    return link;
  }

  bool addlink(
      slug, web, android_primary, android_fallback, ios_primary, ios_fallback) {
    linksrepo
        .addlink(slug, web, android_primary, android_fallback, ios_primary,
            ios_fallback)
        .then((added) {
      emit(linkadded(added));
      this.added = added;
    });
    return added;
  }
}
