import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_use_case/global_management/cubit/global_manage_cubit.dart';
import 'package:flutter_use_case/global_management/cubit/global_manage_state.dart';
import 'package:flutter_use_case/global_management/global_manage_detail.dart';
import 'package:flutter_use_case/global_management/global_model.dart';

class GlobalManageView extends StatefulWidget {
  const GlobalManageView({super.key});

  @override
  State<GlobalManageView> createState() => _GlobalManageViewState();
}

class _GlobalManageViewState extends State<GlobalManageView> {
  late final GlobalManageCubit _globalManageCubit;

  @override
  void initState() {
    super.initState();
    _globalManageCubit = GlobalManageCubit();
    _globalManageCubit.fetchInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GlobalManageCubit>(
      create: (context) => _globalManageCubit,
      child: Scaffold(
        appBar: AppBar(),
        body: const Column(
          children: [
            _Loading(),
            Expanded(child: _GlobalListView()),
          ],
        ),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalManageCubit, GlobalManageState>(
      builder: (context, state) {
        if (!state.isLoading) return const SizedBox.shrink();
        return const LinearProgressIndicator();
      },
    );
  }
}

class _GlobalListView extends StatelessWidget {
  const _GlobalListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalManageCubit, GlobalManageState>(
      builder: (context, state) {
        final items = state.globalItems ?? [];
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return _GlobalCard(
              globalModel: items[index],
              onFilterSelect: (int value) {
                context.read<GlobalManageCubit>().filterItems(value);
              },
            );
          },
        );
      },
    );
  }
}

class _GlobalCard extends StatelessWidget {
  const _GlobalCard({
    required this.globalModel,
    required this.onFilterSelect,
  });
  final GlobalModel globalModel;
  final ValueChanged<int> onFilterSelect;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () async {
          final result =
              await Navigator.of(context).push<GlobalNavigationModel<int>>(
            MaterialPageRoute(
              builder: (context) => const GlobalManageDetail(),
            ),
          );
          if (result != null || (result?.isComplete ?? false)) {
            onFilterSelect.call(result!.data);
          }
        },
        title: Text(globalModel.title),
      ),
    );
  }
}

class GlobalNavigationModel<T> {
  GlobalNavigationModel(this.data, {this.isComplete = true});

  final bool isComplete;
  final T data;
}
