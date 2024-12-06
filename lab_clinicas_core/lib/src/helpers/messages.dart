import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

/// `Messages` é uma classe utilitária que oferece métodos para exibir diferentes tipos de
/// mensagens (erro, informação e sucesso) utilizando o `TopSnackBar` no Flutter.
final class Messages {
  /// Exibe uma mensagem de erro.
  ///
  /// Recebe uma [message] do tipo `String` e o [context] do tipo [BuildContext],
  /// e exibe um snack bar com o estilo de erro.
  ///
  /// Exemplo:
  /// ```dart
  /// Messages.showError("Erro ao carregar dados", context);
  /// ```
  static void showError(String message, BuildContext context) {
    showTopSnackBar(Overlay.of(context), CustomSnackBar.error(message: message));
  }

  /// Exibe uma mensagem de informação.
  ///
  /// Recebe uma [message] do tipo `String` e o [context] do tipo [BuildContext],
  /// e exibe um snack bar com o estilo de informação.
  ///
  /// Exemplo:
  /// ```dart
  /// Messages.showInfo("Dados carregados com sucesso", context);
  /// ```
  static void showInfo(String message, BuildContext context) {
    showTopSnackBar(Overlay.of(context), CustomSnackBar.info(message: message));
  }

  /// Exibe uma mensagem de sucesso.
  ///
  /// Recebe uma [message] do tipo `String` e o [context] do tipo [BuildContext],
  /// e exibe um snack bar com o estilo de sucesso.
  ///
  /// Exemplo:
  /// ```dart
  /// Messages.showSuccess("Operação concluída com sucesso", context);
  /// ```
  static void showSuccess(String message, BuildContext context) {
    showTopSnackBar(Overlay.of(context), CustomSnackBar.success(message: message));
  }
}
