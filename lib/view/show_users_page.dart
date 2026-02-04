import 'package:dummy_api_app/api/get_user_api.dart';
import 'package:dummy_api_app/model/user_api_request.dart';
import 'package:dummy_api_app/model/user_api_response.dart';
import 'package:dummy_api_app/widgets/user_widget.dart';
import 'package:flutter/material.dart';

/// A page that fetches and displays a list of users.
class ShowUsersPage extends StatefulWidget {
  const ShowUsersPage({super.key});

  @override
  State<ShowUsersPage> createState() => _ShowUsersPageState();
}

class _ShowUsersPageState extends State<ShowUsersPage> {
  // Use a future variable to store the API call result and prevent loop
  late Future<List<User>> _userFuture;
  late GetUserApi getUserApi;

  @override
  void initState() {
    getUserApi = GetUserApi();
    // Initialize the future once with dummy request data
    _userFuture = getUserApi.getUser(
      UserApiRequest(
        headers: RequestHeaders(token: "abcdef123456", appVersion: "1.0.0"),
        request: RequestData(usergroup: "A_02", groupName: "newUsers"),
      ),
    );
    super.initState();
  }

  // No need for a separate getUser method with setState + users list since we use FutureBuilder
  // We can directly use getUserApi.getUser() in the future variable.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: FutureBuilder<List<User>>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No users found"));
          }

          final users = snapshot.data!;
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: users.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return UserWidget(user: users[index]);
            },
          );
        },
      ),
    );
  }
}
