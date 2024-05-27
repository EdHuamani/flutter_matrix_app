import 'package:matrix_app/src/localization/string_hardcoded.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../toast/custom_toast.dart';

part 'matrix_provider.g.dart';

@riverpod
class MatrixDelosi extends _$MatrixDelosi {
  @override
  List<List<int>> build() {
    // ejemplo inicial
    return [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ];
  }

  void rotateMatrixAnticlockwise() async {
    List<List<int>> oldMatrix =
        List<List<int>>.from(state.map((List<int> row) => List<int>.from(row)));

    int n = state.length;
    List<List<int>> newMatrix = List.generate(n, (_) => List.filled(n, 0));

    /// bucles anidados para rotar la matriz.
    /// El elemento en la posición [i][j] de la matriz original se mueve a la posición [n-j-1][i] en la nueva matriz.
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        newMatrix[n - j - 1][i] = state[i][j];
      }
    }

    await CustomToast.show(
        "Este es el valor anterior de la matriz: $oldMatrix".hardcoded);

    state = newMatrix;
  }

  void setMatrix(List<List<int>> newMatrix) {
    state = newMatrix;
  }
}
