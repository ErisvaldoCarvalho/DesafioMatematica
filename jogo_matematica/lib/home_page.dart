import 'dart:async';
import 'dart:math';
//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FocusNode _focusNode;
  bool _iniarVariaveis = true;
  int _resposta = 0;
  final int GANHA_ESTRELA =
      4; //Quando o nível chega neste valor o usuário ganha uma estrela.
  //AudioPlayer audioPlayer = AudioPlayer();
  String cashRegisterSoundPath = 'assets/sons/caixa_registradora.wav';

  int _nivelAdicao = 1;
  int _nivelSubtracao = 1;
  int _nivelMultiplicacao = 1;
  int _nivelDivisao = 1;
  int _multiplicadorAdicao = 5;
  int _multiplicadorSubtracao = 5;
  String _nivel = 'Desativado';
  int _acertoSequencialAdicao = 0;
  int _acertoSequencialSubtracao = 0;
  int _acertoSequencialMultiplicacao = 0;
  int _acertoSequencialDivisao = 0;
  int _min = 1;
  int _max = 5;
  Random random = Random();
  int _x = 2;
  int _y = 3;
  int _temp = 1;
  String _operador = '+';
  int _moedas = 0;
  int _vidas = 3;
  int _estrelas = 0;
  bool _acertou = false;
  bool _errou = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    iniciarVariaveis();
    mostrarErroAcerto();
    return Scaffold(
      drawer: Drawer(
        child: Column(children: [
          Container(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('_resposta: $_resposta'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('_min: $_min'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('_max: $_max'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('_x: $_x'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('_y: $_y'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('_temp: $_temp'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('_moedas: $_moedas'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('_vidas: $_vidas'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('_operador: $_operador'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('_acertoSequencialAdicao: $_acertoSequencialAdicao'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('_acertoSequencialSubtracao: $_acertoSequencialSubtracao'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  '_acertoSequencialMultiplicacao: $_acertoSequencialMultiplicacao'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('_acertoSequencialDivisao: $_acertoSequencialDivisao'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('_nivelAdicao: $_nivelAdicao'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('_nivelSubtracao: $_nivelSubtracao'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('_nivelMultiplicacao: $_nivelMultiplicacao'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('_nivelDivisao: $_nivelDivisao'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  // _nivelAdicao = 12;
                  // _nivelSubtracao = 12;
                  // _nivelMultiplicacao = 10;
                  // _nivelDivisao = 12;
                },
                child: const Text('Avançar'),
              ),
              ElevatedButton(
                onPressed: () {
                  _multiplicadorAdicao = 10;
                  _multiplicadorSubtracao = 10;
                  setState(() {
                    _nivel = 'Ativado';
                  });
                },
                child: Text(_nivel),
              ),
            ],
          ),
        ]),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30, child: Image.asset('assets/images/coin.png')),
            Text('$_moedas'),
            Container(
              width: 10,
            ),
            for (int i = 0; i < _vidas; i++)
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            for (int i = _vidas; i < 3; i++)
              Icon(
                Icons.favorite,
                color: Colors.black38,
              ),
            for (int i = 0; i < _estrelas; i++)
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
            for (int i = _estrelas; i < 5; i++)
              Icon(
                Icons.star,
                color: Colors.black38,
              ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 10,
              ),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // image: DecorationImage(
                  //   image: NetworkImage(
                  //       'https://avatars.githubusercontent.com/u/13559517?v=4'),
                  //   fit: BoxFit.cover,
                  // ),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://yt3.ggpht.com/UpKNFIaQbFlKFOOKBMpuqhPzDiGckIG60KDYqgQFrh0t22c7IiS1DclkR15C9EJQNkjUw_ap=s88-c-k-c0x00ffffff-no-rj'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              if (_acertou)
                Icon(
                  Icons.thumb_up,
                  size: 100,
                  color: Colors.green,
                )
              else if (_errou)
                Icon(
                  Icons.thumb_down,
                  size: 100,
                  color: Colors.red,
                )
              else if (_vidas == 0)
                Column(children: [
                  Container(
                    height: 50,
                  ),
                  Container(
                    child: Text(
                      'Game Over',
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      reiniciarJogo();
                    },
                    child: Icon(
                      Icons.refresh,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ])
              else
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          _x.toString(),
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        Container(width: 150),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '$_operador'.padRight(_x.toString().length, ' '),
                          style: TextStyle(fontSize: 40),
                        ),
                        Text(
                          _y.toString(),
                          style: TextStyle(fontSize: 40),
                        ),
                        Container(width: 150),
                      ],
                    ),
                    Container(
                      width: 200,
                      color: Colors.white,
                      child: TextField(
                        autofocus: true,
                        focusNode: _focusNode,
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                        onChanged: (text) {
                          if (text != '')
                            _resposta = int.parse(text.replaceAll(' ', ''));
                        },
                      ),
                    ),
                    Container(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _controller.clear();
                            });
                          },
                          child: Icon(Icons.delete),
                        ),
                        Container(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (_moedas >= 2) {
                                  gerarDesafio();
                                  _moedas -= 2;
                                  _acertoSequencialAdicao = 0;
                                  _acertoSequencialSubtracao = 0;
                                  _acertoSequencialMultiplicacao = 0;
                                  _acertoSequencialDivisao = 0;
                                  _controller.clear();
                                } else {}
                              });
                            },
                            child: Text('Pular -2 moedas')),
                      ],
                    ),
                    Container(
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_controller.text != '') checarAcerto();
                        },
                        child: Text('Checar')),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> mostrarErroAcerto() async {
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      _acertou = false;
      _errou = false;
    });
  }

  void checarAcerto() {
    if (_resposta != '')
      switch (_operador) {
        case '+':
          if (_x + _y == _resposta) {
            acertou();
          } else {
            _nivelAdicao--;
            errou();
          }
          break;
        case '-':
          if (_x - _y == _resposta) {
            acertou();
          } else {
            _nivelSubtracao--;
            errou();
          }
          break;
        case 'x':
          if (_x * _y == _resposta) {
            acertou();
          } else {
            _nivelMultiplicacao--;
            errou();
          }
          break;
        case '÷':
          if (_x ~/ _y == _resposta) {
            acertou();
          } else {
            _nivelDivisao--;
            errou();
          }
          break;
        default:
          break;
      }
  }

  void errou() {
    setState(() {
      _acertoSequencialAdicao = 0;
      _acertoSequencialSubtracao = 0;
      _acertoSequencialMultiplicacao = 0;
      _acertoSequencialDivisao = 0;
      _moedas -= 5;

      _vidas--;
      if (_vidas < 0) _vidas = 0;
      if (_nivelAdicao < 1) _nivelAdicao = 1;
      if (_nivelSubtracao < 1) _nivelSubtracao = 1;
      if (_nivelMultiplicacao < 1) _nivelMultiplicacao = 1;
      if (_nivelDivisao < 1) _nivelDivisao = 1;
      if (_moedas < 0) _moedas = 0;
      _controller.clear();
      _errou = true;
    });
    mostrarErroAcerto();
  }

  void acertou() {
    //audioPlayer.play(cashRegisterSoundPath);
    setState(() {
      _acertoSequencialAdicao++;
      _acertoSequencialSubtracao++;
      _acertoSequencialMultiplicacao++;
      _acertoSequencialDivisao++;
      if (_operador == '+' && _acertoSequencialAdicao >= 5 ||
          _operador == '-' && _acertoSequencialSubtracao >= 5 ||
          _operador == 'x' && _acertoSequencialMultiplicacao >= 5 ||
          _operador == '÷' && _acertoSequencialMultiplicacao >= 5) {
        ganharMoedasBonus();
      } else {
        _moedas++;
      }
      gerarDesafio();
      _controller.clear();
      _acertou = true;
    });

    mostrarErroAcerto();
  }

  void ganharMoedasBonus() {
    if (_vidas < 3) {
      _vidas++;
      _moedas++;
    } else {
      _moedas += 5;
    }

    switch (_operador) {
      case '+':
        _acertoSequencialAdicao = 0;
        _nivelAdicao++;
        break;
      case '-':
        _acertoSequencialSubtracao = 0;
        _nivelSubtracao++;
        break;
      case 'x':
        _acertoSequencialMultiplicacao = 0;
        _nivelMultiplicacao++;
        break;
      case '÷':
        _acertoSequencialDivisao = 0;
        _nivelDivisao++;
        break;
      default:
    }
  }

  void gerarDesafio() {
    _temp = selecionarOperador();

    switch (_temp) {
      case 1:
        _operador = '+';
        gerarDesafioDeAdicao();
        break;
      case 2:
        _operador = '-';
        gerarDesafioDeSubtracao();
        break;
      case 3:
        _operador = 'x';
        gerarDesafioDeMultiplicacao();
        break;
      case 4:
        _operador = '÷';
        gerarDesafioDeDivisao();
        //_operador = '+';
        //gerarDesafioDeAdicao();
        break;
      default:
    }
  }

  void gerarDesafioDeAdicao() {
    _max = _nivelAdicao * _multiplicadorAdicao;
    _x = _min + random.nextInt(_max - _min + 1);
    _y = _min + random.nextInt(_max - _min + 1);
  }

  void gerarDesafioDeSubtracao() {
    int aux;
    _max = _nivelSubtracao * _multiplicadorSubtracao;
    _x = _min + random.nextInt(_max - _min + 1);
    _y = _min + random.nextInt(_max - _min + 1);

    if (_x < _y) {
      aux = _x;
      _x = _y;
      _y = aux;
    }
  }

  void gerarDesafioDeMultiplicacao() {
    _max = _nivelMultiplicacao;
    if (_nivelMultiplicacao > 10) _max = _nivelMultiplicacao * 5;
    //if (_nivelMultiplicacao <= 10 && _max > 10) _max = 10;
    _x = _min + random.nextInt(_max - _min + 1);
    _y = _min + random.nextInt(_max - _min + 1);
  }

  void gerarDesafioDeDivisao() {
    int aux;

    _max = _nivelDivisao * 5;
    _x = _min + random.nextInt(_max - _min + 1);
    _y = _min + random.nextInt(_max - _min + 1);

    if (_x < _y) {
      aux = _x;
      _x = _y;
      _y = aux;
    }
  }

  int selecionarOperador() {
    int retorno = 1;

    colocarEstrelas();

    List<Operador> operadores = [
      Operador(_nivelAdicao, '+', 1),
      if (_nivelAdicao > GANHA_ESTRELA) Operador(_nivelSubtracao, '-', 2),
      if (_nivelAdicao > GANHA_ESTRELA && _nivelSubtracao > GANHA_ESTRELA)
        Operador(_nivelMultiplicacao, 'x', 3),
      if (_nivelAdicao > GANHA_ESTRELA &&
          _nivelSubtracao > GANHA_ESTRELA &&
          _nivelMultiplicacao > GANHA_ESTRELA)
        Operador(_nivelDivisao, '÷', 4),
    ];

    operadores.sort((a, b) => a.nivel.compareTo(b.nivel));
    retorno = operadores[0].numeroOperador;
    if (retorno != 1) {
      retorno = retorno;
    }
    return retorno;
  }

  void colocarEstrelas() {
    _estrelas = 0;
    if (_nivelAdicao > GANHA_ESTRELA) _estrelas++;
    if (_nivelSubtracao > GANHA_ESTRELA) _estrelas++;
    if (_nivelMultiplicacao > GANHA_ESTRELA) _estrelas++;
    if (_nivelDivisao > GANHA_ESTRELA) _estrelas++;
    if (_nivelAdicao >= 10 &&
        _nivelSubtracao >= 10 &&
        _nivelMultiplicacao >= 10 &&
        _nivelDivisao >= 10) _estrelas++;
  }

  void reiniciarJogo() {
    _resposta = 0;
    _nivelAdicao = 1;
    _nivelSubtracao = 1;
    _nivelMultiplicacao = 1;
    _nivelDivisao = 1;
    _acertoSequencialAdicao = 0;
    _acertoSequencialSubtracao = 0;
    _acertoSequencialMultiplicacao = 0;
    _acertoSequencialDivisao = 0;
    _min = 1;
    _max = 5;
    _x = 2;
    _y = 3;
    _temp = 1;
    _operador = '+';
    _moedas = 0;
    _vidas = 3;
    _estrelas = 0;
    _acertou = false;
    _errou = false;
  }

  void iniciarVariaveis() {
    _iniarVariaveis = false;
    if (_iniarVariaveis)
      setState(() {
        _resposta = 0;
        _nivelAdicao = 5;
        _nivelSubtracao = 5;
        _nivelMultiplicacao = 5;
        _nivelDivisao = 1;
        _acertoSequencialAdicao = 0;
        _acertoSequencialSubtracao = 0;
        _acertoSequencialMultiplicacao = 0;
        _acertoSequencialDivisao = 0;
        _min = 1;
        _max = 5;
        _x = random.nextInt(5);
        _y = random.nextInt(5);
        _temp = 1;
        _operador = '+';
        _moedas = 48;
        _vidas = 3;
        _estrelas = 1;
      });
    _iniarVariaveis = false;
  }

//TODO: Excluir esse método
  void excluir_mostrarStatus() {
    print('_resposta: $_resposta');
    print('_min: $_min');
    print('_max: $_max');
    print('_x: $_x');
    print('_y: $_y');
    print('_temp: $_temp');
    print('_moedas: $_moedas');
    print('_vidas: $_vidas');
    print('_operador: $_operador');
    print('_acertoSequencialAdicao: $_acertoSequencialAdicao');
    print('_acertoSequencialSubtracao: $_acertoSequencialSubtracao');
    print('_acertoSequencialMultiplicacao: $_acertoSequencialMultiplicacao');
    print('_acertoSequencialDivisao: $_acertoSequencialDivisao');
    print('_nivelAdicao: $_nivelAdicao');
    print('_nivelSubtracao: $_nivelSubtracao');
    print('_nivelMultiplicacao: $_nivelMultiplicacao');
    print('_nivelDivisao: $_nivelDivisao');
  }
}

class Operador {
  int nivel = 0;
  int numeroOperador;
  String operador = '';

  Operador(this.nivel, this.operador, this.numeroOperador);
}
