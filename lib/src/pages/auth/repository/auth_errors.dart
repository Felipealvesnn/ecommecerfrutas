String AutherrosStrings(String? code) {
  switch (code) {
    case 'auth/invalid-email':
      return 'E-mail inválido';
    case 'auth/user-disabled':
      return 'Usuário desabilitado';
    case 'auth/user-not-found':
      return 'Usuário não encontrado';
    case 'auth/wrong-password':
      return 'Senha incorreta';
    case 'auth/email-already-in-use':
      return 'E-mail já cadastrado';
    case 'auth/operation-not-allowed':
      return 'Operação não permitida';
    case 'auth/weak-password':
      return 'Senha fraca';
    default:
      return 'Erro desconhecido';
  }
}
