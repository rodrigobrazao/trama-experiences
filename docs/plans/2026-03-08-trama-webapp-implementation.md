# TRAMA Webapp — Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build a mobile-first webapp for TRAMA Jornadas de Design, accessible via QR code, with animated TRAMA background, programme, speakers, and Teams links — all powered by a JSON file as CMS.

**Architecture:** Single HTML file (SPA) with inline CSS + JS. Fetches `data.json` at load and renders all content client-side. Background uses an extracted, simplified wave animation from v08. Hosted on GitHub Pages with zero build steps.

**Tech Stack:** HTML5, CSS3 (clamp, grid auto-fit, custom properties), vanilla JS (ES6+), Google Fonts (Instrument Serif, Roboto Mono), Canvas 2D for wave background.

**Design doc:** `docs/plans/2026-03-08-trama-webapp-design.md`

---

### Task 1: Create data.json with sample programme data

**Files:**
- Create: `app/data.json`

**Step 1: Create the data file with full sample content**

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
      "descricao": "Sessão de abertura das Jornadas de Design TRAMA 2026.",
      "linkTeams": null,
      "pausa": false
    },
    {
      "hora": "10:00",
      "titulo": "Sistemas de Design à Escala",
      "orador": "Ana Moreira",
      "cor": "#00e5ff",
      "descricao": "Como construir e manter design systems que escalam com a organização. Casos práticos da Figma.",
      "linkTeams": "https://teams.microsoft.com/l/meetup-join/example1",
      "pausa": false
    },
    {
      "hora": "10:00",
      "titulo": "A Beleza como Função",
      "orador": "Tomás Henriques",
      "cor": "#c8ff00",
      "descricao": "A relação entre estética e funcionalidade no design contemporâneo.",
      "linkTeams": "https://teams.microsoft.com/l/meetup-join/example2",
      "pausa": false
    },
    {
      "hora": "12:00",
      "titulo": "Pausa",
      "orador": "",
      "cor": "#f0ece6",
      "descricao": "",
      "linkTeams": null,
      "pausa": true
    },
    {
      "hora": "13:30",
      "titulo": "O Ensino do Design Generativo",
      "orador": "Beatriz Costa",
      "cor": "#ff00aa",
      "descricao": "Novas abordagens pedagógicas para o design generativo e computacional.",
      "linkTeams": "https://teams.microsoft.com/l/meetup-join/example3",
      "pausa": false
    },
    {
      "hora": "14:30",
      "titulo": "Design Inclusivo e Acessibilidade",
      "orador": "Miguel Santos",
      "cor": "#ff8800",
      "descricao": "Princípios de design inclusivo e como aplicá-los em projetos reais.",
      "linkTeams": "https://teams.microsoft.com/l/meetup-join/example4",
      "pausa": false
    },
    {
      "hora": "15:30",
      "titulo": "Tipografia Portuguesa Contemporânea",
      "orador": "Sofia Almeida",
      "cor": "#7b61ff",
      "descricao": "O estado da arte da tipografia desenhada em Portugal.",
      "linkTeams": "https://teams.microsoft.com/l/meetup-join/example5",
      "pausa": false
    },
    {
      "hora": "16:30",
      "titulo": "Quando o Design se Move",
      "orador": "Diogo Ferreira",
      "cor": "#ff3c00",
      "descricao": "Motion design como ferramenta narrativa e funcional.",
      "linkTeams": "https://teams.microsoft.com/l/meetup-join/example6",
      "pausa": false
    },
    {
      "hora": "17:30",
      "titulo": "Debate de Encerramento",
      "orador": "Todos os convidados",
      "cor": "#00e5ff",
      "descricao": "Mesa redonda com todos os oradores convidados.",
      "linkTeams": "https://teams.microsoft.com/l/meetup-join/example7",
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
      "bio": "Design Lead na Figma com mais de 10 anos de experiência em design systems."
    },
    {
      "nome": "Tomás Henriques",
      "cargo": "Designer",
      "empresa": "Studio TH",
      "tema": "A Beleza como Função",
      "cor": "#c8ff00",
      "foto": "assets/oradores/tomas-henriques.jpg",
      "bio": "Designer multidisciplinar focado na interseção entre arte e funcionalidade."
    },
    {
      "nome": "Beatriz Costa",
      "cargo": "Professora",
      "empresa": "FBAUL",
      "tema": "O Ensino do Design Generativo",
      "cor": "#ff00aa",
      "foto": "assets/oradores/beatriz-costa.jpg",
      "bio": "Professora e investigadora em design generativo e computacional."
    },
    {
      "nome": "Miguel Santos",
      "cargo": "UX Lead",
      "empresa": "OutSystems",
      "tema": "Design Inclusivo e Acessibilidade",
      "cor": "#ff8800",
      "foto": "assets/oradores/miguel-santos.jpg",
      "bio": "Especialista em acessibilidade e design inclusivo."
    },
    {
      "nome": "Sofia Almeida",
      "cargo": "Type Designer",
      "empresa": "DSType",
      "tema": "Tipografia Portuguesa Contemporânea",
      "cor": "#7b61ff",
      "foto": "assets/oradores/sofia-almeida.jpg",
      "bio": "Type designer com trabalho reconhecido internacionalmente."
    },
    {
      "nome": "Diogo Ferreira",
      "cargo": "Motion Designer",
      "empresa": "Buck",
      "tema": "Quando o Design se Move",
      "cor": "#ff3c00",
      "foto": "assets/oradores/diogo-ferreira.jpg",
      "bio": "Motion designer na Buck, especialista em narrativa visual e animação."
    }
  ],
  "links": [
    {"label": "Site IADE", "url": "https://www.iade.europeia.pt"},
    {"label": "Instagram IADE", "url": "https://instagram.com/iade_eu"}
  ]
}
```

**Step 2: Create assets directory with placeholder**

```bash
mkdir -p app/assets/oradores
touch app/assets/oradores/.gitkeep
```

**Step 3: Commit**

```bash
git add app/data.json app/assets/oradores/.gitkeep
git commit -m "feat: add data.json CMS with sample programme data"
```

---

### Task 2: Build HTML skeleton with CSS custom properties + fonts

**Files:**
- Create: `app/index.html`

**Step 1: Create the full HTML structure with embedded CSS**

The HTML file starts with:
- Meta viewport for mobile
- Google Fonts preconnect + load (Instrument Serif 400/400i, Roboto Mono 300/400/500/600/700)
- CSS custom properties mapping the entire TRAMA design system
- CSS reset + fluid typography with `clamp()`
- Structural HTML for all 4 sections (hero, programa, convidados, info)
- Empty `<canvas>` for wave background

Key CSS custom properties:

```css
:root {
  --bg: #070709;
  --text: #f0ece6;
  --text-dim: rgba(240, 236, 230, 0.5);
  --text-muted: rgba(240, 236, 230, 0.15);
  --red: #ff3c00;
  --cyan: #00e5ff;
  --lime: #c8ff00;
  --pink: #ff00aa;
  --orange: #ff8800;
  --purple: #7b61ff;
  --font-display: 'Instrument Serif', serif;
  --font-mono: 'Roboto Mono', monospace;
}
```

Fluid typography (zero breakpoints):

```css
.hero-title    { font: normal clamp(3rem, 12vw, 8rem)/0.95 var(--font-display); }
.hero-subtitle { font: 400 clamp(0.65rem, 1.8vw, 1rem)/1.4 var(--font-mono); letter-spacing: 0.3em; text-transform: uppercase; }
.hero-tagline  { font: italic clamp(1.1rem, 3vw, 1.8rem)/1.3 var(--font-display); }
.section-title { font: 700 clamp(0.7rem, 1.5vw, 0.85rem)/1 var(--font-mono); letter-spacing: 0.25em; text-transform: uppercase; }
.prog-hora     { font: 700 clamp(0.85rem, 2vw, 1rem)/1 var(--font-mono); }
.prog-titulo   { font: 500 clamp(1rem, 2.5vw, 1.15rem)/1.3 var(--font-mono); }
.prog-orador   { font: 300 clamp(0.8rem, 2vw, 0.95rem)/1.3 var(--font-mono); }
```

HTML structure:

```html
<canvas id="wave-bg"></canvas>

