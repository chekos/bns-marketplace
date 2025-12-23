---
description: Plan and generate materials for a community event (AMA, workshop, webinar, or meetup)
---

When /event is used with the following event details:

$ARGUMENTS

Plan and generate comprehensive event materials following these steps:

## 1. Event Analysis

First, determine the event parameters:
- **Type**: AMA / Workshop / Webinar / Meetup
- **Topic**: What is the event about?
- **Speaker/Host**: Who is presenting? (if specified)
- **Date/Time**: When? (if specified)
- **Duration**: How long?
- **Audience**: Who should attend? What level?
- **Goal**: What should attendees gain?

## 2. Timezone Planning

For tacosdedatos events, always include these timezones:

| Ciudad | Hora |
|--------|------|
| Ciudad de México (CDMX) | [Time] |
| Bogotá/Lima | [+1 hora] |
| Buenos Aires | [+3 horas] |
| Madrid | [+7 horas] |

Recommended times:
- **Weekday**: 18:00-20:00 CDMX
- **Weekend**: 11:00-13:00 CDMX

## 3. Generate Event Materials

### A. Discord Announcement

```markdown
# 🎉 [Event Type Emoji] [Event Title]

📅 **Fecha**: [Día, DD de Mes, YYYY]
🕐 **Hora**: [HH:MM] (CDMX) / [HH:MM] (Bogotá) / [HH:MM] (Buenos Aires) / [HH:MM] (Madrid)
📍 **Dónde**: [Platform]
🎟️ **Costo**: Gratis

---

## ¿De qué se trata?

[2-3 oraciones describiendo el evento y el valor]

## Lo que vas a [aprender/obtener/discutir]

- [Takeaway 1]
- [Takeaway 2]
- [Takeaway 3]

## ¿Para quién es?

[Descripción del público objetivo y nivel]

## Sobre [Speaker/Host]

[Bio breve - 2-3 oraciones]

---

## 🔗 Cómo participar

[Instrucciones de registro o acceso]

¿Preguntas? ¡Déjalas aquí! 👇

@everyone
```

### B. Reminder Messages

**24 hours before:**
```markdown
# ⏰ ¡Mañana! [Event Name]

¡Recordatorio! Mañana es nuestro [tipo de evento] sobre [tema].

📅 [Fecha y hora con todos los timezones]
🔗 [Link para unirse]

## Prepárate

- [Requisito 1 si aplica]
- [Requisito 2 si aplica]

¿No puedes asistir en vivo? Te enviaremos la grabación.

¡Nos vemos mañana! 🌮
```

**1 hour before:**
```markdown
# 🚀 ¡Empezamos en 1 hora!

[Event Name] está por comenzar.

⏰ [Hora con timezones]
🔗 [Link]

Abrimos la sala 10 minutos antes. ¡Los esperamos!
```

### C. Speaker Briefing (if speaker specified)

```markdown
# Briefing: [Event Name]

¡Hola [Speaker Name]!

## Logística
- **Fecha**: [Date]
- **Hora**: [Time with timezone]
- **Plataforma**: [Platform]
- **Tu link de acceso**: [Will be provided]
- **Duración total**: [Duration]

## Tu tiempo
- Presentación: [X] minutos
- Q&A: [X] minutos

## Audiencia
- **Tamaño esperado**: [Estimate]
- **Nivel**: [Beginner/Intermediate/Advanced]

## Estructura

1. [00:00] Host bienvenida (2 min)
2. [00:02] Tu intro (1 min)
3. [00:03] Presentación ([X] min)
4. [XX:00] Q&A ([X] min)
5. [XX:00] Cierre (2 min)

## Tech Check
Por favor agenda un test técnico al menos 24 horas antes.

## Contacto del día
- [Contact name and method]

¿Preguntas? Responde a este mensaje.

¡Gracias por ser parte de tacosdedatos! 🌮
```

### D. Run Sheet

