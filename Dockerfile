FROM alpine:3.14

# 1. Instala pacotes do sistema necessários
# - python3 e py3-pip: Essenciais para o Ansible e seus scripts
# - openssh-client: Para o Ansible conseguir conectar via SSH no Debian
# - sshpass: Permite passar a senha do .env para o Ansible (útil no lab)
# - build-base e python3-dev: Necessários se alguma lib Python precisar compilar algo
RUN apk add --no-cache \
    python3 \
    py3-pip \
    openssh-client \
    sshpass \
    build-base \
    python3-dev \
    gcc \
    musl-dev \
    libffi-dev

# 2. Atualiza o pip e instala o Ansible + dependências do projeto
# Instalamos direto na imagem para o container já vir "pronto"
RUN pip3 install --upgrade pip && \
    pip3 install ansible cryptography sqlalchemy python-dotenv

# 3. Define o diretório de trabalho dentro do container
WORKDIR /ansible

# 4. (Opcional) Garante que o Ansible não reclame de permissões de chave SSH
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh

CMD ["/bin/sh"]