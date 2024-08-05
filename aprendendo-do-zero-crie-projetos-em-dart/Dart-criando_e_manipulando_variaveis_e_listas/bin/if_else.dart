void main() {
  String nome = "Caio";
  int idade = 25;
  bool maiorDeIdade;

  if (idade >= 18) {
    maiorDeIdade = true;
  } else {
    maiorDeIdade = false;
  }

  print(
      "me chamo $nome, tenho $idade anos e sou maior de idade? $maiorDeIdade");
}
