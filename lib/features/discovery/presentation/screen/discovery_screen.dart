import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_swap_bd/core/error/failure_message.dart';
import 'package:skill_swap_bd/core/extensions/context_extension.dart';
import 'package:skill_swap_bd/core/router/route_names.dart';
import 'package:skill_swap_bd/core/theme/app_spacing.dart';
import 'package:skill_swap_bd/core/utils/debouncer.dart';
import 'package:skill_swap_bd/core/widgets/app_app_bar.dart';
import 'package:skill_swap_bd/core/widgets/app_loader.dart';
import 'package:skill_swap_bd/core/widgets/app_text_field.dart';
import 'package:skill_swap_bd/core/widgets/empty_state_widget.dart';
import 'package:skill_swap_bd/core/widgets/error_state_widget.dart';
import 'package:skill_swap_bd/features/common/presentation/cubit/session/session_cubit.dart';
import 'package:skill_swap_bd/features/discovery/presentation/cubit/discovery/discovery_cubit.dart';
import 'package:skill_swap_bd/features/discovery/presentation/widget/discovery_user_card_widget.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({super.key});

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  final _debouncer = Debouncer();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchFeed();
  }

  void _fetchFeed([String? query]) {
    final sessionState = context.read<SessionCubit>().state;
    final currentUserId = switch (sessionState) {
      SessionAuthenticated(:final userId) => userId,
      _ => null,
    };
    context.read<DiscoveryCubit>().load(
      currentUserId: currentUserId,
      searchQuery: query,
    );
  }

  @override
  void dispose() {
    _debouncer.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: context.tr.discoveryTitle,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () => context.pushNamed(RouteNames.profile),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: AppTextField(
              controller: _searchController,
              hint: context.tr.discoverySearchHint,
              prefixIcon: const Icon(Icons.search),
              onChanged: (value) {
                _debouncer.run(() => _fetchFeed(value));
              },
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async => _fetchFeed(_searchController.text),
              child: BlocBuilder<DiscoveryCubit, DiscoveryState>(
                builder:
                    (context, state) => switch (state) {
                      DiscoveryInitial() ||
                      DiscoveryLoading() => const AppLoader(),
                      DiscoveryFailure(:final failure) => ErrorStateWidget(
                        message: failure.toMessage(context),
                        onRetry: () => _fetchFeed(_searchController.text),
                      ),
                      DiscoverySuccess(:final users) when users.isEmpty =>
                        EmptyStateWidget(
                          message: context.tr.discoveryNoUsersFound,
                        ),
                      DiscoverySuccess(:final users) => ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                        ),
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return DiscoveryUserCardWidget(
                            user: user,
                            onConnect: () {
                              context.pushNamed(
                                RouteNames.chat,
                                pathParameters: {'peerId': user.id},
                                extra: user.fullName,
                              );
                            },
                          );
                        },
                      ),
                    },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
