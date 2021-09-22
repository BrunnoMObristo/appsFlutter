void main() {
 double vel_Inicial = 10;
  double aceleracao = 10;
  double tempo = 5;
  
  double velocidadeResult = vel_Inicial + aceleracao * tempo;

  if(velocidadeResult < 40){
    print("Veículo muito lento");
  }
  if(40 < velocidadeResult && velocidadeResult <= 60){
    print("Velocidade permitida");
  }
  if(60 < velocidadeResult && velocidadeResult <= 80){
    print("Velocidade de cruzeiro");
  }
  if(80 < velocidadeResult && velocidadeResult <= 120){
    print("Veículo rápido");
  }
  if(velocidadeResult > 120){
    print("Veículo muito rápido");

  }

}