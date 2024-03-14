enum UiState { LOADING, SUCCESS, EMPTY, ERROR }

class UiData<T> {
  UiState state;
  String message = "";
  String errorAsset = "";
  T? data;

  UiData({
    required this.state,
    this.data,
    this.message = "",
    this.errorAsset = "",
  });
}