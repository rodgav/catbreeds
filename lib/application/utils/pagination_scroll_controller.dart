import 'package:flutter/material.dart';

class PaginationScrollController {
  int page = 0;
  late ScrollController scrollController;
  late Function(int) loadData;

  PaginationScrollController({required this.loadData}) {
    scrollController = ScrollController()..addListener(_scrollListener);
  }

  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent* 0.8) {
      page++;
      loadData(page);
    }
  }
}
