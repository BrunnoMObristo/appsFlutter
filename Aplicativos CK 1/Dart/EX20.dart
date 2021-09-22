class PessoaFisica {
  String PesFisNome;
  String PesFisSexo;
  int PesFisIdade;
  PessoaFisica(this.PesFisNome, this.PesFisSexo, this.PesFisIdade);
}

void main() {  
  PessoaFisica pesfis1 = PessoaFisica("Dante", "Masculino", 20);
  PessoaFisica pesfis2 = PessoaFisica("Leônidas", "Masculino", 20);
  PessoaFisica pesfis3 = PessoaFisica("Leona", "Feminino", 21);
  PessoaFisica pesfis4 = PessoaFisica("Milos", "Masculino", 33);
  PessoaFisica pesfis5 = PessoaFisica("Momiji", "Feminino", 21);
    
  final pessoas  = [pesfis1,pesfis2,pesfis3,pesfis4,pesfis5];
    
  for(PessoaFisica pesfis in pessoas) {
    if(pesfis.PesFisSexo == "Feminino"){
      print("");
      print(pesfis.PesFisNome);
      print(pesfis.PesFisSexo);
      print(pesfis.PesFisIdade);
      print("");
    }
  }
}




 

