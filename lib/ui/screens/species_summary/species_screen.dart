// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedeeznuts/logic/cubit/species_page_cubit.dart';
import 'package:pokedeeznuts/ui/screens/species_summary/widgets/species_preview.dart';
import 'package:pokedeeznuts/util/const.dart';

class SpeciesTest extends StatefulWidget {
  const SpeciesTest({Key? key}) : super(key: key);

  @override
  State<SpeciesTest> createState() => _SpeciesTestState();
}

class _SpeciesTestState extends State<SpeciesTest> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.catching_pokemon),
            onPressed: () {},
          ),
          SizedBox(width: kDefaultPadding / 2)
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<SpeciesPageCubit, SpeciesPageState>(
              builder: (context, state) {
                if (state.status == SpeciesStatus.success ||
                    state.status == SpeciesStatus.loading) {
                  return Expanded(
                      child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: kDefaultPadding,
                          crossAxisSpacing: kDefaultPadding,
                          childAspectRatio: 0.75,
                        ),
                        controller: _scrollController,
                        itemCount: state.species.length + 1,
                        itemBuilder: (context, i) {
                          if (i >= state.species.length) {
                            return const SizedBox(
                                width: 50,
                                height: 50,
                                child: Text("Loading..."));
                          } else {
                            return SpeciesPreview(species: state.species[i]);
                          }
                        }),
                  ));
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<SpeciesPageCubit>().retrieveSpecies();
      Future.delayed(const Duration(milliseconds: 100));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
