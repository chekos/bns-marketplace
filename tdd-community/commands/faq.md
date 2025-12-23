---
description: Generate a comprehensive FAQ response for a community question or topic
---

When /faq is used with the following topic or question:

$ARGUMENTS

Create a comprehensive FAQ response following these steps:

## 1. Analyze the Question/Topic

First, understand what's being asked:
- **Category**: Community / Technical / Events / Moderation / Contributing
- **Complexity**: Simple (quick answer) / Medium (some explanation) / Complex (detailed guide)
- **Audience**: Newcomers / Active members / Potential contributors
- **Intent**: Information / How-to / Troubleshooting / Clarification

## 2. Research and Structure

For the response, consider:
- What do people actually need to know?
- What are common follow-up questions?
- What resources should be linked?
- What actions should they take?

## 3. Generate FAQ Response

Create a response in this format:

```markdown
## [Question phrased clearly]

[Direct answer - 1-2 sentences that answer the core question]

### Más detalles

[Expanded explanation with context - 2-4 sentences or bullet points]

### Pasos / Cómo hacerlo

[If actionable, numbered steps or bullet points]

1. [Step 1]
2. [Step 2]
3. [Step 3]

### Recursos relacionados

- [Resource 1]: [Brief description]
- [Resource 2]: [Brief description]
- #[relevant-channel]: [Why it's relevant]

### ¿Más preguntas?

[Where to go for more help - channel, person, or action]
```

## 4. Tone Guidelines

- **Helpful, not condescending**: Answer as if explaining to a smart person who just doesn't know this yet
- **Concise but complete**: Cover what's needed without overwhelming
- **Action-oriented**: Give clear next steps
- **Friendly**: Use casual "tú", be approachable
- **Honest**: If something is hard or has caveats, say so

## 5. FAQ Categories and Templates

### Community FAQs

**About tacosdedatos:**
```markdown
## ¿Qué es tacosdedatos?

tacosdedatos es una comunidad y publicación en español enfocada en ciencia de datos, análisis, visualización, y tecnología.

### Lo que hacemos
- 📝 Contenido educativo (tutoriales, artículos)
- 💬 Comunidad activa en Discord
- 🎉 Eventos (AMAs, workshops, meetups)
- 📧 Newsletter semanal

### Para quién es
Profesionales, estudiantes, y entusiastas de los datos que prefieren aprender en español.

### Únete
- Discord: [link]
- Newsletter: [link]
- Twitter: @tacosdedatos
```

**Participation:**
```markdown
## ¿Cómo puedo participar?

¡Hay muchas formas de ser parte de la comunidad!

### Nivel 1: Consumir y aprender
- Lee #recursos para materiales
- Únete a eventos
- Sigue las discusiones

### Nivel 2: Participar activamente
- Haz preguntas en #ayuda
- Responde preguntas de otros
- Comparte recursos útiles

### Nivel 3: Contribuir
- Muestra tus proyectos en #proyectos
- Propón eventos o contenido
- Ayuda a dar la bienvenida a nuevos miembros

### Nivel 4: Liderar
- Conviértete en moderador
- Presenta en eventos
- Co-crea contenido

¿Por dónde quieres empezar?
```

### Technical FAQs

**Learning path:**
```markdown
## ¿Por dónde empiezo con [tema]?

[Personalizar según el tema específico]

### Fundamentos (1-2 meses)
- [Skill 1]: [Recurso recomendado]
- [Skill 2]: [Recurso recomendado]

### Intermedio (2-4 meses)
- [Skill 3]: [Recurso recomendado]
- [Skill 4]: [Recurso recomendado]

### Práctica
- [Proyecto sugerido 1]
- [Proyecto sugerido 2]

### Recursos de la comunidad
- #recursos para más materiales
- #ayuda para preguntas
- [Tutoriales nuestros si aplica]

### Tip
[Consejo práctico sobre el aprendizaje]
```

**Tool recommendations:**
```markdown
## ¿Qué herramientas recomiendan para [caso]?

Depende de tu contexto, pero aquí las favoritas de la comunidad:

### Para [caso específico 1]
- **[Herramienta 1]**: [Pros y contras breves]
- **[Herramienta 2]**: [Pros y contras breves]

### Para [caso específico 2]
- **[Herramienta 3]**: [Pros y contras breves]
- **[Herramienta 4]**: [Pros y contras breves]

### Nuestra recomendación
[Si hay una recomendación clara, justificarla]

### Más opiniones
Pregunta en #general - cada quien tiene sus preferencias y contexto.
```

### Events FAQs

**Upcoming events:**
```markdown
## ¿Cuándo es el próximo evento?

### Próximamente
[Si hay eventos confirmados, listarlos]

📅 **[Evento 1]**: [Fecha] - [Breve descripción]
📅 **[Evento 2]**: [Fecha] - [Breve descripción]

### Dónde enterarte
- 📢 #anuncios y #eventos en Discord
- 📧 Newsletter (suscríbete: [link])
- 🐦 Twitter: @tacosdedatos

### Proponer un evento
¿Tienes una idea? Compártela en #ideas.
```

### Moderation FAQs

**Rules:**
```markdown
## ¿Cuáles son las reglas?

### En resumen
✅ Respeta a todos
✅ Sé constructivo/a
✅ Mantén los temas organizados
❌ No spam, acoso, ni contenido inapropiado

### Reglas completas
Lee #reglas para la versión detallada.

### Si ves algo
Reporta: click derecho → Report, o escríbele a un @Moderador.

### Consecuencias
Advertencia → Silenciamiento → Ban temporal → Ban permanente
(Según la gravedad)
```

**Reporting:**
```markdown
## ¿Cómo reporto un problema?

### Opciones para reportar

1. **En Discord**: Click derecho en el mensaje → Report
2. **DM a moderador**: Escríbele a cualquier @Moderador
3. **Urgente**: Menciona @Moderadores en el canal

### Qué incluir
- Qué pasó
- Quién estuvo involucrado
- Cuándo (link al mensaje si posible)

### Qué esperar
- Los reportes son confidenciales
- Respuesta en <24 horas
- No toleramos represalias

### Si necesitas ayuda ahora
[Contacto directo si hay uno disponible]
```

## 6. Multi-Question FAQs

If the topic is broad, create a mini-FAQ:

```markdown
# FAQ: [Tema General]

## Preguntas frecuentes sobre [tema]

### [Pregunta 1]
[Respuesta concisa]

### [Pregunta 2]
[Respuesta concisa]

### [Pregunta 3]
[Respuesta concisa]

### ¿Otra pregunta?
Pregunta en #ayuda o escríbele a [contacto].
```

## Output Format

```markdown
# FAQ Response: [Topic/Question]

**Category**: [Community/Technical/Events/Moderation]
**Complexity**: [Simple/Medium/Complex]
**For**: [Audience]

---

[The FAQ response - ready to use]

---

## Related FAQs to Consider
- [Related question 1]
- [Related question 2]

## Where to Use This
- [ ] Pin in relevant channel
- [ ] Add to bot FAQ commands
- [ ] Include in welcome materials
- [ ] Link from other FAQs
```
