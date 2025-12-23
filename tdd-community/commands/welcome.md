---
description: Generate a personalized welcome message for a new community member
---

When /welcome is used with the following member information:

$ARGUMENTS

Create a personalized, warm welcome message following these steps:

## 1. Analyze Member Introduction

First, extract key information from their introduction:
- **Name**: How they identify themselves
- **Location**: Where they're from (if mentioned)
- **Background**: Their profession, studies, or experience level
- **Interests**: What topics they're interested in (data, viz, ML, etc.)
- **Goals**: What they want to learn or achieve
- **Projects**: Any current or past projects mentioned

## 2. Find Connections

Based on their profile, identify:
- Relevant channels to recommend
- Recent discussions they might enjoy
- Resources that match their interests
- Potential connections with other members (if known)

## 3. Generate Welcome Message

Create a welcome message in this format:

```markdown
¡Bienvenido/a, [Nombre]! 🌮

[1-2 sentences acknowledging something specific from their intro - show you actually read it]

## Te va a encantar

Basado en tu interés en [sus intereses]:
- **#[canal-relevante-1]**: [por qué es relevante para ellos]
- **#[canal-relevante-2]**: [por qué es relevante para ellos]

## Recurso recomendado

[Un recurso específico o discusión reciente relacionada con sus intereses]

## Tu turno

[Una pregunta personalizada basada en su intro - algo que los invite a responder y profundizar la conversación]

¡Estamos aquí para ayudar si tienes cualquier pregunta!
```

## 4. Quality Checks

Before delivering, verify:
- [ ] ¿Usé su nombre correctamente?
- [ ] ¿Mencioné algo específico de SU intro (no genérico)?
- [ ] ¿Las recomendaciones son relevantes para SUS intereses?
- [ ] ¿La pregunta final es específica y fácil de responder?
- [ ] ¿El tono es cálido pero profesional?
- [ ] ¿Evité ser condescendiente o asumir su nivel?

## Channel Reference

Use these channel descriptions for recommendations:

| Canal | Para quién |
|-------|-----------|
| #python-ayuda | Preguntas sobre Python, pandas, etc. |
| #datos-ayuda | Análisis de datos, SQL, limpieza |
| #viz-ayuda | Visualización, gráficos, dashboards |
| #ml-ayuda | Machine learning, modelos, IA |
| #recursos | Materiales, tutoriales, herramientas |
| #proyectos | Mostrar y recibir feedback |
| #general | Conversación libre |
| #oportunidades | Trabajos y oportunidades |
| #eventos | Próximos eventos de la comunidad |

## Output Format

```markdown
# Welcome Message for [Name]

**Based on**: [Brief summary of their intro]
**Key interests**: [List]
**Recommended focus**: [Primary recommendation]

---

[The welcome message itself - ready to copy/paste]

---

## Notes
- **Suggested follow-up**: [If relevant, when to check in]
- **Potential connections**: [Other members with similar interests, if known]
```

Remember: The goal is to make them feel seen, welcomed, and excited to participate. Generic welcomes fail. Personalized welcomes create belonging.
