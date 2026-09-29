# Tela de login InTek para Issabel 5

Página de login personalizada com a identidade visual da InTek Telecomunicações
(teal `#3d756c`, verde-limão `#b9da7f`, verde-oliva `#9ab282`).

## Arquivos

```
themes/tenant/_common/login.tpl        -> template Smarty da tela de login
themes/tenant/images/intek-logo.png    -> logo da empresa
preview.html                           -> prévia estática (abrir no navegador)
```

## Instalação no servidor Issabel

O tema padrão do Issabel 5 é o `tenant`. Se o seu usa outro tema, troque `tenant`
pelo nome dele nos comandos abaixo.

```bash
# 1. Backup do login original
cp /var/www/html/themes/tenant/_common/login.tpl /var/www/html/themes/tenant/_common/login.tpl.bak

# 2. Copiar os arquivos (a partir desta pasta)
cp themes/tenant/_common/login.tpl     /var/www/html/themes/tenant/_common/login.tpl
cp themes/tenant/images/intek-logo.png /var/www/html/themes/tenant/images/intek-logo.png

# 3. Permissões
chown asterisk:asterisk /var/www/html/themes/tenant/_common/login.tpl /var/www/html/themes/tenant/images/intek-logo.png

# 4. Limpar o cache do Smarty
rm -f /var/www/html/var/templates_c/*
```

Para reverter: `mv login.tpl.bak login.tpl` e limpe o cache novamente.

## Observações

- O formulário mantém os campos que o Issabel espera (`input_user`, `input_pass`, `submit_login`).
- A fonte Inter vem do Google Fonts; sem internet, a página usa a fonte do sistema.
- Atualizações do pacote `issabel-framework` podem sobrescrever o `login.tpl` — mantenha uma cópia.
