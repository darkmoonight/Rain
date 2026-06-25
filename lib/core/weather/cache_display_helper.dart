/// Whether the UI should show the initial full-screen shimmer instead of cached
/// content during the first load.
bool shouldShowInitialShimmer({
  required bool isLoading,
  required bool hasCachedContent,
}) => isLoading && !hasCachedContent;
