# PoC: “Atlantis” com GitHub Actions


# PoC: “Atlantis” com GitHub Actions + AWS Access Key/Secret

Esta prova de conceito mostra como emular o fluxo do **Atlantis** usando apenas **GitHub Actions** e **Terraform**.

A ideia é:
- Rodar `terraform plan` automaticamente quando abrimos ou atualizamos um Pull Request.
- Rodar `terraform apply` somente quando alguém comenta no PR: `/atlantis apply`.
- Usar **AWS Access Key e Secret** guardados como **GitHub Secrets**.

---

## Estrutura do Repositório

```
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
```
