part of 'post_bloc.dart';

@immutable
abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoaded extends PostState {
  final PostItem postItemModel;

  PostLoaded({@required this.postItemModel});

  @override
  List<Object> get props => [postItemModel];
}

class PostError extends PostState {
  final String errorMessage;

  const PostError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
