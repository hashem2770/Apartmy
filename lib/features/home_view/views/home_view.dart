import 'package:flutter/material.dart';
import 'package:apartmy/features/home_view/widgets/home_view_body.dart';
import 'package:provider/provider.dart';

import '../../../core/component/custom_text_button.dart';
import '../../managers/tenants_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          CustomTextButton(
            onTap: () {
              context.read<TenantProvider>().resetPaying();
            },
            label: 'Reset',
          ),
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
