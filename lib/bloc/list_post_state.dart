

import 'package:equatable/equatable.dart';
import 'package:patterns_bloc/models/post_model.dart';

abstract class ListPostState extends Equatable{
 @override
  List<Object> get props => [];
}
 class ListPostInit extends ListPostState{}

 class ListPostLoading extends ListPostState{}

 class ListPostLoaded extends ListPostState{

  late final List<Post> posts;
  late final bool? isDeleted;

   ListPostLoaded({required this.posts,  this.isDeleted});

 }

 class ListPostError extends ListPostState{
  late final error;
  ListPostError({this.error});
 }


