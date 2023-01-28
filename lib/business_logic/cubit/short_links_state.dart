part of 'short_links_cubit.dart';

@immutable
abstract class ShortLinksState {}

class ShortLinksInitial extends ShortLinksState {}

class linksLoading extends ShortLinksState {
  final bool loading;

  linksLoading(
    this.loading,
  );
}

class linksEmpty extends ShortLinksState {
  final List<ShortLink> links;

  linksEmpty(
    this.links,
  );
}

class linksLoaded extends ShortLinksState {
  final List<ShortLink> links;

  linksLoaded(
    this.links,
  );
}

class linkLoaded extends ShortLinksState {
  final ShortLink link;

  linkLoaded(
    this.link,
  );
}

class linkadded extends ShortLinksState {
  final bool added;

  linkadded(
    this.added,
  );
}
