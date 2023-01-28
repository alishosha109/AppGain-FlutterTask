class ShortLink {
  String? id;
  Android? android;
  String? slug;
  String? web;
  Android? ios;

  ShortLink({this.id, this.android, this.slug, this.web, this.ios});

  ShortLink.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    android =
        json['android'] != null ? new Android.fromJson(json['android']) : null;
    slug = json['slug'];
    web = json['web'];
    ios = json['ios'] != null ? new Android.fromJson(json['ios']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.android != null) {
      data['android'] = this.android!.toJson();
    }
    data['slug'] = this.slug;
    data['web'] = this.web;
    if (this.ios != null) {
      data['ios'] = this.ios!.toJson();
    }
    return data;
  }
}

class Android {
  String? primary;
  String? fallback;

  Android({this.primary, this.fallback});

  Android.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
    fallback = json['fallback'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primary'] = this.primary;
    data['fallback'] = this.fallback;
    return data;
  }
}
