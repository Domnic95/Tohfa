import 'package:http/http.dart' as http;

import '../../export.dart';

// ApiClient apiClient = ApiClient();

class ApiClient {
  Future<ResponseData<T>> post<T>(
    String endpoint,
    T Function(dynamic) fromJson, {
    Object? body,
    Map<String, String>? headers,
    bool isLoginScreen = false,
    bool hideKeyBoard = true,
  }) async {
    bool hasConnection = await isConnectionAvailable();
    String authToken = await SharedPref.instance.getUserToken() ?? "";
    try {
      if (hasConnection) {
        if (hideKeyBoard) {
          hideKeyboard();
        }

        logV("body====>$body");

        final response = await http.post(
          Uri.parse(endpoint),
          headers: headers ??
              {
                "Authorization": "Bearer $authToken",
                "Accept": "application/json",
                "Content-Type": "application/json"
              },
          // headers: {
          //   'Authorization': authToken,
          //   'Content-Type': 'application/json', // Add other headers if needed
          // },
          body: body,
        );
        logResponse(response, endpoint, ApiConstants.post, body, headers);

        switch (response.statusCode) {
          case 200:
            return ResponseData.success(fromJson(json.decode(response.body)));
          case 401:
            logV("response.body===>${response.body}");
            String message = json.decode(response.body) != null
                ? json.decode(response.body)["message"]
                : json.decode(response.body)["message"];
            if (!isLoginScreen) {
              SharedPref.instance.logOut();
              NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginScreen);
              // showToast(message);
              return ResponseData.failure(message,
                  responseCode: response.statusCode);
            } else {
              return ResponseData.failure(message,
                  responseCode: response.statusCode);
            }

          case 403:
            return ResponseData.failure(json.decode(response.body)["message"] ??
                "Something Went Wrong");
          case 500:
            // Singleton.instance.logOut();
            // NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginScreen);
            return ResponseData.failure(json.decode(response.body) != null
                ? json.decode(response.body)["message"]
                : "Something Went Wrong");
          case 429:
            return ResponseData.failure(json.decode(response.body)["message"] ??
                "Something Went Wrong");
          case 409:
            return ResponseData.failure(
                json.decode(response.body)["data"] ?? "Something Went Wrong",
                responseCode: 409);
          case 404:
            return ResponseData.failure(
                json.decode(response.body)["message"] ?? "Something Went Wrong",
                responseCode: response.statusCode);
          case 422:
            return ResponseData.failure(json.decode(response.body)["message"] ??
                "Something Went Wrong");
          default:
            return ResponseData.failure(
                json.decode(response.body)["data"] ?? "Something Went Wrong",
                responseCode: response.statusCode);
        }
      } else {
        return ResponseData.failure(AppStrings.checkInternetConnection);
      }
    } catch (e) {
      return _errorBody(e);
    }
  }

  Future<ResponseData<T>> put<T>(
    String endpoint,
    T Function(dynamic) fromJson, {
    Object? body,
    Map<String, String>? headers,
    bool isLoginScreen = false,
    bool hideKeyBoard = true,
  }) async {
    bool hasConnection = await isConnectionAvailable();
    String authToken = await SharedPref.instance.getUserToken() ?? "";
    try {
      if (hasConnection) {
        if (hideKeyBoard) {
          hideKeyboard();
        }

        logV("body====>$body");

        final response = await http.put(
          Uri.parse(endpoint),
          headers: headers ??
              {
                "Authorization": "Bearer $authToken",
                "Accept": "application/json",
                "Content-Type": "application/json"
              },
          // headers: {
          //   'Authorization': authToken,
          //   'Content-Type': 'application/json', // Add other headers if needed
          // },
          body: body,
        );
        logResponse(response, endpoint, ApiConstants.post, body, headers);

        switch (response.statusCode) {
          case 200:
            return ResponseData.success(fromJson(json.decode(response.body)));
          case 401:
            logV("response.body===>${response.body}");
            String message = json.decode(response.body) != null
                ? json.decode(response.body)["message"]
                : json.decode(response.body)["message"];
            if (!isLoginScreen) {
              SharedPref.instance.logOut();
              NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginScreen);
              // showToast(message);
              return ResponseData.failure(message,
                  responseCode: response.statusCode);
            } else {
              return ResponseData.failure(message,
                  responseCode: response.statusCode);
            }

          case 403:
            return ResponseData.failure(
                json.decode(response.body)["message"] ?? "Something Went Wrong",
                responseCode: response.statusCode);
          case 500:
            // Singleton.instance.logOut();
            // NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginScreen);
            return ResponseData.failure(
                json.decode(response.body) != null
                    ? json.decode(response.body)["message"]
                    : "Something Went Wrong",
                responseCode: response.statusCode);
          case 429:
            return ResponseData.failure(
                json.decode(response.body)["message"] ?? "Something Went Wrong",
                responseCode: response.statusCode);
          case 409:
            return ResponseData.failure(
                json.decode(response.body)["message"] ?? "Something Went Wrong",
                responseCode: response.statusCode);
          case 422:
            return ResponseData.failure(
                json.decode(response.body)["message"] ?? "Something Went Wrong",
                responseCode: response.statusCode);
          case 404:
            return ResponseData.failure(
                json.decode(response.body)["message"] ?? "Something Went Wrong",
                responseCode: response.statusCode);
          default:
            return ResponseData.failure(
                json.decode(response.body)["data"] ?? "Something Went Wrong",
                responseCode: response.statusCode);
        }
      } else {
        return ResponseData.failure(AppStrings.checkInternetConnection);
      }
    } catch (e) {
      return _errorBody(e);
    }
  }

  Future<ResponseData<T>> get<T>(
    String endpoint,
    T Function(dynamic) fromJson, {
    Map<String, String>? parameters,
    Map<String, String>? headers,
  }) async {
    bool hasConnection = await isConnectionAvailable();
    String authToken = await SharedPref.instance.getUserToken() ?? "";
    try {
      if (hasConnection) {
        hideKeyboard();
        final url = Uri.parse(endpoint).replace(queryParameters: parameters);
        final response = await http.get(
          url,
          headers: headers ??
              {
                "Authorization": "Bearer $authToken",
                "Accept": "application/json",
                "Content-Type": "application/json"
              },
          // headers: {
          //   'Authorization': authToken,
          //   'Accept': '*/*',
          //   // 'Content-Type': 'application/json',
          // },
        );

        logResponse(response, url.toString(), ApiConstants.get, "",
            headers ?? {"Authorization": "Bearer $authToken"});

        switch (response.statusCode) {
          case 200:
            return ResponseData.success(fromJson(json.decode(response.body)));
          case 401:
            SharedPref.instance.logOut();
            String message = json.decode(response.body) != null
                ? json.decode(response.body)["message"]
                : json.decode(response.body)["message"];
            // showToast(message);
            logV("message====>$message");
            NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginScreen);
            return ResponseData.failure(message);
          case 403:
            return ResponseData.failure(json.decode(response.body)["message"] ??
                "Something Went Wrong");
          case 500:
            return ResponseData.failure("Something Went Wrong");
          case 429:
            return ResponseData.failure(json.decode(response.body)["message"] ??
                "Something Went Wrong");
          case 422:
            return ResponseData.failure(json.decode(response.body)["message"] ??
                "Something Went Wrong");
          default:
            return ResponseData.failure(
                json.decode(response.body)["message"] ?? "Something Went Wrong",
                responseCode: response.statusCode);
        }
      } else {
        return ResponseData.failure(AppStrings.checkInternetConnection);
      }
    } catch (e) {
      logV("error===>$e");

      return _errorBody(e);
    }
  }

  _errorBody(Object e) {
    logV("error===>$e");
    try {
      if (e.toString().contains(
              "ClientException with SocketException: Failed host lookup:") ||
          e
              .toString()
              .contains("ClientException: Software caused connection abort")) {
        return ResponseData.failure(AppStrings.checkInternetConnection);
      } else {
        return ResponseData.failure("Something went wrong");
      }
    } catch (e) {
      return ResponseData.failure("Something went wrong");
    }
  }
}
