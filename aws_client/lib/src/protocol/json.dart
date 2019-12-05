import 'package:aws_client/src/json/builder.dart';
import 'package:http_client/http_client.dart';

Request buildRequest(Map<String, dynamic> spec, Map<String, dynamic> data) {
  final metadata = spec['metadata'] as Map<String, String>;
  final target = '${metadata['targetPrefix']}.${data['operation']}';
  final version = metadata['jsonVersion'] ?? '1.0';
  final input =
      spec['operations'][data['operation']]['input'] as Map<String, dynamic>;
  final builder = JsonBuilder();

  final body = builder.build(data ?? {}, input);
  final headers = {
    'Content-Type': 'application/x-amz-json-$version',
    'X-Amz-Target': target
  };

  // TODO: Use body and headers in a request

  throw Exception('Protocol not implemented: "json" ($headers, $body)');
}