<main id="app">
  <!-- HERO -->
  <section class="hero" id="hero">
    <p class="hero-inst"><!-- IADE · 2026 --></p>
    <h1 class="hero-title"><!-- TRAMA --></h1>
    <p class="hero-subtitle"><!-- JORNADAS DE DESIGN --></p>
    <p class="hero-tagline"><!-- Cruzar, Entrelaçar, Gerar --></p>
    <p class="hero-data"><!-- 15 Maio · Auditório IADE --></p>
    <a class="hero-cta" href="#programa">▼ PROGRAMA</a>
  </section>

  <!-- PROGRAMA -->
  <section class="programa" id="programa">
    <h2 class="section-title">Programa</h2>
    <div id="programa-list"><!-- rendered by JS --></div>
  </section>

  <!-- CONVIDADOS -->
  <section class="convidados" id="convidados">
    <h2 class="section-title">Convidados</h2>
    <div class="grid-oradores" id="oradores-grid"><!-- rendered by JS --></div>
  </section>

  <!-- INFO -->
  <section class="info" id="info">
    <h2 class="section-title">Informações</h2>
    <div id="info-content"><!-- rendered by JS --></div>
    <footer class="footer"><!-- rendered by JS --></footer>
  </section>
</main>
```

Key CSS layout (fluid, zero breakpoints):

```css
canvas#wave-bg { position: fixed; inset: 0; width: 100%; height: 100%; z-index: 0; pointer-events: none; }
main#app { position: relative; z-index: 1; max-width: 960px; margin: 0 auto; padding: 0 clamp(1rem, 4vw, 2rem); }
.hero { min-height: 100svh; display: flex; flex-direction: column; align-items: center; justify-content: center; text-align: center; gap: clamp(0.5rem, 2vw, 1rem); }
.grid-oradores { display: grid; grid-template-columns: repeat(auto-fit, minmax(min(280px, 100%), 1fr)); gap: clamp(1rem, 3vw, 1.5rem); }
.programa .prog-item { padding: clamp(0.75rem, 2vw, 1rem) 0; border-bottom: 1px solid var(--text-muted); }
```

**Step 2: Verify HTML renders correctly**

Open `app/index.html` in browser — should show black page with structure, no content yet (JS not added).

**Step 3: Commit**

```bash
git add app/index.html
git commit -m "feat: HTML skeleton with TRAMA design system CSS"
```

---

### Task 3: Add JavaScript — fetch data.json and render all sections

**Files:**
- Modify: `app/index.html` (add `<script>` before `</body>`)

**Step 1: Add JS that fetches data.json and renders content**

The JS does:
1. `fetch('data.json')` on DOMContentLoaded
2. Render hero section from `data.evento`
3. Render programme list from `data.programa` — each item shows hora (coloured), título, orador, optional Teams link, expandable description
4. Render speaker grid from `data.oradores` — photo, name, role, company, coloured accent line
5. Render info section from `data.evento` + `data.links`
6. Format date in Portuguese (e.g., "15 Maio 2026")

Key rendering functions:

```javascript
function renderHero(evento) {
  // fills .hero-inst, .hero-title, .hero-subtitle, .hero-tagline, .hero-data
}

