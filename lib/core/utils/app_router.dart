import 'package:apartmy/core/utils/routes_names.dart';
import 'package:apartmy/features/home_view/views/home_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/adding_block_view/views/adding_block_view.dart';

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: RoutesNames.home,
      builder: (context, state) => HomeView(),
    ),
    GoRoute(
      path: '/adding_Block/:name/:floors',
      name: RoutesNames.addingBlock,
      builder: (context, state) => AddingBlockView(
        blockName: state.pathParameters['name']?.toString() ?? 'N/V',
        blockFloorsCount: int.parse(state.pathParameters['floors']?.toString() ?? '0'),
      ),
    ),
  ],
);
