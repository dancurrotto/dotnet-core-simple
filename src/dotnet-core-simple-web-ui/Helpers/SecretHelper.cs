using System.IO;

namespace dotnet_core_simple_web_ui.Helpers
{
    public class SecretHelper
    {
        public string _fileContent;

        public string FileContent
        {
            get
            {
                return _fileContent;
            }
        }

        public SecretHelper()
        {
            if(!File.Exists("secret"))
            {
               using (StreamWriter file =
               new System.IO.StreamWriter("secret", true))
                {
                   
                }
            }

            using (StreamReader sr = new StreamReader("secret"))
            {
                _fileContent = sr.ReadToEnd();
            }
        }
    }
}