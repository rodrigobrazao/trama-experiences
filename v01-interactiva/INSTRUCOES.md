# TRAMA — Instruções de Instalação

## Opção 1: Online (recomendado)

Abrir no Chrome:

**https://rodrigobrazao.github.io/trama-experiences/v01-interactiva/index.html**

- Funciona em qualquer computador com internet
- Clica uma vez no ecrã para entrar em fullscreen (kiosk mode)
- O cursor desaparece após 3 segundos sem mexer
- Para sair do fullscreen: `Esc`

## Opção 2: Offline (sem internet)

### Requisitos
- Google Chrome instalado
- Python 3 instalado (macOS já inclui)

### Passos
1. Copiar a pasta `offline/` inteira para o computador (ex: pen USB)
2. **Mac:** duplo-clique em `ABRIR.command`
3. **Windows:** duplo-clique em `ABRIR.bat`
4. O Chrome abre automaticamente em modo kiosk

### Para fechar
- **Mac:** `Cmd + Q`
- **Windows:** `Alt + F4`

## Conteúdo da pasta offline

| Ficheiro | Descrição |
|----------|-----------|
| `index.html` | Aplicação principal |
| `ABRIR.command` | Script de arranque (Mac) |
| `ABRIR.bat` | Script de arranque (Windows) |
| Restantes ficheiros | Bibliotecas MediaPipe + QR (hand tracking, câmara) |

## Notas

- A versão online e offline são idênticas em funcionalidade
- Hand tracking requer acesso à câmara — o browser pede permissão na primeira vez
- No Safari, a câmara só funciona via HTTPS (usar o link do GitHub Pages)
- Usar Chrome para melhor compatibilidade
