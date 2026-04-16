> [!TIP]
> **Este repositório é um Mirror.** O desenvolvimento principal e a "Soberania do Código" ocorrem no [Codeberg](https://codeberg.org/HeadHSM/netdevops-projeto_01).

# 🚀 NetDevOps Lab #01: Primeiros Passos com Ansible

Este projeto é um laboratório inicial focado na transição de IT Support para **NetDevOps**. O objetivo é aprender a gerenciar infraestrutura através de código (IaC), utilizando um ambiente isolado e seguro. Utilizei o Sistema GNU/Linux Debian em um ambiente Virtual QEMU/KVM utilizando IP Fixo para o Sistema Operacional. **Futuramente pretendo realizar automações com Sistemas BSD, como o FreeBSD.**

---

## 🏗️ Ambiente de Controle (Host openSUSE)

Para este projeto, utilizaremos um ambiente virtual Python (**VENV**) para isolar o Ansible e suas dependências, mantendo o sistema operacional limpo.

### 1. Preparação do Ambiente

```bash
# Criar a pasta do projeto
mkdir ~/netdevops-projeto_01 && cd ~/netdevops-projeto_01

# Criar e ativar o ambiente virtual
python3 -m venv .venv
source .venv/bin/activate

# Instalar o Ansible
pip install --upgrade pip
pip install ansible
```

📂 Estrutura de Arquivos

Crie os arquivos abaixo dentro da pasta netdevops-projeto_01:

1. inventory.ini

```ini
[debian]
WEB_SERVER ansible_host=<IP_DO_SERVIDOR_DEBIAN> ansible_user=<SEU_USUARIO_SUDO>
```

1. Ansible.cfg

```ini
[defaults]
inventory = ./inventory.ini
host_key_checking = False # Não recomendado para a Produção
```

1. playbook.yml

```yml
---
- name: PROVEDOR DE SERVIÇO WEB
  hosts: debian
  become: true

  tasks:
    - name: VERIFICAR CONEXÂO COM O SERVIDOR
      ping:

    - name: GARANTIR QUE O NGINX ESTÀ INSTALADO
      apt:
        name: nginx
        state: present
        update_cache: yes # Realiza o comando apt update

    - name: ENVIAR INDEX.HTML
      copy:
        src: ./index.html
        dest: /var/www/html/index.html
        owner: www-data
        group: www-data
        mode: "0644"

    - name: GARANTIR QUE O NGINX ESTÀ RODANDO
      service:
        name: nginx
        state: started
        enabled: yes
```

## 🔑 Configuração de Acesso (SSH Keys)

Para que a automação funcione de forma fluida, é recomendado configurar o acesso via chaves SSH, eliminando a necessidade de digitar senhas manualmente.

1. **Gerar chave no Host (openSUSE):**

```bash
ssh-keygen -t ed25519 -C "nome-exemplo"
```

Enviar a chave para o Alvo (Debian):

```bash
ssh-copy-id <SEU_USUARIO_SUDO>@<IP_DO_SERVIDOR_DEBIAN>
```

Testar conexão:

```bash
ssh <SEU_USUARIO_SUDO>@<IP_DO_SERVIDOR_DEBIAN>
```

# Deve entrar direto, sem pedir senha

## 🚀 Execução

Certifique-se de que o .venv está ativo e execute:

Testar a comunicação:

```bash
ansible all -m ping
```

Como o Playbook utiliza `become: true` para tarefas que exigem privilégios de root (instalação de pacotes e gerência de serviços), você deve informar ao Ansible como lidar com a senha do `sudo`.

Utilize o parâmetro `-K` (maiúsculo) para que o Ansible solicite a senha de **BECOME** antes de iniciar as tarefas:

```bash
ansible-playbook playbook.yml -K
```

📝 Conceitos Aprendidos

VENV: Isolamento de ferramentas de automação.

Inventário: Organização e identificação de máquinas.

Módulos: Tradução de comandos genéricos para o SO alvo (Debian).

Idempotência: Garantia de que o estado final seja sempre o mesmo, sem erros em múltiplas execuções.

---
