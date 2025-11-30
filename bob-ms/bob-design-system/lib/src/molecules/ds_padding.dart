import 'package:bob_design_system/src/atoms/paddings.dart';

final class DSPadding {
  final double start;
  final double top;
  final double end;
  final double bottom;

  bool get allValuesAreEqual => {start, top, end, bottom}.length == 1;

  const DSPadding({
    required this.start,
    required this.top,
    required this.end,
    required this.bottom,
  });

  DSPadding.all(double value)
    : start = value,
      bottom = value,
      end = value,
      top = value;

  DSPadding.allSmall() : this.all(Paddings.small);

  DSPadding.allMedium() : this.all(Paddings.medium);

  DSPadding.allLarge() : this.all(Paddings.large);

  DSPadding.startLarge()
    : start = Paddings.large,
      bottom = 0.0,
      end = 0.0,
      top = 0.0;

  String toSdui(String child) {
    if (allValuesAreEqual) {
      return '''Padding(
    padding: [$bottom],
    child: $child
)''';
    }

    return '''Padding(
  padding: [$start, $top, $end, $bottom],
  child: $child
)''';
  }
}
