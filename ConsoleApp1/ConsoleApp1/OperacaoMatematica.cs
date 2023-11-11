public class OperacaoMatematica : IOperacao
{
    public int X { get; set; }
    public int MaiorX { get; set; }
    public int MaiorY { get; set; }
    public int Y { get; set; }
    public Operador Operador { get; set; }
    public int Nivel { get; internal set; }
    public int OperacoesSeguidasAcertadas { get; set; }
    public int Estrelas { get; set; }

    public virtual void Mostrar()
    {
        new Log().GravarLog($"Operador: {this.Operador}");
        new Log().GravarLog($"X: {X}");
        new Log().GravarLog($"Y: {Y}");
        new Log().GravarLog($"Nível: {Nivel}");
        new Log().GravarLog($"Maior X: {MaiorX}");
        new Log().GravarLog($"Maior Y: {MaiorY}");
        new Log().GravarLog($"Estrelas {Estrelas}");
        new Log().GravarLog($"Acertos seguidos: {OperacoesSeguidasAcertadas}");

        switch (this.Operador)
        {
            case Operador.Soma:
                new Log().GravarLog($"Resposta : {X + Y}");
                break;
            case Operador.Subtracao:
                new Log().GravarLog($"Resposta : {X - Y}");
                break;
            case Operador.Multiplicacao:
                new Log().GravarLog($"Resposta : {X * Y}");
                break;
            case Operador.Divisao:
                new Log().GravarLog($"Resposta : {X / Y}");
                break;
            default:
                break;
        }
    }
    public virtual bool CalcularResultado(int _resposta)
    {
        throw new NotImplementedException();
    }
    public bool RegistrarResposta(bool _acertou)
    {
        if (_acertou)
        {
            this.OperacoesSeguidasAcertadas++;

            if (this.OperacoesSeguidasAcertadas == 5)
            {
                this.Nivel++;
                this.OperacoesSeguidasAcertadas = 0;
            }
            return true;
        }

        this.OperacoesSeguidasAcertadas--;
        this.Nivel--;

        if (this.OperacoesSeguidasAcertadas > 0)
            this.OperacoesSeguidasAcertadas = 0;

        if (this.Nivel < 0)
            this.Nivel = 0;

        return false;
    }
    public virtual void GerarNumeros()
    {
        Estrelas = 0;
        MaiorX = MaiorY = 5;
        if (this.Nivel >= 2)
            this.Estrelas = 1;

        if (this.OperacoesSeguidasAcertadas == 5)
        {
            this.OperacoesSeguidasAcertadas = 0;
            this.Nivel++;
        }

        //        if (this.Operador == Operador.Divisao || this.Operador == Operador.Multiplicacao)
        //          return;

        if (this.Nivel > 12)
            this.Nivel = 12;

        if (this.Operador == Operador.Multiplicacao)
        {
            GerarNumerosParaMultiplicacao();
            return;
        }
        if (this.Operador == Operador.Divisao)
        {
            GerarNumerosParaMultiplicacao();
            X = X * Y;

            return;
        }

        if (this.Nivel == 1 || this.Nivel == 2)
            MaiorX = MaiorY = this.Nivel * 10;
        else if (this.Nivel == 3)
            MaiorX = MaiorY = 50;
        else if (this.Nivel == 4)
            MaiorX = MaiorY = 100;
        else if (this.Nivel >= 5)
            MaiorX = MaiorY = Convert.ToInt32(Math.Pow(2, Convert.ToDouble(this.Nivel + 4)));

        X = new Random().Next(MaiorX);
        Y = new Random().Next(MaiorY);

        if (this.Operador == Operador.Subtracao && X < Y)
        {
            int n = X;
            X = Y;
            Y = n;
        }
    }

    private void GerarNumerosParaMultiplicacao()
    {
        if (Nivel == 1)
            MaiorX = MaiorY = 10;
        else if (Nivel >= 2)
        {
            MaiorX = Convert.ToInt32(Math.Pow(2, this.Nivel + 1));
            MaiorY = Convert.ToInt32(Math.Pow(2, this.Nivel + 3));
        }

        do
        {
            X = new Random().Next(MaiorX);
            Y = new Random().Next(MaiorY);
        } while (this.Operador == Operador.Divisao && this.Y == 0);
    }
}