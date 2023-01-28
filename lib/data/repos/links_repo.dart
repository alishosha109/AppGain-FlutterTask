import '../apis/links_apis.dart';
import '../models/shortlink.dart';

class linksRepo {
  final linksApis linksapis;

  linksRepo(this.linksapis);

  Future<List<ShortLink>> getAllLinks() async {
    final links = await linksapis.getLinks();
    return links.map((link) => ShortLink.fromJson(link)).toList();
  }

  Future<ShortLink> getOneLink(linkID) async {
    final link = await linksapis.getOneLink(linkID);
    return ShortLink.fromJson(link);
  }

  Future<bool> addlink(slug, web, android_primary, android_fallback,
      ios_primary, ios_fallback) async {
    final added = await linksapis.addlink(slug, web, android_primary,
        android_fallback, ios_primary, ios_fallback);
    return added;
  }

  Future<String> getToken() async {
    final token = await linksapis.getToken();
    return token;
  }
}
