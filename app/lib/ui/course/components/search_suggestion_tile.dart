import 'package:flutter/material.dart';

class SearchSuggestionTile extends StatelessWidget {
  const SearchSuggestionTile({required this.suggestion, super.key, this.onTap});

  final String suggestion;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.search),
      title: Text(suggestion),
      onTap: onTap,
    );
  }
}
