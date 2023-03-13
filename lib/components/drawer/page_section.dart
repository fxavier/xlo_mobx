import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/components/drawer/page_tile.dart';
import 'package:xlo_mobx/stores/page_store.dart';

class PageSection extends StatelessWidget {
  PageSection({super.key});

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Anuncios',
          icon: Icons.list,
          onTap: () {
            pageStore.setPage(0);
          },
          highlighted: pageStore.page == 0,
        ),
        PageTile(
          label: 'Inserir Anuncios',
          icon: Icons.edit,
          onTap: () {
            pageStore.setPage(1);
          },
          highlighted: pageStore.page == 1,
        ),
        PageTile(
          label: 'Chat',
          icon: Icons.chat,
          onTap: () {
            pageStore.setPage(2);
          },
          highlighted: pageStore.page == 2,
        ),
        PageTile(
          label: 'Favoritos',
          icon: Icons.favorite,
          onTap: () {
            pageStore.setPage(3);
          },
          highlighted: pageStore.page == 3,
        ),
        PageTile(
          label: 'Minha Conta',
          icon: Icons.person,
          onTap: () {
            pageStore.setPage(4);
          },
          highlighted: pageStore.page == 4,
        ),
      ],
    );
  }
}
