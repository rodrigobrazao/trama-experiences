# 🎵 TRAMA V01 - Interactiva

Instalação interativa com grid elástica responsiva ao tracking 3D de mãos e face.

## 🌐 Demo Online
**[▶️ Experimentar Agora](https://rodrigobrazao.github.io/trama-experiences/v01-interactiva/)**

---

## 🎮 O Que É?

Uma experiência audiovisual interativa que responde ao movimento das tuas mãos e face em tempo real:

1. **Move as mãos** → Grid distorce elasticamente
2. **Toca vértices** → Gera sons musicais
3. **Profundidade Z** → Movimento frente/trás afeta timbre
4. **Face tracking** → Mesh 3D completa da cara

Cada vértice da malha é uma "corda" virtual que produz notas diferentes!

---

## ✨ Características

### Tracking
- **2 mãos simultâneas** (10 fingertips total)
- **Profundidade Z** (eixo frente/trás)
- **Face Mesh 3D** (468 pontos faciais)
- **Overlays ajustáveis** (opacidade 0-100%)

### Visual
- **Grid elástica** com física de mola
- **Distorção per-vertex** das letras TRAMA (cada vértice deforma independentemente)
- **Wireframe das mãos** (verde)
- **Fingertips 3D** (vermelho com profundidade)
- **Face mesh completa** (azul claro + cyan/magenta)

### Sonoro
- **5 instrumentos** de síntese
- **Cada vértice = nota diferente**
- **Profundidade afeta timbre**
- **Velocidade afeta volume**

---

## 🎹 Instrumentos

1. **Piano** - FM Synthesis com modulação
2. **Violoncelo** - 3 osciladores + vibrato + chorus
3. **Trompete** - Square wave + harmónicos ímpares
4. **Contrabaixo** - Sawtooth + sub-harmónico profundo
5. **Bateria** - 10 elementos percussivos (kick, snare, hi-hat, crash, etc)

---

## 🎚️ Controlos

### Sliders
- **Elasticidade** (0.02-0.15) - Força das molas
- **Densidade de Malha** (15-35) - Resolução do grid
- **Raio de Captura** (30-100px) - Distância para "agarrar" vértices
- **Opacidade Vídeo** (0-100%)
- **Opacidade Tracking** (0-100%) - Todos os overlays
- **Volume Som** (0-100%)
- **Oitava** (-6 a +6) - Transposição

### Checkboxes
- **Face Mesh** - Mostrar/esconder tracking facial

---

## 🛠️ Stack Técnico

### Tracking
- **MediaPipe Hands** - 21 landmarks por mão × 2 mãos
- **MediaPipe Face Mesh** - 468 landmarks faciais

### Audio
- **Web Audio API**
- **OscillatorNode** - Síntese de ondas
- **GainNode** - Envelopes ADSR
- **BiquadFilterNode** - Filtros de timbre

### Visual
- **Canvas 2D API** - Rendering
- **Física customizada** - Sistema de molas e damping
- **SVG path parsing** - Per-vertex distortion das letras TRAMA

---

## 📱 Compatibilidade

- ✅ Chrome 90+ (recomendado)
- ✅ Safari 14+
- ✅ Firefox 88+
- ✅ Chrome Mobile (Android/iOS)

**Requisitos:**
- Webcam (720p+)
- Permissões de câmera
- HTTPS ou localhost

---

## 🎓 Desenvolvimento

**Por**: Rodrigo Brazão
**Contexto**: IADE - Design Visual 2025
**Tema**: Interação corporal com sistemas generativos audiovisuais

---

## 📝 Notas Técnicas

### Performance
- **Desktop moderno**: 30-60 FPS
- **Laptop médio**: 20-30 FPS
- **Raspberry Pi 4/5**: 15-25 FPS

### Otimizações
Para melhor performance:
1. Reduzir "Densidade de Malha" para 15
2. Desligar "Face Mesh"
3. Reduzir "Opacidade Tracking" para 30%

---

**[🔙 Voltar ao Portfolio](../)**
