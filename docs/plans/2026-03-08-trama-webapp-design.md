# TRAMA Webapp — Design Document

**Data**: 2026-03-08
**Autor**: Rodrigo Brazão
**Status**: Aprovado

---

## Contexto

TRAMA — Jornadas de Design, IADE 2026. Conferência de 1 dia, 5-10 oradores.
Webapp acessível por QR code projetado no ecrã do auditório.
Participantes acedem via telemóvel para ver programa, oradores, links Teams.

## Decisões

- **Abordagem**: JSON no repo como CMS + GitHub Pages (Abordagem A)
- **Tech**: HTML/CSS/JS puro, single file, zero frameworks, zero build steps
- **Responsive**: 100% fluido com `clamp()`, `auto-fit`, unidades relativas — zero breakpoints
- **Background**: Wave TRAMA reutilizada do v08, subtil (15-20% opacidade)
- **Acesso**: 100% público, sem login
- **Editores**: 2-3 pessoas editam `data.json` no GitHub browser

## Design System

### Cores
| Token | Hex | Uso |
|-------|-----|-----|
| bg | `#070709` | Fundo |
| text | `#f0ece6` | Texto principal |
| red | `#ff3c00` | Accent cor 1 |
| cyan | `#00e5ff` | Accent cor 2 / links Teams |
| lime | `#c8ff00` | Accent cor 3 |
| pink | `#ff00aa` | Accent cor 4 |
| orange | `#ff8800` | Accent cor 5 |
| purple | `#7b61ff` | Accent cor 6 |

### Tipografia
| Uso | Font | Peso |
|-----|------|------|
| "TRAMA" hero | Instrument Serif | Regular |
| Tagline/citações | Instrument Serif | Italic |
| UI/dados/horários | Roboto Mono | Light–Bold |
| Títulos secção | Roboto Mono | Bold uppercase |

### Tipografia fluida
```css
.trama-hero     { font-size: clamp(3rem, 10vw, 8rem); }
.section-title  { font-size: clamp(1.25rem, 3vw, 2rem); }
.titulo-talk    { font-size: clamp(1rem, 2.5vw, 1.25rem); }
.hora           { font-size: clamp(0.875rem, 2vw, 1rem); }
.body-text      { font-size: clamp(0.875rem, 2vw, 1rem); }
```

## Estrutura da página

### 1. Hero (viewport height)
- Background wave TRAMA animado (canvas fixed, baixa opacidade)
- "IADE · 2026" (Roboto Mono, small, cor accent)
- "TRAMA" (Instrument Serif, grande, distorção wave subtil)
- "JORNADAS DE DESIGN" (Roboto Mono, uppercase, tracking largo)
- "Cruzar, Entrelaçar, Gerar" (Instrument Serif italic)
- Data + local
- CTA scroll para programa

### 2. Programa
- Lista vertical de sessões
- Cada item: hora (cor do orador) + título + nome orador
- Link "Entrar no Teams" direto (quando disponível)
- "Ver mais" expande descrição inline
- Pausas com estilo visual diferente (dimmed)

### 3. Convidados
- Grid fluido: `repeat(auto-fit, minmax(280px, 1fr))`
- Card: foto + nome + cargo + empresa + linha cor
- Tap → scroll até talk no programa

### 4. Informações
- Local (morada)
- Links úteis (site IADE, redes sociais)
- Footer: IADE · Design Visual · 2026

## Estrutura de dados (data.json)

```json
{
  "evento": {
    "nome": "TRAMA",
    "subtitulo": "Jornadas de Design",
    "instituicao": "IADE",
    "ano": 2026,
    "data": "2026-05-15",
    "local": "Auditório IADE, Lisboa",
    "morada": "Av. D. Carlos I, 4, 1200-649 Lisboa",
    "tagline": "Cruzar, Entrelaçar, Gerar"
  },
  "programa": [
    {
      "hora": "09:30",
      "titulo": "Abertura",
      "orador": "IADE",
      "cor": "#ff3c00",
      "descricao": "Sessão de boas-vindas",
      "linkTeams": null,
      "pausa": false
    }
  ],
  "oradores": [
    {
      "nome": "Ana Moreira",
      "cargo": "Design Lead",
      "empresa": "Figma",
      "tema": "Sistemas de Design à Escala",
      "cor": "#00e5ff",
      "foto": "assets/oradores/ana-moreira.jpg",
      "bio": "..."
    }
  ],
  "links": [
    { "label": "Site IADE", "url": "https://www.iade.europeia.pt" },
    { "label": "Instagram", "url": "https://instagram.com/..." }
  ]
}
```

## Ficheiros

```
trama-experiences/
├── app/
│   ├── index.html          ← SPA (HTML + CSS + JS inline)
│   ├── data.json           ← CMS editável
│   └── assets/
│       └── oradores/       ← Fotos dos convidados
├── v01-interactiva/        ← Background interativo (existente)
└── README.md
```

## Deploy

1. Editores alteram `data.json` no GitHub (browser)
2. GitHub Pages rebuild automático (~60s)
3. Site atualizado

## QR Code

- URL: `https://rodrigobrazao.github.io/trama-experiences/app/`
- Gerado como overlay no background loop v08 (projeção auditório)
- Opcionalmente exportado como PNG/SVG para materiais impressos

## Comportamento

| Elemento | Comportamento |
|----------|--------------|
| Background wave | Canvas fixed, opacidade 15-20%, não interfere com leitura |
| Hero TRAMA | Letras com distorção wave subtil |
| Link Teams | Botão direto — tap abre Teams app |
| Expandir talk | Tap "Ver mais" → descrição + bio inline |
| Card convidado | Tap → scroll até talk no programa |
| Pausa | Estilo dimmed, sem interação |
