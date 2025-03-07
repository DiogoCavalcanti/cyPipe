#!/bin/bash

#mkdir cyRobot

#cd cyRobot

# Verifica se o Node.js está instalado
if ! command -v node &> /dev/null; then
    echo "Node.js não está instalado. Instale o Node.js antes de continuar."
    exit 1
fi

# Inicializa o projeto caso o package.json não exista
if [ ! -f "package.json" ]; then
    echo "Inicializando o projeto Node.js..."
    npm init -y
fi

# Instala o Cypress
echo "Instalando o Cypress..."
npm install cypress --save-dev

# Instala plugins específicos do Cypress
echo "Instalando plugins do Cypress..."
#npm install @cypress/browserify-preprocessor @cypress/code-coverage --save-dev

npm install --save-dev mochawesome

npm install --save-dev cypress-mochawesome-reporter

npm install --save-dev cypress-multi-reporters


# Configurações adicionais
echo "Configurando Cypress..."
npx cypress open

# Mensagem de conclusão
echo "Instalação concluída! Você pode executar o Cypress com o comando: npx cypress open"
