
class ResponseData<T> {
  final T? data;
  int? responseCode;
  final String? errorMessage;
  final bool success;

  ResponseData.success(this.data)
      : errorMessage = null,
        success = true;

  ResponseData.failure(this.errorMessage, {this.responseCode})
      : data = null,
        success = false;

  bool isSuccessWithData() {
    return success && data != null;
  }

  void handleResponse({
    required Function(T data) onSuccess,
    required Function(String errorMessage) onFailure,
  }) {
    if (isSuccessWithData()) {
      onSuccess(data as T);
    } else {
      onFailure(errorMessage ?? "An error occurred");
    }
  }
}