function renderPrograma(programa) {
  // creates prog-item divs with:
  // - .prog-hora (coloured with item.cor)
  // - .prog-titulo
  // - .prog-orador
  // - .prog-teams-link (if linkTeams exists)
  // - .prog-desc (hidden by default, toggled by "Ver mais")
  // - pausa items get .prog-pausa class (dimmed, different style)
}

function renderOradores(oradores) {
  // creates card divs in grid with:
  // - img (with onerror fallback to coloured initial)
  // - name, cargo, empresa
  // - accent border-left coloured with orador.cor
  // - click → scrolls to matching programme item
}

function renderInfo(evento, links) {
  // local, morada, links list, footer
}
```

Expandable descriptions:

```javascript
// Toggle "Ver mais" on programme items
function toggleDesc(el) {
  const desc = el.closest('.prog-item').querySelector('.prog-desc');
  const isOpen = desc.classList.toggle('open');
  el.textContent = isOpen ? '▾ Ver menos' : '▸ Ver mais';
}
```

Speaker photo fallback (coloured initial when no photo):

```javascript
function createInitialAvatar(name, color) {
  const canvas = document.createElement('canvas');
  canvas.width = canvas.height = 120;
  const ctx = canvas.getContext('2d');
  ctx.fillStyle = color + '22'; // very faint background
  ctx.fillRect(0, 0, 120, 120);
  ctx.fillStyle = color;
  ctx.font = '500 48px "Roboto Mono"';
  ctx.textAlign = 'center';
  ctx.textBaseline = 'middle';
  ctx.fillText(name.charAt(0).toUpperCase(), 60, 60);
  return canvas.toDataURL();
}
```

**Step 2: Test in browser**

Open `app/index.html` via local server (Python or Live Server). Verify:
- Hero shows TRAMA title, subtitle, tagline, date
- Programme lists all 9 items with correct colours
- "Ver mais" expands descriptions
- Teams links are clickable
- Pausa has dimmed style
- Speaker grid shows coloured initial avatars (no photos yet)
- Info section shows location and links
- Everything scales fluidly from 320px to 1920px (resize browser)

**Step 3: Commit**

```bash
git add app/index.html
git commit -m "feat: JS renders all sections from data.json"
```

---

### Task 4: Add Canvas wave background (extracted from v08)

**Files:**
- Modify: `app/index.html` (add wave animation JS)

**Step 1: Extract and simplify wave animation from v08**

From `v01-interactiva/index.html`, extract:
- `waveAt(x, y, t)` function (simplified — remove bounce, keep base wave + elasticity)
- `svgPolylines` data array (all 17 polylines with colours)
- `TRAMA_LETTERS` paths + `parseSvgPath()` + `tramaParsed`
- Subdivide polyline rendering
- `drawDistortedLetters()` per-vertex distortion

Simplify for background use:
- No hand tracking, no camera, no grid physics (Point class)
- `getDistortedPoint(x, y)` uses only `waveAt()` — no spring physics
- Fixed low-amplitude parameters: `elasticAmplitude = 12`, `elasticSpeed = 0.8`
- Canvas renders at low opacity behind content
- Uses `requestAnimationFrame` with ~30fps throttle to save battery on mobile

The wave canvas draws:
1. Fill background `#070709`
2. Draw polylines with wave distortion (each vertex offset by `waveAt()`)
3. Draw TRAMA letters with per-vertex wave distortion
4. Canvas has CSS `opacity: 0.18` so it doesn't interfere with text readability

