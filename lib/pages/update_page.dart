
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/bloc/update_post_cubit.dart';
import 'package:patterns_bloc/bloc/update_post_state.dart';
import 'package:patterns_bloc/models/post_model.dart';
import 'package:patterns_bloc/views/view_of_update.dart';

class UpdatePage extends StatelessWidget {
  Post post;

   UpdatePage({required this.post});
   TextEditingController titleController = new TextEditingController();
   TextEditingController bodyController = new TextEditingController();

   _finish(BuildContext context){
     SchedulerBinding.instance!.addPostFrameCallback((_) {
       Navigator.pop(context, "result");
     });
   }
  @override
  Widget build(BuildContext context) {
     titleController.text = post.title;
     bodyController.text = post.body;
    return  BlocProvider(
      create: (context) => UpdatePostCubit(UpdatePostInit()),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Create Post"),
          ),
          body:  BlocBuilder<UpdatePostCubit, UpdatePostState>(
            builder: (BuildContext context, UpdatePostState state){
              if(state is UpdatePostLoading){
                return viewOfUpdate(post, context, titleController, bodyController);
              }
              if( state is UpdatePostLoaded){
                _finish(context);
              }
              if(state is UpdatePostError){

              }
              return viewOfUpdate(post, context, titleController, bodyController);
            },
          )
      ),
    );
  }
}
