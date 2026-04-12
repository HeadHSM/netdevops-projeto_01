.PHONY: start stop login build-tools help

# Variáveis
VENV = .venv
PYTHON = $(VENV)/bin/python3
PIP = $(VENV)/bin/pip3

## help: Mostra esta ajuda
help:
	@echo "Comandos disponíveis no projeto:"
	@sed -n 's/^##//p' $(MAKEFILE_LIST) | column -t -s ':' | sed -e 's/^/ /'

## start: Inicializa o ambiente virtual (venv) e instala dependências locais
start:
	@echo "🐍 Inicializando Estrutura..."
	@test -d $(VENV) || python3 -m venv $(VENV)
	@$(PIP) install --upgrade pip
	@$(PIP) install -r requirements.txt
	@echo "✅ Instalação concluída no .venv"

## build-tools: Constrói a imagem Docker (Alpine + Ansible) para o Control Node
build-tools:
	@echo "🏗️ Construindo imagem de controle (Alpine + Ansible)..."
	@docker build -t netdevops-tools:1.0 ./docker/

## login: Executa o script de identificação (Em construção)
login:
	@echo "⚠️ Comando ainda em construção"
#	@$(PYTHON) core/auth_manager.py