void main() {

double num = 50;
  int somaNum = 0;    
  int qtdNum = 4;
  
  if(num > 0 && num < 100){    
    for(int i = 0; i < qtdNum ; i++){
        somaNum = somaNum + i;      
        print(somaNum);
    }
  }else{
    print("Envie outro número. Valor recebido fora do esperado.");
  }
}

