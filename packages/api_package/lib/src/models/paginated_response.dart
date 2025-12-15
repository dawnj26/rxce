/// A generic model for paginated API responses.
///
/// Contains a subset of items along with pagination metadata to support
/// efficient loading of large datasets.
class PaginatedResponse<T> {
  /// Creates a [PaginatedResponse].
  ///
  /// The [hasMore] flag is automatically calculated based on whether
  /// the current page contains the last items.
  PaginatedResponse({
    required this.items,
    required this.totalCount,
    required this.page,
    required this.pageSize,
  }) : hasMore = (page * pageSize) < totalCount;

  /// The list of items in the current page.
  final List<T> items;

  /// The total number of items available across all pages.
  final int totalCount;

  /// The current page number (1-indexed).
  final int page;

  /// The number of items per page.
  final int pageSize;

  /// Whether more pages are available after the current page.
  final bool hasMore;
}
