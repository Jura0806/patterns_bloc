


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/bloc/update_post_state.dart';
import 'package:patterns_bloc/models/post_model.dart';
import 'package:patterns_bloc/services/http_service.dart';

class UpdatePostCubit extends Cubit<UpdatePostState> {
  UpdatePostCubit(UpdatePostInit initialState) : super(initialState);

  void apiPostUpdate(Post post) async{
    post.userId = 1;
    print(post.toJson());
    emit(UpdatePostLoading());
    final response = await Network.PUT(Network.API_Update, Network.paramsUpdate(post));
    print(response);
    if(response != null){
      emit(UpdatePostLoaded(isUpdated: true));
    }else{
      emit(UpdatePostError(error: "Couldn't update post"));
    }
  }

}
