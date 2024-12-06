import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_core.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

/// `Messages` é uma classe utilitária para exibir mensagens no estilo `TopSnackBar`.
/// Oferece métodos para exibir mensagens de erro, informação e sucesso.
final class Messages {
  /// Exibe uma mensagem de erro.
  ///
  /// [message]: O texto da mensagem a ser exibida.
  /// [context]: O contexto atual do `BuildContext` para exibir o snackbar.
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
  /// [message]: O texto da mensagem a ser exibida.
  /// [context]: O contexto atual do `BuildContext` para exibir o snackbar.
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
  /// [message]: O texto da mensagem a ser exibida.
  /// [context]: O contexto atual do `BuildContext` para exibir o snackbar.
  ///
  /// Exemplo:
  /// ```dart
  /// Messages.showSuccess("Operação concluída com sucesso", context);
  /// ```
  static void showSuccess(String message, BuildContext context) {
    showTopSnackBar(Overlay.of(context), CustomSnackBar.success(message: message));
  }
}

/// `MessageStateMixin` é um mixin para gerenciar o estado de mensagens.
///
/// Ele utiliza `Signal`s para armazenar mensagens de erro, informação e sucesso
/// e fornece métodos para limpar ou atualizar esses estados.
mixin MessageStateMixin {
  final Signal<String?> _errorMessage = signal(null);
  final Signal<String?> _infoMessage = signal(null);
  final Signal<String?> _successMessage = signal(null);

  /// Retorna a mensagem de erro atual, se houver.
  String? get errorMessage => _errorMessage();

  /// Retorna a mensagem de informação atual, se houver.
  String? get infoMessage => _infoMessage();

  /// Retorna a mensagem de sucesso atual, se houver.
  String? get successMessage => _successMessage();

  /// Limpa a mensagem de erro.
  void clearError() => _errorMessage.value = null;

  /// Limpa a mensagem de informação.
  void clearInfo() => _infoMessage.value = null;

  /// Limpa a mensagem de sucesso.
  void clearSuccess() => _successMessage.value = null;

  /// Define uma nova mensagem de erro.
  void showError(String message) {
    untracked(() => clearError());
    _errorMessage.value = message;
  }

  /// Define uma nova mensagem de informação.
  void showInfo(String message) {
    untracked(() => clearInfo());
    _infoMessage.value = message;
  }

  /// Define uma nova mensagem de sucesso.
  void showSuccess(String message) {
    untracked(() => clearSuccess());
    _successMessage.value = message;
  }

  /// Limpa todas as mensagens (erro, informação e sucesso).
  void clearAllMessages() {
    untracked(() {
      clearError();
      clearInfo();
      clearSuccess();
    });
  }
}

/// `MessageViewMixin` é um mixin para `StatefulWidget` que configura um listener para exibir mensagens.
///
/// Ele reage às mudanças de estado no `MessageStateMixin` e exibe a mensagem correspondente usando
/// os métodos da classe `Messages`.
mixin MessageViewMixin<T extends StatefulWidget> on State<T> {
  /// Configura um listener para o estado de mensagens e exibe as mensagens apropriadas.
  ///
  /// [state]: O mixin `MessageStateMixin` que contém o estado das mensagens.
  void messageListener(MessageStateMixin state) {
    effect(() {
      switch (state) {
        case MessageStateMixin(:final errorMessage?):
          Messages.showError(errorMessage, context);
        case MessageStateMixin(:final infoMessage?):
          Messages.showInfo(infoMessage, context);
        case MessageStateMixin(:final successMessage?):
          Messages.showSuccess(successMessage, context);
      }
    });
  }
}
