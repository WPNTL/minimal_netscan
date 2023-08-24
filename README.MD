# Varredura de Rede - Script Shell

Este é um script em Shell para realizar varredura de dispositivos na rede interna da empresa e exibir informações como endereços IP e endereços MAC. O script também possui funcionalidades para criar uma tabela HTML com os resultados e exportar essa tabela para um arquivo PDF.

## Pré-requisitos

- Você deve estar executando este script como root.
- O utilitário `wkhtmltopdf` deve estar instalado para a exportação para PDF.

## Uso

1. Clone este repositório para a sua máquina.
2. Certifique-se de ter instalado o utilitário `wkhtmltopdf` para a exportação para PDF.
3. Execute o script `scan_network.sh` usando o terminal:

```bash
sudo ./scan_network.sh

O script irá guiá-lo por meio de um menu interativo onde você pode escolher diferentes opções.

## Funcionalidades

O script oferece as seguintes funcionalidades:

- **Realizar Varredura na Rede Interna:** O script executa uma varredura na rede interna da empresa, buscando por dispositivos ativos e coletando informações como endereços IP e endereços MAC.

- **Exibir Endereços IP e Endereços MAC:** Após a varredura, o script exibe os endereços IP e endereços MAC dos dispositivos encontrados na rede.

- **Criar Tabela HTML com Resultados:** O script cria uma tabela em formato HTML que apresenta os resultados da varredura de forma organizada. A tabela contém colunas para endereços IP e endereços MAC.

- **Exportar para Arquivo PDF:** Além da exibição em formato HTML, o script também oferece a capacidade de exportar a tabela de resultados para um arquivo PDF. Isso permite que você compartilhe os resultados de forma conveniente.

Essas funcionalidades combinadas proporcionam uma maneira prática e eficiente de realizar e documentar varreduras de rede na sua empresa, enquanto mantém os dados organizados e acessíveis.