```markdown
# Run Sheet: [Event Name]
**Fecha**: [Date]
**Hora inicio**: [Time]

## Roles
- **Host**: [Name]
- **Speaker**: [Name]
- **Moderador de chat**: [Name]

## Timeline

### Pre-evento
| Hora | Acción | Quién |
|------|--------|-------|
| -30 min | Abrir plataforma, test de tech | Host |
| -15 min | Speaker se conecta | Speaker |
| -10 min | Abrir al público | Host |
| -5 min | Saludar a early arrivals | Moderador |

### Durante el evento
| Hora | Dur | Segmento | Notas |
|------|-----|----------|-------|
| 0:00 | 2 min | Bienvenida | Host: reglas, estructura |
| 0:02 | 1 min | Intro speaker | Host presenta |
| 0:03 | [X] min | Contenido | [Notas] |
| [X] | [X] min | Q&A | Moderador filtra |
| [X] | 2 min | Cierre | CTA, próximo evento |

### Post-evento
| Tiempo | Acción | Quién |
|--------|--------|-------|
| +0 min | Detener grabación | Host |
| +5 min | Agradecer speaker | Host |
| +24 hrs | Enviar follow-up | Event Coordinator |
| +48 hrs | Compartir grabación | [Name] |

## Contingencias
- **Speaker no conecta**: [Plan B]
- **Problemas de audio/video**: [Backup]
- **Baja asistencia**: [Cómo manejar]
- **Troll/spam**: Moderador remueve + mute
```

### E. Post-Event Follow-Up

```markdown
# 🙏 ¡Gracias por asistir a [Event Name]!

¡Qué gran sesión! Gracias a todos los que participaron.

## Recursos

📹 **Grabación**: [Link - disponible pronto]
📑 **Slides/Materiales**: [Link if applicable]

## Recursos mencionados
- [Resource 1]
- [Resource 2]
- [Resource 3]

## Tu feedback nos importa

Cuéntanos qué te pareció (2 min): [Survey link]

## Próximamente

No te pierdas: [Teaser next event]

¡Gracias, [Speaker]! 🌮
```

### F. Feedback Survey

```markdown
# Encuesta: [Event Name]

1. ¿Qué tan satisfecho/a quedaste? (1-5)

2. ¿El contenido fue relevante para ti?
   □ Muy relevante □ Algo □ Poco □ No

3. ¿El nivel fue apropiado?
   □ Muy básico □ Apropiado □ Muy avanzado

4. Lo mejor del evento:
   [Texto]

5. Qué podríamos mejorar:
   [Texto]

6. ¿Qué temas te gustaría ver después?
   [Texto]

7. ¿Recomendarías este evento? (0-10)

¡Gracias! 🌮
```

## 4. Planning Checklist

Generate a checklist based on weeks until event:

```markdown
## Checklist: [Event Name]

### 4 semanas antes
- [ ] Confirmar fecha y hora
- [ ] Confirmar speaker/host
- [ ] Crear página de registro (si aplica)
- [ ] Preparar anuncio

### 2-3 semanas antes
- [ ] Publicar anuncio en Discord
- [ ] Promoción en redes sociales
- [ ] Incluir en newsletter
- [ ] Enviar briefing a speaker
- [ ] Crear run sheet

### 1 semana antes
- [ ] Enviar recordatorio
- [ ] Tech check con speaker
- [ ] Pre-recolectar preguntas (si Q&A)
- [ ] Preparar survey de feedback

### Día anterior
- [ ] Test final de tecnología
- [ ] Enviar recordatorio final
- [ ] Confirmar todo con speaker

### Día del evento
- [ ] Abrir sala temprano
- [ ] Ejecutar run sheet
- [ ] Grabar sesión

### Después (48 hrs)
- [ ] Agradecer a speaker
- [ ] Enviar follow-up a asistentes
- [ ] Publicar grabación
- [ ] Analizar feedback
```

## Output Format

```markdown
# Event Plan: [Event Name]

**Type**: [AMA/Workshop/Webinar/Meetup]
**Date**: [If specified, or suggested]
**Duration**: [Estimated]
**Audience**: [Target]

---

## Materials Generated

1. [Discord Announcement]
2. [Reminder Messages]
3. [Speaker Briefing] (if applicable)
4. [Run Sheet]
5. [Post-Event Follow-Up]
6. [Feedback Survey]
7. [Planning Checklist]

---

## Next Steps

1. [ ] [First action to take]
2. [ ] [Second action]
3. [ ] [Third action]

## Notes
- [Any special considerations]
- [Suggestions or alternatives]
```
