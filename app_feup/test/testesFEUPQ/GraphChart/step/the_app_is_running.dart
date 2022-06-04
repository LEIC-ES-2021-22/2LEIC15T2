import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uni/controller/middleware.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/course.dart';
import 'package:uni/model/entities/profile.dart';
import 'package:uni/model/entities/session.dart';
import 'package:uni/redux/reducers.dart';
import 'package:uni/view/Pages/feupq_page_view.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';

import '../../../testable_redux_widget.dart';
class MockClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}
Future<void> theAppIsRunning(WidgetTester tester) async {
  final mockClient = MockClient();
  final mockResponse = MockResponse();

  final profile = Profile();
  profile.courses = [Course(id: 7474)];

  final store = Store<AppState>(appReducers,
      initialState: AppState({
        'session': Session(authenticated: true),
        'profile': profile,
      }),
      middleware: [generalMiddleware]);
  final widget = testableReduxWidget(child: FeupQ(), store: store);
  await tester.pumpWidget(widget);
  await tester.pumpAndSettle(Duration(seconds: 25));
}
