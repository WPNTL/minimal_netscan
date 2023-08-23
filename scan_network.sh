#!/bin/bash

# Verifica se o script está sendo executado como root
if [ "$EUID" -ne 0 ]; then
    echo "Este script precisa ser executado como root."
    exit 1
fi

# Função para realizar a varredura
perform_scan() {
    clear
    echo "Realizando varredura na rede..."
    sleep 2
    echo "Varredura concluída."
    sleep 1
}

# Função para exibir endereços IP e MAC
display_results() {
    clear
    echo "Exibindo resultados..."
    sleep 1
    echo "Endereços IP e MAC encontrados:"
    cat ips.txt | paste -d ' ' - macs.txt
    sleep 2
}

# Função para criar uma tabela em formato HTML
create_html_table() {
    echo "<html><head><title>Resultado da Varredura de Rede</title></head><body>" > network_results.html
    echo "<h1>Resultado da Varredura de Rede</h1>" >> network_results.html
    echo "<table border='1'><tr><th>Endereço IP</th><th>Endereço MAC</th></tr>" >> network_results.html

    while IFS= read -r ip && IFS= read -r mac <&3; do
        echo "<tr><td>$ip</td><td>$mac</td></tr>" >> network_results.html
    done < ips.txt 3< macs.txt

    echo "</table></body></html>" >> network_results.html
    echo "Tabela HTML criada: network_results.html"
    sleep 2
}

# Função para exportar para PDF
export_to_pdf() {
    if command -v wkhtmltopdf >/dev/null; then
        wkhtmltopdf network_results.html network_results.pdf
        echo "Arquivo PDF criado: network_results.pdf"
        sleep 2
    else
        echo "O utilitário 'wkhtmltopdf' não está instalado. Não foi possível exportar para PDF."
        sleep 2
    fi
}

# Função para exibir o menu principal
show_menu() {
    while true; do
        choice=$(whiptail --title "Script de Varredura de Rede" --menu "Escolha uma opção:" 15 60 4 \
            "1" "Realizar varredura na rede" \
            "2" "Exibir endereços IP e MAC" \
            "3" "Criar tabela HTML" \
            "4" "Exportar para PDF" \
            "5" "Sair" 3>&1 1>&2 2>&3)
        
        case $choice in
            1)
                perform_scan
                export_to_pdf
                ;;
            2)
                display_results
                ;;
            3)
                create_html_table
                ;;
            4)
                export_to_pdf
                ;;
            5)
                clear
                echo "Script concluído."
                exit 0
                ;;
            *)
                whiptail --title "Opção Inválida" --msgbox "Opção inválida. Por favor, escolha uma opção válida." 8 50
                ;;
        esac
    done
}

# Main
clear
echo "Bem-vindo ao script de varredura de rede!"
sleep 2
show_menu
