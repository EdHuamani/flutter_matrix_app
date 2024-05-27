import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matrix_app/src/localization/string_hardcoded.dart';

import '../providers/matrix_provider.dart';

class MatrixScreen extends ConsumerStatefulWidget {
  const MatrixScreen({super.key});

  @override
  MatrixAppState createState() => MatrixAppState();
}

class MatrixAppState extends ConsumerState<MatrixScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final matrix = ref.watch(matrixDelosiProvider);
    return Scaffold(
      appBar:
          AppBar(title: Text('Ingresar y Rotar Matriz Antihoraria'.hardcoded)),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Ingrese matriz como [[1,2],[3,4]]'.hardcoded,
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final newMatrix = _parseMatrix(_controller.text);
              if (newMatrix != null && _isValidMatrix(newMatrix)) {
                ref.read(matrixDelosiProvider.notifier).setMatrix(newMatrix);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'Error en el formato o validez de la matriz'.hardcoded),
                ));
              }
            },
            child: Text('Establecer Matriz'.hardcoded),
          ),
          if (matrix.isNotEmpty)
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: matrix.first.length,
                ),
                itemCount: matrix.length * matrix.length,
                itemBuilder: (BuildContext context, int index) {
                  /// Calcula el índice de la columna del elemento actual basándose en el índice lineal.
                  /// Usa el operador de módulo para obtener el residuo de la división del índice por el número de columnas,
                  /// lo cual da la posición en la columna para el elemento actual.
                  int x = index % matrix.length;

                  /// Calcula el índice de la fila.
                  /// Usa la división entera para obtener el cociente de la división del índice por el número de columnas,
                  /// lo cual da la posición en la fila para el elemento actual.
                  int y = index ~/ matrix.length;
                  return GridTile(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        /// muestra el valor de la matriz en la posición (y, x)
                        child: Text(
                          matrix[y][x].toString(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ElevatedButton(
            onPressed: () => ref
                .read(matrixDelosiProvider.notifier)
                .rotateMatrixAnticlockwise(),
            child: Text('Rotar Antihorario'.hardcoded),
          ),
        ],
      ),
    );
  }

  List<List<int>>? _parseMatrix(String text) {
    try {
      text = text.replaceAll(RegExp(r'\s+'), ''); // Remove any spaces
      final result = text
          .substring(1, text.length - 1) // Remove outer brackets
          .split('],[')
          .map((e) => e
              .replaceAll(RegExp(r'[ \[\]]'), '')
              .split(',')
              .map(int.parse)
              .toList())
          .toList();
      return result;
    } catch (e) {
      debugPrint('Error parsing matrix: $e'.hardcoded);
      return null;
    }
  }

  bool _isValidMatrix(List<List<int>> matrix) {
    final size = matrix.length;
    return matrix.every((row) => row.length == size);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
