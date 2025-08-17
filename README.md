# PoC: “Atlantis” com GitHub Actions + OIDC

.
├── .github/
│   └── workflows/
│       ├── tf-plan.yml
│       └── tf-apply.yml
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── README.md


Esta PoC emula o fluxo do Atlantis usando GitHub Actions:
- `terraform plan` em PRs
- `terraform apply` quando alguém comenta `/atlantis apply`
- Sem secrets: AWS OIDC + IAM Role

## Como usar
1. Crie a IAM Role na AWS com trust policy para o seu repositório (> OIDC).
2. Dê permissão mínima (ex.: SSM Parameter).
3. Adicione o ARN da role em `AWS_ROLE_TO_ASSUME` (secret do repositório).
4. Abra um PR → o `plan` comenta no PR.
5. Peça aprovação do PR.
6. Comente: `/atlantis apply`.

## Segurança
- Apply exige PR **aprovado**.
- Execução só via OIDC (sem chaves estáticas).
- Você pode restringir por branch e por environment.

## Limpeza
- Remova o SSM Parameter após os testes (ou faça um workflow `destroy` se quiser).

## Limitações vs. Atlantis real
- Não há UI do Atlantis nem lock por workspace remoto.
- O plano não é “persistido” num servidor Atlantis.
- Entretanto, para equipes pequenas e demos, é um ótimo começo.

