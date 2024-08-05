void main() {
  String nome = "Laranja";
  double peso = 100.2;
  String cor = "Verde e Amarela";
  String sabor = "Doce e cítrica";
  int diasDesdeColheta = 40;
  bool isMadura = funcEstaMadura(diasDesdeColheta);

  int quantosDias = mostrarMadura(diasDesdeColheta, sabor: "");
  print(quantosDias);
}

int funcQuantosDiasMadura(int dias) {
  int diasParaMadura = 30;
  int quantosDiasFaltam = diasParaMadura - dias;
  return quantosDiasFaltam;
}

mostrarMadura(int dias,
    {String nome = "sem nome", String cor = "sem cor", required String sabor}) {
  // o parametro "dias" é obrigatorio(Posicionais Obrigatórios). Ja o parametro "cor" não é obrigatório pois não pode receber o valor nulo (Nomeados Opcionais). O parametro "nome" é o parametro com padrão. o parametro sabor é obrigatório pois ja vem com o "required" no argumento da função
  if (dias >= 30) {
    print("A $nome está madura");
  } else {
    print("A $nome não está madura");
  }

  if (cor != null) {
    print("A $nome é $cor");
  }
}

bool funcEstaMadura(int dias) {
  if (dias >= 30) {
    return true;
  } else {
    return false;
  }
}
