// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:shared_aws_api/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'boolean_in_querystring.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Boolean in querystring 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.url, equalsPathAndQuery('/path?bool-query=true'));
      return Response('{}', 200, headers: {});
    });

    final service = BooleanInQuerystring(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName0(
      boolQuery: true,
    );
/*
{
  "BoolQuery": true
}
*/
  });

  test('Boolean in querystring 1', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.url, equalsPathAndQuery('/path?bool-query=false'));
      return Response('{}', 200, headers: {});
    });

    final service = BooleanInQuerystring(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName1(
      boolQuery: false,
    );
/*
{
  "BoolQuery": false
}
*/
  });
}
