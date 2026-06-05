String formatLocationLabel(String? city, String? district) {
  final c = city ?? '';
  final d = district ?? '';
  if (d.isEmpty) return c;
  if (c.isEmpty) return d;
  if (c == d) return c;
  return '$c, $d';
}
