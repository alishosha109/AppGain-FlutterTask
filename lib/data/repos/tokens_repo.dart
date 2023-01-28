import 'package:appgain_flutter_app/data/apis/token_apis.dart';

import '../apis/links_apis.dart';
import '../models/shortlink.dart';

class tokensRepo {
  final tokenApis tokensapis;

  tokensRepo(this.tokensapis);

  Future<String> getToken() async {
    final token = await tokensapis.getToken();
    return token;
  }
}
