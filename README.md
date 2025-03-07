# 📦 Calculadora de Frete

## 📖 Sobre o Projeto

Este projeto surgiu a partir da necessidade de conferir os valores de frete das mercadorias recebidas no estoque, comparando com os valores informados pela transportadora. Inicialmente, foi desenvolvida uma planilha para realizar esses cálculos, mas, visando aprendizado e praticidade, decidi criar também um aplicativo.

Após validar a lógica de cálculo na planilha, desenvolvi o app como um teste e estudo. Quando apresentei a solução, o responsável pelo recebimento viu valor na aplicação e solicitou que também fosse encaminhada para uso, pois ter o aplicativo no celular tornaria o processo mais ágil e prático.

---

## 🚀 Funcionalidades

O aplicativo realiza o cálculo do frete de acordo com os seguintes parâmetros fornecidos pelo usuário:

- **Valor da Nota Fiscal** (R$)
- **Peso da mercadoria** (Kg)
- **Dimensões da carga** (comprimento, largura e altura em metros)

Com essas informações, o app calcula:

✅ **Cubagem da carga** (volume em m³)  
✅ **Valor do frete com base em três critérios**:
   - Percentual sobre o valor da Nota Fiscal
   - Peso da mercadoria
   - Volume da mercadoria  
✅ **Maior valor de frete** entre as opções calculadas  
✅ **Margem de erro de 5% para mais e para menos**

---

## 🛠️ Tecnologias Utilizadas

- **Flutter** (Framework para desenvolvimento mobile)
- **Dart** (Linguagem de programação)
- **Intl Package** (Para formatação monetária)
- **Material Design** (Interface moderna e responsiva)

---

## 📲 Como Utilizar

1. Insira os dados solicitados nos campos do app.
2. Toque no botão "Calcular Frete".
3. O app exibirá o valor do frete com maior custo, além dos valores com margem de erro de 5% para mais e para menos.
4. Use as informações para conferir se o valor cobrado pela transportadora está correto.

---

## 🤖 Desenvolvimento com I.A.

O desenvolvimento deste aplicativo contou com o auxílio de Inteligências Artificiais para otimização de código e aprimoramento da lógica de cálculo, garantindo eficiência e precisão no resultado final.

---

## 📌 Status do Projeto

✅ **Finalizado e testado em ambiente real**  
✅ **100% funcional no smartphone**  
✅ **Disponível para uso no recebimento de mercadorias**

