import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/bloc/list_post_state.dart';
import 'package:patterns_bloc/models/post_model.dart';
import 'package:patterns_bloc/pages/create_page.dart';
import 'package:patterns_bloc/pages/update_page.dart';
import 'package:patterns_bloc/services/http_service.dart';

class ListPostCubit extends Cubit<ListPostState>{
  ListPostCubit(ListPostInit initialState) : super(initialState);


  void apiPostList() async {
    emit(ListPostLoading());
    var response = await Network.GET(Network.API_List, Network.paramsEmpty());
    print(response);

      if (response != null) {
       emit(ListPostLoaded(posts: Network.parsePostList(response),));
      } else {
        emit(ListPostError(error: "Could not fetch posts"));
      }
  }

  void apiPosDelete(Post post) async {
    emit(ListPostLoading());
    var response = await Network.Del(Network.API_Delete + post.id.toString(), Network.paramsEmpty());
    print(response);

    if (response != null) {
      apiPostList();
    } else {
      emit(ListPostError(error: "Could not fetch posts"));
    }
  }

  void callCreatePage(BuildContext context) async{
    var results = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreatePage()));
    if(results != null){
      BlocProvider.of<ListPostCubit>(context).apiPostList();
    }
  }

  void callUpdatePage(BuildContext context, Post post) async{
    print(post.toJson());
    var results = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdatePage(post: post,)));
    if(results != null){
      BlocProvider.of<ListPostCubit>(context).apiPostList();
    }
  }
}