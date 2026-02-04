/// Configuration class for API requests.
///
/// Holds the [url] for the endpoint and an optional [request] body.
class ApiConfig {
  /// The specific API endpoint URL or path.
  final String url;

  /// The request payload/body, if any.
  final Map<String, dynamic>? request;

  ApiConfig({required this.url, this.request});
}
