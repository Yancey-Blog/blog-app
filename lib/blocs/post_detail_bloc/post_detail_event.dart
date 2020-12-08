part of 'post_detail_bloc.dart';

@immutable
abstract class PostDetailEvent extends Equatable {
  const PostDetailEvent();
}

class PostDetailRequested extends PostDetailEvent {
  final String id;

  const PostDetailRequested({@required this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}
