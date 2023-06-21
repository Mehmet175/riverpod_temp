import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ici_menu/app/di/di.dart';

class BaseView<T extends StateNotifier<S>, S> extends ConsumerStatefulWidget {
  final VoidCallback? initStateB;
  final Function(T watch, T read, S state)? onViewModelReady;
  final Function(T watch, T read, S state)? onViewAndViewModelReady;
  final VoidCallback? disposeB;
  final Widget Function(T watch, T read, S state) onPageBuild;
  final bool disposeViewModel;
  const BaseView({
    super.key,
    this.initStateB,
    this.onViewModelReady,
    this.disposeB,
    required this.onPageBuild,
    this.onViewAndViewModelReady,
    this.disposeViewModel = true,
  });

  @override
  BaseViewState<T, S> createState() => BaseViewState<T, S>();
}

class BaseViewState<T extends StateNotifier<S>, S>
    extends ConsumerState<BaseView<T, S>> {
  final viewModel = StateNotifierProvider<T, S>((ref) {
    return getIt<T>();
  });

  @override
  void initState() {
    widget.initStateB?.call();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModelSetup();
  }

  void viewModelSetup() {
    final watch = ref.watch<T>(viewModel.notifier);
    final read = ref.read<T>(viewModel.notifier);
    final state = ref.watch<S>(viewModel);
    widget.onViewModelReady?.call(watch, read, state);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.onViewAndViewModelReady?.call(watch, read, state);
    });
  }

  @override
  void dispose() {
    widget.disposeB?.call();
    if (widget.disposeViewModel) {
      final viewModelValue = ref.watch<T>(viewModel.notifier);
      viewModelValue.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final watch = ref.watch<T>(viewModel.notifier);
    final read = ref.read<T>(viewModel.notifier);
    final state = ref.watch<S>(viewModel);
    return Consumer(
        builder: (context, ref, child) =>
            widget.onPageBuild.call(watch, read, state));
  }
}
