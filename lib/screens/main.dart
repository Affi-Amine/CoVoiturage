//import 'package:covoiturage/screens/authentication/signIn.dart';
//import 'package:covoiturage/screens/authentication/welcome.dart';
import 'package:covoiturage/screens/authentication/welcome.dart';
import 'package:covoiturage/screens/home/home_screen.dart';
import 'package:covoiturage/screens/publish/pub_main.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:go_router/go_router.dart';



final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return Pub_main();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'pickup_map',
          builder: (BuildContext context, GoRouterState state) {
            return const Pub_pickup_map();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'dropoff',
              builder: (BuildContext context, GoRouterState state) {
                return const Pub_dropoff();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'details',
                  builder: (BuildContext context, GoRouterState state) {
                    return const Pub_dropoff_map();
                  },
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'details',
                      builder: (BuildContext context, GoRouterState state) {
                        return const Pub_stopover();
                      },
                      routes: <RouteBase>[
                        GoRoute(
                          path: 'details',
                          builder: (BuildContext context, GoRouterState state) {
                            return const Pub_addcity();
                          },
                        ),
                        GoRoute(
                          path: 'details',
                          builder: (BuildContext context, GoRouterState state) {
                            return const Pub_check();
                          }, 
                          routes: <RouteBase>[
                            GoRoute(
                                path: 'going_date',
                                builder: (BuildContext context, GoRouterState state) {
                                  return const Pub_start_date();
                                  },
                              routes: <RouteBase>[
                                GoRoute(
                                  path: 'going_time',
                                  builder: (BuildContext context, GoRouterState state) {
                                    return const Pub_start_time();
                                  },
                                  routes: <RouteBase>[
                                    GoRoute(
                                      path: 'passengers',
                                      builder: (BuildContext context, GoRouterState state) {
                                        return const Pub_numbpassenger();
                                      },
                                      routes: <RouteBase>[
                                        GoRoute(
                                          path: 'price',
                                          builder: (BuildContext context, GoRouterState state) {
                                            return const Pub_price();
                                          },
                                          routes: <RouteBase>[
                                            GoRoute(
                                              path: 'back_route',
                                              builder: (BuildContext context, GoRouterState state) {
                                                return const Pub_back_route();
                                              },
                                              routes: <RouteBase>[
                                                GoRoute(
                                                  path: 'going_date',
                                                  builder: (BuildContext context, GoRouterState state) {
                                                    return const Pub_back_date();
                                                  },
                                                  routes: <RouteBase>[
                                                    GoRoute(
                                                      path: 'going_time',
                                                      builder: (BuildContext context, GoRouterState state) {
                                                        return const Pub_back_time();
                                                      },
                                                      routes: <RouteBase>[
                                                        GoRoute(
                                                          path: 'price',
                                                          builder: (BuildContext context, GoRouterState state) {
                                                            return const Pub_price();
                                                          },
                                                          routes: <RouteBase>[
                                                            GoRoute(
                                                              path: 'comment',
                                                              builder: (BuildContext context, GoRouterState state) {
                                                                return const Pub_comment();
                                                              },
                                                              routes: <RouteBase>[
                                                                GoRoute(
                                                                  path: 'price',
                                                                  builder: (BuildContext context, GoRouterState state) {
                                                                    return const Pub_confirm();
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
            ),
          ],
        ),
      ],
    ),
  ],
);




void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CoVoiturage',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: Pub_main(),

    );
  }
}
