import 'package:appgain_flutter_app/constants/strings.dart';
import 'package:appgain_flutter_app/data/repos/tokens_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'token_state.dart';

class TokenCubit extends Cubit<TokenState> {
  final tokensRepo tokensrepo;

  TokenCubit(this.tokensrepo) : super(TokenInitial());

  String getToken() {
    tokensrepo.getToken().then((token) {
      acctoken = token;
      emit(gotToken(acctoken));
    });
    return acctoken;
  }
}
