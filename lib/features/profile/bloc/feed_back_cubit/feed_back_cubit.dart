import '../../../../export.dart';
import 'feed_back_state.dart';

class FeedBackCubit extends Cubit<FeedBackState> with ApiClientMixin {
  List<String> topics = [];
  bool isSubmit = false;

  FeedBackCubit() : super(FeedBackInitial());

  getTopics() async {
    try {
      final response = await apiClient.get(
        ApiConstants.topics,
        (p0) => p0,
      );
      if (response.success) {
        if (response.data is List) {
          topics = (response.data as List)
              .map(
                (e) => e.toString(),
              )
              .toList();
          emit(FeedBackSuccessState());
        } else {
          showToast(response.errorMessage ?? AppStrings.somethingWentWrong);
          emit(FeedBackErrorState(error: response.errorMessage));
        }
      } else {
        showToast(response.errorMessage ?? AppStrings.somethingWentWrong);
        emit(FeedBackErrorState(error: response.errorMessage));
      }
    } catch (e) {
      showToast(AppStrings.somethingWentWrong);
      emit(FeedBackErrorState());
    }
  }

  submitFeedBacks(String topics, String description, String rating) async {
    emit(FeedBackLoading());
    try {
      var body = {
        "customerSiteId": "${Singleton.instance.userData?.id}",
        "topics": topics,
        "description": description,
        "rating": rating,
      };
      final url =
          Uri.parse(ApiConstants.feedBack).replace(queryParameters: body);
      final response = await get(
        url,
      );
      if (response.statusCode == 200) {
        // showToast("Feddb")
        isSubmit = true;
      } else {
        showToast(AppStrings.somethingWentWrong);
      }
    } catch (e) {
      showToast(AppStrings.somethingWentWrong);
    } finally {
      emit(FeedBackSuccessState());
    }
  }
}
