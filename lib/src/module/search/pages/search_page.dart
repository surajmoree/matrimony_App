import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../search.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Module Timer')),
        body: Stack(children: [
          BlocBuilder<SearchBloc, SearchState>(
              buildWhen: (prev, state) =>
                  prev.status != state.status,
              builder: (context, state) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('${state.status}'),
                      if (state.status == SearchStatus.loading) ...[
                        
                        const CircularProgressIndicator(),
                      ],
                       if (state.status == SearchStatus.initial) ...[
                        ElevatedButton(
                            onPressed: () => context.read<SearchBloc>().add(
                                SearchSubmitted(seachText: state.searchText)),
                            child: const Text('Search')),
                        ElevatedButton(
                            onPressed: () => context
                                .read<SearchBloc>()
                                .add(const ShowLoader()),
                            child: const Text('Show Loader'))
                      ],
                       if (state.status == SearchStatus.success) ...[
                        Text('serach featching ${state.properties}'),
                        ElevatedButton(
                            onPressed: () => context
                                .read<SearchBloc>()
                                .add(const SearchReset()),
                            child: const Text('Reset'))
                      ],
                    ]);
              })
        ]));
  }
}
