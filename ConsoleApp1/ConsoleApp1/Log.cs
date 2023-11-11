public class Log
{
    public string CaminhoLog { get; set; }
    public Log()
    {
        CaminhoLog = Environment.CurrentDirectory + "\\log.txt";
    }

    public void GravarLog(string _texto)
    {

    }
}