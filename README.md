> [!TIP]
> **Este repositório é um Mirror.** O desenvolvimento principal e a "Soberania do Código" ocorrem no [Codeberg](https://codeberg.org/HeadHSM/netdevops-projeto_01).

# 🚀 NetDevOps Lab #01

Laboratório de automação focado na transição de IT Support para **Infrastructure as Code (IaC)**. O objetivo é provisionar e gerenciar um ambiente completo utilizando ferramentas soberanas e open-source.

> **Status:** 🏗️ Fase de Provisionamento (Containers & Automação)

---

## 📍 Roadmap de Execução

### 1. Fundação (Control Node)

- [x] **Python VENV:** Ambiente isolado no openSUSE Tumbleweed.
- [x] **Dockerized Ansible:** Nó de controle portátil via Alpine Linux.
- [x] **Makefile Orchestration:** Interface unificada para gestão do projeto.

### 2. Infraestrutura (The Target)

- [ ] **Target Server:** Provisionamento automatizado de instâncias Debian.
- [ ] **Network:** Configuração de rede NAT/Bridge para comunicação entre nós.
- [ ] **SSH Auth:** Gestão automatizada de chaves e acesso seguro.

### 3. Source of Truth & Data

- [ ] **SQLAlchemy DB:** Inventário local (SQLite) para gestão de ativos.
- [ ] **Auth Script:** Validação de operador via Python antes do deploy.
- [ ] **Environment:** Sincronização de segredos via `.env`.

### 4. Orquestração & Deploy

- [ ] **Ansible Playbooks:** Configuração de serviços e Docker no Alvo.
- [ ] **Web Service:** Deployment automatizado de Nginx.
- [ ] **Error Handling:** Resiliência de sockets e conexões.

---

## 🛠️ Stack Tecnológica

- **OS:** openSUSE Tumbleweed (Host) / Debian (Target)
- **Languages:** Python 3.13 (SQLAlchemy / Dotenv)
- **Tools:** Ansible, Docker & Make
- **Soberania:** Codeberg (Principal) / GitHub (Mirror)

---

## 📝 Key Concepts (Aprendizados)

- **Idempotência:** Garantir que o `make up` seja executável N vezes sem falhas.
- **Abstração:** Uso de Docker para padronizar o ambiente de automação.
- **Soberania Digital:** Autonomia na escolha de ferramentas e hospedagem de código.

---
