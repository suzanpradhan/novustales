String numberToString(int num) {
  if (num >= 1000000) {
    return '${(num / 1000000).toStringAsFixed(1).replaceAll('.0', '')}M';
  } else if (num >= 1000) {
    return '${(num / 1000).toStringAsFixed(1).replaceAll('.0', '')}k';
  }
  return '$num';
}
