import 'package:aladia/core/common/cubits/app_user/app_user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aladia/core/entity/user.dart';


class AppUserCubit extends Cubit<AppUserState>{
	AppUserCubit() : super(AppUserInitial());


	void updateUser(User? user){
		if (user == null){
			emit(AppUserInitial());
		} else{
			emit(AppUserLoggedIn(user));
		}
	}
}
