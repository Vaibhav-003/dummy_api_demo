import 'package:dummy_api_app/core/http_network.dart';
import 'package:dummy_api_app/core/api_config.dart';
import 'package:dummy_api_app/model/user_api_response.dart';
import 'package:dummy_api_app/model/user_api_request.dart';

/// API Service class for fetching user data.
class GetUserApi {
  GetUserApi();

  /// Instance of [HttpNetwork] configured with the mock API base URL.
  final network = HttpNetwork(baseUrl: 'https://mocki.io/');

  /// Fetches a list of users from the remote API.
  ///
  /// Returns a [Future] that resolves to a `List<User>`.
  /// Throws an [AppException] if the network request fails.
  Future<List<User>> getUser(UserApiRequest requestBody) async {
    final response = await network.get(
      ApiConfig(
        url: 'v1/0da9bb14-8759-4760-bac1-2bc8f442ab1e',
        request: requestBody.toJson(),
      ),
    );
    return UserApiResponse.fromJson(response).response.userList;
  }
}
