<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex, nofollow">
    <title>InTek Telecomunicações | Acesso ao PABX</title>
    <link rel="icon" type="image/png" href="themes/{$THEMENAME|default:'tenant'}/images/intek-logo.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
{literal}
    <style>
        /* Paleta extraída do logo InTek */
        :root {
            --teal:        #3d756c;  /* monofone */
            --teal-dark:   #244b45;
            --teal-deeper: #163330;
            --lime:        #b9da7f;  /* "in" */
            --olive:       #9ab282;  /* bloco inferior */
            --ink:         #111614;  /* "tek" */
            --muted:       #6b7a76;
            --line:        #dfe6e3;
            --field:       #f4f7f5;
            --white:       #ffffff;
            --danger:      #c0392b;
        }

        *, *::before, *::after { box-sizing: border-box; }

        html, body { height: 100%; margin: 0; }

        body {
            font-family: 'Inter', system-ui, -apple-system, 'Segoe UI', Roboto, Arial, sans-serif;
            color: var(--ink);
            background: var(--teal-deeper);
            -webkit-font-smoothing: antialiased;
        }

        .login {
            display: grid;
            grid-template-columns: 1.1fr 1fr;
            min-height: 100vh;
        }

        /* ---------- Painel da marca ---------- */
        .brand {
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 56px 64px;
            color: var(--white);
            background:
                radial-gradient(circle at 15% 20%, rgba(185, 218, 127, .22), transparent 45%),
                radial-gradient(circle at 90% 85%, rgba(154, 178, 130, .25), transparent 50%),
                linear-gradient(145deg, var(--teal) 0%, var(--teal-dark) 55%, var(--teal-deeper) 100%);
        }

        /* Arcos inspirados na curva do monofone do logo */
        .brand .arc {
            position: absolute;
            border-radius: 50%;
            border-style: solid;
            border-color: transparent;
            pointer-events: none;
        }
        .brand .arc-1 {
            width: 720px; height: 720px;
            right: -380px; top: -260px;
            border-width: 70px;
            border-top-color: rgba(255, 255, 255, .06);
            border-right-color: rgba(255, 255, 255, .06);
            transform: rotate(20deg);
        }
        .brand .arc-2 {
            width: 560px; height: 560px;
            right: -300px; top: -170px;
            border-width: 6px;
            border-top-color: rgba(185, 218, 127, .45);
            border-right-color: rgba(185, 218, 127, .45);
            transform: rotate(20deg);
        }

        .brand-tag {
            position: relative;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            font-size: 13px;
            font-weight: 600;
            letter-spacing: .18em;
            text-transform: uppercase;
            color: var(--lime);
        }
        .brand-tag::before {
            content: "";
            width: 28px; height: 3px;
            background: var(--lime);
            border-radius: 2px;
        }

        .brand-copy { position: relative; max-width: 460px; }
        .brand-copy h1 {
            margin: 0 0 18px;
            font-size: clamp(32px, 3.4vw, 46px);
            line-height: 1.1;
            font-weight: 800;
            letter-spacing: -.02em;
        }
        .brand-copy h1 span { color: var(--lime); }
        .brand-copy p {
            margin: 0;
            font-size: 16px;
            line-height: 1.6;
            color: rgba(255, 255, 255, .78);
        }

        .features {
            position: relative;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 32px;
            padding: 0;
            list-style: none;
        }
        .features li {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 14px;
            font-size: 13px;
            font-weight: 500;
            border-radius: 999px;
            background: rgba(255, 255, 255, .08);
            border: 1px solid rgba(255, 255, 255, .14);
        }
        .features svg { width: 16px; height: 16px; stroke: var(--lime); }

        .brand-foot {
            position: relative;
            font-size: 13px;
            color: rgba(255, 255, 255, .55);
        }

        /* ---------- Painel do formulário ---------- */
        .panel {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 48px 32px;
            background: var(--white);
        }

        .card { width: 100%; max-width: 400px; }

        .logo {
            display: block;
            width: 220px;
            max-width: 70%;
            height: auto;
            margin: 0 0 36px;
        }

        .card h2 {
            margin: 0 0 6px;
            font-size: 26px;
            font-weight: 700;
            letter-spacing: -.01em;
        }
        .card .lead {
            margin: 0 0 30px;
            font-size: 15px;
            color: var(--muted);
        }

        .field { margin-bottom: 18px; }
        .field label {
            display: block;
            margin-bottom: 8px;
            font-size: 13px;
            font-weight: 600;
            color: #34413d;
        }

        .input {
            position: relative;
            display: flex;
            align-items: center;
        }
        .input > svg {
            position: absolute;
            left: 14px;
            width: 18px; height: 18px;
            stroke: #8a9a95;
            pointer-events: none;
            transition: stroke .2s;
        }
        .input input {
            width: 100%;
            height: 50px;
            padding: 0 46px 0 44px;
            font: inherit;
            font-size: 15px;
            color: var(--ink);
            background: var(--field);
            border: 1.5px solid var(--line);
            border-radius: 12px;
            outline: none;
            transition: border-color .2s, box-shadow .2s, background .2s;
        }
        .input input::placeholder { color: #a3b0ac; }
        .input input:focus {
            background: var(--white);
            border-color: var(--teal);
            box-shadow: 0 0 0 4px rgba(61, 117, 108, .15);
        }
        .input:focus-within > svg { stroke: var(--teal); }

        .toggle-pass {
            position: absolute;
            right: 8px;
            display: grid;
            place-items: center;
            width: 36px; height: 36px;
            padding: 0;
            background: none;
            border: 0;
            border-radius: 8px;
            cursor: pointer;
        }
        .toggle-pass svg { width: 18px; height: 18px; stroke: #8a9a95; }
        .toggle-pass:hover svg,
        .toggle-pass:focus-visible svg { stroke: var(--teal); }
        .toggle-pass:focus-visible { outline: 2px solid var(--teal); }

        .caps {
            display: none;
            margin-top: 8px;
            font-size: 12px;
            font-weight: 500;
            color: #a86b00;
        }
        .caps.on { display: block; }

        .btn {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            width: 100%;
            height: 52px;
            margin-top: 10px;
            font: inherit;
            font-size: 15px;
            font-weight: 700;
            letter-spacing: .02em;
            color: var(--white);
            background: linear-gradient(135deg, var(--teal) 0%, var(--teal-dark) 100%);
            border: 0;
            border-radius: 12px;
            box-shadow: 0 10px 24px -10px rgba(36, 75, 69, .7);
            cursor: pointer;
            overflow: hidden;
            transition: transform .15s, box-shadow .2s, filter .2s;
        }
        /* Faixa verde-limão, como a barra do "in" no logo */
        .btn::after {
            content: "";
            position: absolute;
            left: 0; bottom: 0;
            width: 100%; height: 4px;
            background: linear-gradient(90deg, var(--lime), var(--olive));
        }
        .btn:hover { filter: brightness(1.08); box-shadow: 0 14px 28px -10px rgba(36, 75, 69, .8); }
        .btn:active { transform: translateY(1px); }
        .btn:focus-visible { outline: 3px solid var(--lime); outline-offset: 2px; }
        .btn svg { width: 18px; height: 18px; stroke: currentColor; transition: transform .2s; }
        .btn:hover svg { transform: translateX(3px); }
        .btn[disabled] { cursor: progress; filter: saturate(.7) brightness(.95); }

        .spinner {
            display: none;
            width: 18px; height: 18px;
            border: 2.5px solid rgba(255, 255, 255, .35);
            border-top-color: var(--white);
            border-radius: 50%;
            animation: spin .7s linear infinite;
        }
        .btn.loading .spinner { display: block; }
        .btn.loading svg { display: none; }
        @keyframes spin { to { transform: rotate(360deg); } }

        .secure {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            margin-top: 28px;
            font-size: 12px;
            color: var(--muted);
        }
        .secure svg { width: 14px; height: 14px; stroke: var(--olive); }

        .copy {
            margin-top: 36px;
            padding-top: 20px;
            font-size: 12px;
            text-align: center;
            color: #98a6a2;
            border-top: 1px solid var(--line);
        }
        .copy a { color: var(--teal); text-decoration: none; font-weight: 600; }
        .copy a:hover { text-decoration: underline; }

        /* Entrada suave */
        .card, .brand-copy { animation: rise .6s cubic-bezier(.2, .7, .2, 1) both; }
        .brand-copy { animation-delay: .08s; }
        @keyframes rise { from { opacity: 0; transform: translateY(14px); } }

        @media (prefers-reduced-motion: reduce) {
            *, *::before, *::after { animation: none !important; transition: none !important; }
        }

        /* ---------- Responsivo ---------- */
        @media (max-width: 960px) {
            .login { grid-template-columns: 1fr; }
            .brand { display: none; }
            .panel {
                min-height: 100vh;
                padding: 32px 16px;
                background:
                    linear-gradient(180deg, var(--teal) 0, var(--teal-dark) 220px, var(--field) 220px);
            }
            .card {
                padding: 32px 24px;
                background: var(--white);
                border-radius: 18px;
                box-shadow: 0 20px 50px -20px rgba(22, 51, 48, .45);
            }
            .logo { margin: 0 auto 28px; }
            .card h2, .card .lead { text-align: center; }
        }
    </style>
{/literal}
</head>
<body>
<main class="login">

    <section class="brand" aria-hidden="true">
        <span class="arc arc-1"></span>
        <span class="arc arc-2"></span>

        <span class="brand-tag">InTek Telecomunicações</span>

        <div class="brand-copy">
            <h1>Sua central telefônica, <span>conectada</span> e sob controle.</h1>
            <p>Gerencie ramais, filas, URAs e relatórios de chamadas em um só lugar, com a estabilidade da plataforma Issabel.</p>

            <ul class="features">
                <li>
                    <svg viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.8 19.8 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6A19.8 19.8 0 0 1 2.1 4.18 2 2 0 0 1 4.1 2h3a2 2 0 0 1 2 1.72c.13.96.36 1.9.7 2.81a2 2 0 0 1-.45 2.11L8.1 9.9a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45c.9.34 1.85.57 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
                    Ramais e troncos
                </li>
                <li>
                    <svg viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                    Filas e call center
                </li>
                <li>
                    <svg viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 3v18h18"/><path d="M7 15l4-4 3 3 5-6"/></svg>
                    Relatórios
                </li>
            </ul>
        </div>

        <div class="brand-foot">Suporte técnico InTek &middot; Plataforma Issabel 5</div>
    </section>

    <section class="panel">
        <div class="card">
            <img class="logo" src="themes/{$THEMENAME|default:'tenant'}/images/intek-logo.png" alt="InTek Telecomunicações">

            <h2>Bem-vindo de volta</h2>
            <p class="lead">Informe seu usuário e senha para acessar o painel.</p>

            <form method="POST" id="login-form" autocomplete="on" novalidate>
                <div class="field">
                    <label for="input_user">Usuário</label>
                    <div class="input">
                        <svg viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
                        <input type="text" id="input_user" name="input_user" placeholder="admin" autocomplete="username" autocapitalize="off" spellcheck="false" required autofocus>
                    </div>
                </div>

                <div class="field">
                    <label for="input_pass">Senha</label>
                    <div class="input">
                        <svg viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                        <input type="password" id="input_pass" name="input_pass" placeholder="••••••••" autocomplete="current-password" required>
                        <button type="button" class="toggle-pass" id="toggle-pass" aria-label="Mostrar senha" aria-pressed="false">
                            <svg viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
                        </button>
                    </div>
                    <span class="caps" id="caps">Caps Lock está ativado</span>
                </div>

                <!-- O Issabel valida o login pelo campo "submit_login" -->
                <input type="hidden" name="submit_login" value="1">

                <button type="submit" class="btn" id="btn-login">
                    <span class="spinner" aria-hidden="true"></span>
                    Entrar
                    <svg viewBox="0 0 24 24" fill="none" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14M13 5l7 7-7 7"/></svg>
                </button>
            </form>

            <div class="secure">
                <svg viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                Acesso restrito a usuários autorizados
            </div>

            <div class="copy">
                &copy; {$smarty.now|date_format:'%Y'} <a href="#" onclick="return false;">InTek Telecomunicações</a> &middot; Powered by Issabel
            </div>
        </div>
    </section>

</main>

{literal}
<script>
(function () {
    var form = document.getElementById('login-form');
    var user = document.getElementById('input_user');
    var pass = document.getElementById('input_pass');
    var toggle = document.getElementById('toggle-pass');
    var caps = document.getElementById('caps');
    var btn = document.getElementById('btn-login');

    toggle.addEventListener('click', function () {
        var show = pass.type === 'password';
        pass.type = show ? 'text' : 'password';
        toggle.setAttribute('aria-pressed', show);
        toggle.setAttribute('aria-label', show ? 'Ocultar senha' : 'Mostrar senha');
        pass.focus();
    });

    function checkCaps(e) {
        if (e.getModifierState) caps.classList.toggle('on', e.getModifierState('CapsLock'));
    }
    pass.addEventListener('keyup', checkCaps);
    pass.addEventListener('keydown', checkCaps);
    pass.addEventListener('blur', function () { caps.classList.remove('on'); });

    form.addEventListener('submit', function (e) {
        if (!user.value.trim()) { e.preventDefault(); user.focus(); return; }
        if (!pass.value) { e.preventDefault(); pass.focus(); return; }
        btn.classList.add('loading');
        btn.setAttribute('disabled', 'disabled');
    });
})();
</script>
{/literal}
</body>
</html>
