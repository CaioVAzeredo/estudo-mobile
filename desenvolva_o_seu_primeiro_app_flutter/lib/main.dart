import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

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
          leading: Container(),
          backgroundColor: Colors.blue,
          title: Text('Tarefas'),
        ),
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: Duration(milliseconds: 800),
          child: ListView(
            children: [
              Task(
                  "Aprender flutter com java script e c# no meu novo notebook",
                  "http://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
                  1),
              Task(
                  "Andar de bike",
                  "https://s3.glbimg.com/v1/AUTH_35862ca5c6ab48b992baf1f1b4f7062e/m-extra-globo-com/incoming/8172080-76c-985/w488h275-PROP/andar-bicicleta.jpg",
                  4),
              Task(
                  "Ler",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnFH5txjGmMDeJQm5XlApRYJCA3nR0clEiXw&s",
                  5),
              Task(
                  "Meditar",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhOrrb9fgRM7yUFA3Ma6toprJdgPQwrkHPqQ&s",
                  3),
              Task(
                  "Meditar",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhOrrb9fgRM7yUFA3Ma6toprJdgPQwrkHPqQ&s",
                  3),
              Task(
                  "Meditar",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhOrrb9fgRM7yUFA3Ma6toprJdgPQwrkHPqQ&s",
                  3),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              opacidade = !opacidade;
            },
            child: Icon(Icons.remove_red_eye)),
      ),
    );
  }
}

//StatelessWidget é um estado estatico
class Task extends StatefulWidget {
  final String foto;
  final String nome;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          //Stack server para colocar um por cima do outro
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.black26,
                          ),
                          width: 72,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              widget.foto,
                              fit: BoxFit.cover,
                            ),
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 180,
                              child: Text(
                                widget.nome,
                                style: TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow
                                      .ellipsis, // serve para textos grandes que ultrapassem o tamanho
                                ),
                              )),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 1)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 2)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 3)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 4)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 5)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                            ],
                          )
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.arrow_drop_up,
                              ),
                              Text(
                                "Lvl UP",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade > 0)
                              ? (nivel / widget.dificuldade) / 10
                              : 1,
                        ),
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "Nivel: $nivel",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
