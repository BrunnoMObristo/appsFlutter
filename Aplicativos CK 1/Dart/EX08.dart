void main() {
  double lado1 = 1;
  double lado2 = 1;
  double lado3 = 1; 
    if(lado1 != lado2 && lado1!= lado3){
      print("Resultado: É um triângulo Escaleno!");
    }  
    if(lado1 == lado2 || lado1 == lado3 || lado2 == lado3){
      print("Resultado: É um traingulo isósceles!");
    }
    if(lado1 == lado2 && lado2 == lado3){
      print("Resultado: É um triângulo eqüilátero!");
    }    
}