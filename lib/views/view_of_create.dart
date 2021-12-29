import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/bloc/create_post_cubit.dart';
import 'package:patterns_bloc/models/post_model.dart';

Widget viewOfCreate(bool isLoading, BuildContext context, TextEditingController titleController, TextEditingController bodyController){
  return  Stack(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Create new Post",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            texField(hintText: "Title", controller: titleController),
            SizedBox(
              height: 30,
            ),
            texField(hintText: "Body", controller: bodyController),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size.fromHeight(40)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ))),
              onPressed: () async {
                Post post = Post(title: titleController.text.toString(), body: bodyController.text.toString());
                BlocProvider.of<CreatePostCubit>(context).apiPostCreate(post);
              },
              child: Text(
                "Add",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          ],
        ),
      ),
      isLoading ? Center(child: CircularProgressIndicator(),)
          :SizedBox.shrink()
    ],
  );
}
Widget texField({hintText, controller}) {
  return TextField(
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 15),
    ),
  );
}