Key simplified `getDistortedPoint`:

```javascript
function getDistortedPoint(canvasX, canvasY) {
  const w = waveAt(canvasX, canvasY, animTime);
  return { x: canvasX + w.dx, y: canvasY + w.dy };
}
```

Canvas sizing — uses full viewport, maps 1920×1080 design coords to fit:

```javascript
function resizeCanvas() {
  const c = document.getElementById('wave-bg');
  c.width = window.innerWidth;
  c.height = window.innerHeight;
}
```

**Step 2: Test in browser**

- Wave animation visible behind hero text
- Polylines distort gently
- TRAMA letters distort with polylines
- Scrolling content remains readable
- Mobile: animation runs smoothly, doesn't drain battery excessively

**Step 3: Commit**

```bash
git add app/index.html
git commit -m "feat: animated TRAMA wave background from v08"
```

---

### Task 5: Polish interactions + smooth scroll + accessibility

**Files:**
- Modify: `app/index.html`

**Step 1: Add smooth scroll and navigation**

- Hero CTA `▼ PROGRAMA` smooth scrolls to `#programa`
- Speaker card click → smooth scroll to matching programme item (highlight briefly)
- CSS `scroll-behavior: smooth; scroll-padding-top: 1rem;`

**Step 2: Add highlight animation for programme items**

When scrolled to from speaker card:

```css
.prog-item.highlight {
  animation: highlight-flash 1.5s ease-out;
}
@keyframes highlight-flash {
  0% { background: rgba(240, 236, 230, 0.08); }
  100% { background: transparent; }
}
```

**Step 3: Accessibility**

- All interactive elements focusable
- `aria-expanded` on "Ver mais" toggles
- `role="list"` on programme
- `prefers-reduced-motion: reduce` → disable wave animation, use static background
- `<meta name="theme-color" content="#070709">`
- `lang="pt"` on `<html>`

**Step 4: Meta tags for sharing**

```html
<meta property="og:title" content="TRAMA — Jornadas de Design 2026">
<meta property="og:description" content="Cruzar, Entrelaçar, Gerar. IADE, 15 Maio 2026.">
<meta property="og:type" content="website">
<meta property="og:url" content="https://rodrigobrazao.github.io/trama-experiences/app/">
```

**Step 5: Test**

- Smooth scroll works on mobile Safari and Chrome
- Speaker → programme scroll + highlight works
- `prefers-reduced-motion` disables canvas animation
- Social share preview shows correct title/description

**Step 6: Commit**

```bash
git add app/index.html
git commit -m "feat: smooth scroll, accessibility, meta tags"
```

---

### Task 6: Final commit + push to GitHub Pages

**Files:**
- Modify: `README.md` (add link to webapp)

**Step 1: Update main README**

Add under "Experiências":

```markdown
### 📱 [App - Programa](./app/)
Webapp mobile-first para o programa das Jornadas de Design

**[🌐 Ver Online](https://rodrigobrazao.github.io/trama-experiences/app/)**
```

**Step 2: Final commit and push**

```bash
git add README.md app/
git commit -m "feat: TRAMA webapp complete — programme, speakers, wave background"
git push origin main
```

**Step 3: Verify live**

Wait ~60 seconds, then test:
- Desktop: `https://rodrigobrazao.github.io/trama-experiences/app/`
- Mobile: scan QR or open URL on phone
- Verify all sections render, Teams links work, wave animates

---

## Summary

| Task | What | Estimated time |
|------|------|---------------|
| 1 | data.json with sample data | 2 min |
| 2 | HTML skeleton + CSS design system | 15 min |
| 3 | JS fetch + render all sections | 20 min |
| 4 | Canvas wave background from v08 | 15 min |
| 5 | Polish: scroll, a11y, meta tags | 10 min |
| 6 | README update + deploy | 2 min |
| **Total** | | **~65 min** |
