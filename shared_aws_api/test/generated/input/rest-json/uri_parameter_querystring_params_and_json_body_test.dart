// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:shared_aws_api/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'uri_parameter_querystring_params_and_json_body.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('URI parameter, querystring params and JSON body 0', () async {
    final client = MockClient((request) async {
      expect(request.body,
          equalsJson(r'''{"Config": {"A": "one", "B": "two"}}'''));
      expect(
          request.url,
          equalsPathAndQuery(
              '/2014-01-01/jobsByPipeline/foo?Ascending=true&PageToken=bar'));
      return Response('{}', 200, headers: {});
    });

    final service = URIParameterQuerystringParamsAndJSONBody(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName0(
      ascending: "true",
      config: StructType(
        a: "one",
        b: "two",
      ),
      pageToken: "bar",
      pipelineId: "foo",
    );
/*
{
  "PipelineId": "foo",
  "Ascending": "true",
  "PageToken": "bar",
  "Config": {
    "A": "one",
    "B": "two"
  }
}
*/
  });
}
