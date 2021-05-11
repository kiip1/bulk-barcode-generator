import 'dart:io';

import 'package:args/args.dart';
import 'package:barcode/barcode.dart';

final ArgParser argParser = ArgParser();

void main(List<String> arguments) {
  argParser.addFlag('help', abbr: 'h', defaultsTo: false);
  argParser.addOption('spliterator', abbr: 's', defaultsTo: '\\n');
  argParser.addOption('height', abbr: 'y', defaultsTo: '80.0');
  argParser.addOption('width', abbr: 'x', defaultsTo: '200.0');

  final ArgResults results = argParser.parse(arguments);

  if (results['help']) {
    print(
      '''
      Bulk barcode generator help:
        -h --help         Shows this.
        -s --spliterator  Sets the spliterator.
        -y --height       Height of the barcodes.
        -x --width        Width of the barcodes.
      '''
    );
  } else {
    final String spliterator = results['spliterator'];
    final String input = stdin.readLineSync();

    final double height = double.parse(results['height']);
    final double width = double.parse(results['width']);

    final List<String> data = input.split(spliterator);

    for (var part in data) {
      final String svg = Barcode.code39().toSvg(
        part,
        height: height,
        width: width,
      );

      print(svg);
    }
  }
}
