void main() {
  double peso = 69.00;
  double altura = 1.80;
  String sexo = 'masculino';
 
  double imc = (peso / (altura * altura));
 
  if(sexo == 'feminino'){
    if(imc <19){
      print("Você está abaixo do peso. Seu IMC é $imc");
    }
    else if(imc >= 19 && imc < 24){
      print("Você está no peso ideal. Seu IMC é $imc");
    }
    else if(imc >= 24){
      print("Você está acima do peso. Seu IMC é $imc");
    }
 }
  else if(sexo == 'masculino'){
    if(imc <20){
      print("Você esá abaixo do peso. Seu IMC é $imc");
    }
    else if(imc >= 20 && imc < 25){
      print("Você está no peso ideal. Seu IMC é $imc");
    }
    else if(imc >= 25){
      print("Você está acima do peso. Seu IMC é $imc");
    }
  }
  else{
    print("Opção inválida");
  }
}