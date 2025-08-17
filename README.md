# Gerenciamento de Bucket S3 com Atlantis e GitHub Actions

Este projeto demonstra como usar o Atlantis em conjunto com o GitHub Actions para automatizar o provisionamento de um bucket AWS S3 usando Terraform.

O fluxo de trabalho permite que as equipes colaborem em mudanças de infraestrutura através de Pull Requests, com `terraform plan` e `terraform apply` sendo executados e revisados diretamente na interface do GitHub.

## Estrutura do Projeto

```
.
├── .github
│   └── workflows
│       └── atlantis.yaml   # Define o workflow do GitHub Actions para rodar o Atlantis
├── atlantis.yaml           # Arquivo de configuração do Atlantis
└── main.tf                 # Código Terraform para o bucket S3
```

## Configuração

Siga estes passos para configurar o projeto no seu próprio repositório.

### 1. Pré-requisitos

*   Uma conta na AWS com credenciais de acesso (`AWS_ACCESS_KEY_ID` e `AWS_SECRET_ACCESS_KEY`).
*   Um repositório no GitHub.

### 2. Enviar o Código para o GitHub

Faça o push dos arquivos deste projeto para o seu repositório no GitHub.

### 3. Configurar os Segredos do Repositório

Navegue até o seu repositório no GitHub e vá em `Settings` > `Secrets and variables` > `Actions`. Adicione os seguintes segredos:

*   `AWS_ACCESS_KEY_ID`: Sua chave de acesso da AWS.
*   `AWS_SECRET_ACCESS_KEY`: Sua chave de acesso secreta da AWS.
*   `ATLANTIS_GH_TOKEN`: Um Personal Access Token (PAT) do GitHub. **Você não precisa de uma conta no Atlantis.** Crie o token em `GitHub Settings` > `Developer settings` > `Personal access tokens (classic)` com o escopo **`repo`**.
*   `ATLANTIS_GH_WEBHOOK_SECRET`: Uma string segura e aleatória que você cria. Pode usar um gerador de senhas.

## Como Usar

1.  **Crie uma nova branch** para sua alteração de infraestrutura.
    ```bash
    git checkout -b minha-feature
    ```

2.  **Modifique o arquivo `main.tf`**. Por exemplo, altere o nome do bucket ou adicione novas tags.

3.  **Faça o commit e envie a branch** para o GitHub.
    ```bash
    git commit -am "feat: Altera o nome do bucket S3"
    git push origin minha-feature
    ```

4.  **Abra um Pull Request** da sua branch para a `main`.

5.  **Revisão do Plano:** O Atlantis será acionado automaticamente pela Action. Ele executará `terraform plan` e postará o resultado como um comentário no Pull Request.

6.  **Aplicação das Mudanças:** Se o plano estiver correto, comente no Pull Request:
    ```
    atlantis apply
    ```

7.  O Atlantis executará `terraform apply` e comentará com o resultado.

8.  **Merge:** Após a aplicação bem-sucedida, você pode fazer o merge do Pull Request.
