public class OperacaoSoma : OperacaoMatematica
{
    public OperacaoSoma()
    {
        this.Operador = Operador.Soma;
        this.GerarNumeros();
    }
    public override bool CalcularResultado(int _resposta)
    {
        return RegistrarResposta(this.Y + this.X == _resposta);
    }
}
