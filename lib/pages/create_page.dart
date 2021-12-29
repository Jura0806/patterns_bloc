
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/bloc/create_post_cubit.dart';
import 'package:patterns_bloc/bloc/create_post_state.dart';
import 'package:patterns_bloc/views/view_of_create.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  bool isLoading = false;

  _finish(BuildContext context){
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Navigator.pop(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePostCubit(CreatePostInit()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Create Post"),
        ),
        body:  BlocBuilder<CreatePostCubit, CreatePostState>(
          builder: (BuildContext context, CreatePostState state){
            if(state is CreatePostLoading){
              return viewOfCreate(isLoading, context, titleController, bodyController);
            }
            if( state is CreatePostLoaded){
              _finish(context);
            }
            if(state is CreatePostError){

            }
            return viewOfCreate(isLoading, context, titleController, bodyController);
          },
        )
      ),
    );
  }


}
