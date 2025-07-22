abstract class FeedBackState {}

class FeedBackInitial extends FeedBackState {}

class FeedBackLoading extends FeedBackState {}

class FeedBackSuccessState extends FeedBackState {}

class FeedBackErrorState extends FeedBackState {
  String? error;

  FeedBackErrorState({this.error});
}
