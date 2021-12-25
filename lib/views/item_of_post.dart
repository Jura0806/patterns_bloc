import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:patterns_bloc/bloc/list_post_cubit.dart';
import 'package:patterns_bloc/models/post_model.dart';

Widget itemOfList(BuildContext context, Post post) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.25,
    child: Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(post.body),
        ],
      ),
    ),
    actions: [
      IconSlideAction(
        caption: "Update",
        color: Colors.indigo,
        icon: Icons.edit,
        onTap: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePage(title: post.title,body: post.body,id: post.id,)));
        },
      ),
    ],
    secondaryActions: [
      IconSlideAction(
        caption: "Delete",
        color: Colors.red,
        icon: Icons.delete,
        onTap: (){
         BlocProvider.of<ListPostCubit>(context).apiPosDelete(post);
        },
      )
    ],
  );
}