import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Tarefas'),
        ),
        body: ListView(
          children: [
            Task("Aprender flutter com java script e c# no meu novo notebook"),
            Task("Anadar de bike"),
            Task("Ler"),
            Task("Meditar"),
            Task("Meditar"),
            Task("Meditar"),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
      ),
    );
  }
}

class Task extends StatelessWidget {
  //modo estatico
  final String nome;

  const Task(this.nome, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          //Stack server para colocar um por cima do outro
          children: [
            Container(
              color: Colors.blue,
              height: 140,
            ),
            Container(
              color: Colors.white,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.black26,
                    width: 72,
                    height: 100,
                  ),
                  Container(
                    width: 180,
                      child: Text(
                    nome,
                    style: TextStyle(
                      fontSize: 24,
                      overflow: TextOverflow.ellipsis, // serve para textos grandes que ultrapassem o tamanho 
                    ),
                  )),
                  ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.arrow_drop_up,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
