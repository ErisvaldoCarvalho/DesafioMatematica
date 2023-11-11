public class JogoMatematica
{
    public int Vidas = 3;
    public int Moedas = 0;
    public int Estrelas = 0;
    private OperacaoSoma operacaoSoma = new OperacaoSoma();
    private OperacaoSubtracao operacaoSubtracao = new OperacaoSubtracao();
    private OperacaoMultiplicacao operacaoMultiplicacao = new OperacaoMultiplicacao();
    private OperacaoDivisao operacaoDivisao = new OperacaoDivisao();
    private int operacoesSeguidasAcertadas;

    public void IniciarJogo()
    {
        while (Vidas > 0 && Estrelas < 5)
            Desafiar();

        Console.Clear();

        if (Vidas == 0)
            GameOver();
        else
            VoceECampeao();

    }

    public void Desafiar()
    {
        switch (Estrelas)
        {
            case 0:
                ApresentarOperacao(operacaoSoma);
                break;
            case 1:
                ApresentarOperacaoSubtracao();
                break;
            case 2:
                ApresentarOperacaoMultiplicacao();
                break;
            case 3:
                ApresentarOperacaoDivisao();
                break;
            default:
                ApresentarOperacaoMista();
                break;
        }
    }

    private void VoceECampeao()
    {
        Console.WriteLine("VOCÊ ZEROU O JOGO!!!!!!!!!!!!!!");
    }

    private void ApresentarOperacaoMista()
    {
        OperacaoMatematica[] operacaoMatematicas = new OperacaoMatematica[4];
        operacaoMatematicas[0] = operacaoSoma;
        operacaoMatematicas[1] = operacaoSubtracao;
        operacaoMatematicas[2] = operacaoMultiplicacao;
        operacaoMatematicas[3] = operacaoDivisao;

        OperacaoMatematica operacaoMatematica = operacaoSoma;

        foreach (OperacaoMatematica item in operacaoMatematicas)
            if (operacaoMatematica.Nivel > item.Nivel)
                operacaoMatematica = item;

        ApresentarOperacao(operacaoMatematica);
    }

    private void ApresentarOperacaoDivisao()
    {
        for (int i = 0; i < 4; i++)
            if (Vidas > 0)
                ApresentarOperacao(operacaoDivisao);
            else
                return;
        ApresentarOperacao(operacaoMultiplicacao);
        ApresentarOperacao(operacaoSubtracao);
        ApresentarOperacao(operacaoSoma);
    }
    private void ApresentarOperacaoMultiplicacao()
    {
        for (int i = 0; i < 4; i++)
            if (Vidas > 0)
                ApresentarOperacao(operacaoMultiplicacao);
            else
                return;
        ApresentarOperacao(operacaoSubtracao);
        ApresentarOperacao(operacaoSoma);
    }
    private void ApresentarOperacaoSubtracao()
    {
        for (int i = 0; i < 4; i++)
            if (Vidas > 0)
                ApresentarOperacao(operacaoSubtracao);
            else
                return;
        ApresentarOperacao(operacaoSoma);
    }
    private void ApresentarOperacao(OperacaoMatematica _operacao)
    {
        Console.Clear();
        Console.WriteLine($"Moedas: {Moedas} Vidas: {Vidas} Estrelas: {Estrelas}\n\n");

        _operacao.Mostrar();
        Console.WriteLine(_operacao.X.ToString().PadLeft(15));

        switch (_operacao.Operador)
        {
            case Operador.Soma:
                Console.WriteLine($"+ {_operacao.Y}".PadLeft(15));
                break;
            case Operador.Subtracao:
                Console.WriteLine($"- {_operacao.Y}".PadLeft(15));
                break;
            case Operador.Multiplicacao:
                Console.WriteLine($"x {_operacao.Y}".PadLeft(15));
                break;
            default:
                Console.WriteLine($"/ {_operacao.Y}".PadLeft(15));
                break;
        }

        VerificarResposta(LerRespostaDoUsuario(), _operacao);
        //VerificarResposta(0, _operacao);
    }
    private int LerRespostaDoUsuario()
    {
        return Convert.ToInt32(Console.ReadLine());
    }
    private void GanharEstrela()
    {
        Estrelas = this.operacaoSoma.Estrelas +
            this.operacaoSubtracao.Estrelas +
            this.operacaoMultiplicacao.Estrelas +
            this.operacaoDivisao.Estrelas;

        if (Estrelas == 4
            && this.operacaoSoma.Nivel >= 12
            && this.operacaoSubtracao.Nivel >= 12
            && this.operacaoMultiplicacao.Nivel >= 12
            && this.operacaoDivisao.Nivel >= 12)
            Estrelas = 5;
    }
    private void VerificarResposta(int _resposta, OperacaoMatematica _operacao)
    {

        #region Apagar tudo
        //TODO: Obloco de código abaixo é para fazer teste automatizado, para isso descomente as linhas abaixo
        //Thread.Sleep(1000);
        //switch (_operacao.Operador)
        //{
        //    case Operador.Soma:
        //        _resposta = _operacao.X + _operacao.Y;
        //        break;
        //    case Operador.Subtracao:
        //        _resposta = _operacao.X - _operacao.Y;
        //        break;
        //    case Operador.Multiplicacao:
        //        _resposta = _operacao.X * _operacao.Y;
        //        break;
        //    case Operador.Divisao:
        //        _resposta = _operacao.X / _operacao.Y;
        //        break;
        //    default:
        //        break;
        //}
        #endregion

        if (_operacao.CalcularResultado(_resposta))
        {
            this.operacoesSeguidasAcertadas++;
            Moedas++;

            if (operacoesSeguidasAcertadas == 5)
            {
                Moedas += 4;
                operacoesSeguidasAcertadas = 0;
            }

            GanharEstrela();
            _operacao.GerarNumeros();
        }
        else
        {
            this.Vidas--;
            this.Moedas -= this.Moedas >= 5 ? 5 : 0;

            if (Moedas < 0)
                Moedas = 0;

            this.operacoesSeguidasAcertadas = 0;
        }
    }
    private void GameOver()
    {
        // Lógica para quando o jogador perde todas as vidas
    }
}
