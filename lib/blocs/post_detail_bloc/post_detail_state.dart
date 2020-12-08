part of 'post_detail_bloc.dart';

@immutable
abstract class PostDetailState extends Equatable {
  const PostDetailState();

  @override
  List<Object> get props => [];
}

class PostDetailInitial extends PostDetailState {}

class PostDetailLoadInProgress extends PostDetailState {}

class PostDetailLoadSuccess extends PostDetailState {
  final PostItem post;

  const PostDetailLoadSuccess({@required this.post}) : assert(post != null);

  @override
  List<Object> get props => [post];
}

class PostDetailLoadFailure extends PostDetailState {
  final String errorMessage;

  const PostDetailLoadFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
