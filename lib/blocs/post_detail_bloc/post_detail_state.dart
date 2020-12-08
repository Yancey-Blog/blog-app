part of 'post_detail_bloc.dart';

abstract class PostDetailState extends Equatable {
  const PostDetailState();
  
  @override
  List<Object> get props => [];
}

class PostDetailInitial extends PostDetailState {}
