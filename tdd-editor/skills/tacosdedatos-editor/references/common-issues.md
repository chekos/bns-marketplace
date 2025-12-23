# Common Issues

Patterns to watch for when editing tacosdedatos content, with examples and fix directions.

---

## Voice Issues

### Issue: AI-Speak

Generic phrases that signal machine-generated content.

**Red Flag Phrases**:
- "It's important to note that..."
- "In conclusion..."
- "Furthermore..."
- "As we can see..."
- "Obviously..."
- "Simply..."
- "This is a game-changer"
- "In today's fast-paced world..."

**Example - Bad**:
> "It's important to note that AI tools can significantly enhance productivity. In conclusion, these technologies represent a paradigm shift in how we work."

**Example - Fixed**:
> "Mira, cerré dos tickets de JIRA—uno de 5 puntos y otro de 3—en menos de 4 horas. Antes eso me tomaba un día completo."

**Fix Direction**: Replace generic claims with specific personal experience. Show, don't tell.

---

### Issue: Empty Antithesis

The "No es X. Es Y." pattern without real contrast.

**Red Flag Phrases**:
- "No es sobre X. Es sobre Y."
- "No reemplazamos X. Lo expandimos."
- "Esto no es X. Esto es Y."
- "No hacemos X. Hacemos Y."

**Example - Bad**:
> "No estamos eliminando opciones. Estamos agregando posibilidades."

**Example - Fixed**:
> "Agregamos nuevas posibilidades."

**The Test**: Ask these three questions:
1. Does anyone actually think the opposite?
2. Does the contrast add new information?
3. Would it work better just stating the positive?

If answers are no/no/yes—cut the contrast.

**When Antithesis DOES Work**:
> "Muchos piensan que necesitas saber TypeScript para usar Claude Code. No es así—el modelo lo escribe por ti."

This works because it corrects an actual common belief.

---

### Issue: Correlative Monotony

Using "both...and", "not only...but also", "either...or" patterns repeatedly in one piece.

**Signals**:
- Same correlative structure appears 2+ times in a post
- Rhythm becomes predictable (setup...payoff, setup...payoff)
- Reader notices the scaffolding instead of the content
- Feels AI-generated—LLMs love balanced structures

**Example - Bad**:
> "Tanto el diseño como el código necesitan revisión. No solo mejora la legibilidad, sino también el rendimiento. Ni el linter ni los tests pasaron."

Three correlatives in three sentences. The reader starts seeing the pattern.

**Example - Fixed**:
> "El diseño y el código necesitan revisión. Mejora la legibilidad. El rendimiento también. El linter falló. Los tests tampoco."

**The Rule**: One correlative per section maximum. If you've used "tanto...como" in paragraph 2, find a different way to connect ideas in paragraph 3.

**Fix Direction**: Convert to simple conjunctions ("y", "también") or just state things separately. Correlatives should be rare punctuation, not a default rhythm.

---

### Issue: False Formality

Writing in a corporate or academic tone instead of peer conversation.

**Signals**:
- "Usted" instead of "tú"
- Passive voice throughout
- No personal pronouns
- Formal transitions ("Furthermore", "Moreover")
- Missing contractions and colloquialisms

**Example - Bad**:
> "Se recomienda que los usuarios implementen estas prácticas para optimizar sus flujos de trabajo."

**Example - Fixed**:
> "Prueba esto mañana. Te va a cambiar cómo trabajas."

**Fix Direction**: Imagine you're explaining this to a friend over coffee. Write that version.

---

### Issue: Missing Cultural Grounding

Abstract concepts floating without anchors.

**Signals**:
- Generic metaphors anyone could use
- No specific cultural references
- Could appear in any tech blog
- No sense of place or identity

**Example - Bad**:
> "La inteligencia artificial es como tener un asistente muy capaz."

**Example - Fixed**:
> "Es como tener un compañero de trabajo que nunca duerme, nunca se queja, y siempre dice 'sale, ahorita lo hago'—pero que a veces inventa cosas si no le das contexto suficiente."

**Fix Direction**: Ground abstractions with references that feel real—specific places, experiences, cultural touchstones that resonate with the audience.

---

### Issue: Missing Vulnerability

All expertise, no struggle.

**Signals**:
- Only successes mentioned
- No admitted failures or uncertainties
- No "learning in public"
- Authoritative without humility

**Example - Bad**:
> "Implementé el sistema en tres días y funcionó perfectamente."

**Example - Fixed**:
> "Me tomó tres intentos—el primero fue un desastre completo, el segundo casi funciona, y en el tercero finalmente entendí qué estaba haciendo mal."

**Fix Direction**: What went wrong before it went right? What do you still not fully understand? Lead with that.

---

## Structure Issues

### Issue: Buried Lede

The interesting part comes too late.

**Signals**:
- Context before hook
- "Background" opening
- Stakes after paragraph 3
- Reader has to search for the point

**Example - Bad**:
> "En los últimos años, la inteligencia artificial ha evolucionado significativamente. Muchas empresas están adoptando estas tecnologías. Hay diferentes enfoques para implementarlas. Esta semana logré algo interesante..."

**Example - Fixed**:
> "Esta semana logré 350 horas de trabajo. Sí, leíste bien—350 horas. Te cuento cómo."

**Fix Direction**: Find the "wait, what?" moment. Put it first. Context can come after you have attention.

---

### Issue: Recap Closing

Summarizing instead of reframing.

**Signals**:
- "En resumen..."
- "Entonces, lo que vimos fue..."
- List of points covered
- No new insight or forward momentum

**Example - Bad**:
> "En resumen, vimos cómo configurar el entorno, escribir el primer script, y desplegarlo. Estos pasos te ayudarán a empezar con la herramienta."

**Example - Fixed**:
> "Mañana por la mañana vas a abrir tu editor y en lugar de preguntarte por dónde empezar, vas a decir 'hazme un PR para esto.' La pregunta ya no es si puedes—es qué vas a construir primero."

**Fix Direction**: What new lens does this give the reader? What possibility opens up? End there.

---

### Issue: Dead Zones

Long stretches that lose the reader.

**Types**:

1. **Abstract Philosophy Without Examples**
   > Three paragraphs about "the nature of productivity" with no concrete instance.

2. **Technical Deep Dive Without Context**
   > Jump into code without explaining what problem it solves or why the reader should care.

3. **Lists Without Narrative**
   > Bullet points of features with no connecting story or personal stake.

**Fix Direction**: Every 300-400 words needs something concrete—an example, code block, personal anecdote, or visual. If you're in abstraction mode too long, ground it.

---

### Issue: Missing 4-Beat Opening

Opening that doesn't follow Spark → Stakes → Zoom → Thesis.

**What's Missing**:
- **No Spark**: Starts with context instead of a moment
- **No Stakes**: Why now? Why should I care?
- **No Zoom**: Just personal without universal connection
- **No Thesis**: Where are we going?

**Example - Missing Stakes**:
> "Esta semana aprendí a usar una nueva herramienta. Es bastante interesante. Te voy a mostrar cómo funciona."

**Example - Fixed**:
> "Esta semana aprendí a usar una nueva herramienta. (Spark) Lo que antes me tomaba un día ahora toma 40 minutos. (Stakes) Estamos en un momento donde saber orquestar modelos importa más que saber escribir cada línea tú mismo. (Zoom) Te voy a mostrar exactamente cómo integrarla a tu flujo. (Thesis)"

**Fix Direction**: Check each beat. Which is missing? Add it.

---

## Engagement Issues

### Issue: No Transformation

No clear before/after state.

**Signals**:
- Information without journey
- Tips without stakes
- "Here's how to do X" without "why X matters"

**Example - Bad**:
> "Para configurar el servidor, usa estos comandos..."

**Example - Fixed**:
> "Antes me tomaba 3 días debuggear estos errores de configuración. Ahora tengo un setup que arranca en 10 minutos. Aquí está exactamente lo que uso..."

**Fix Direction**: What changed? What was the before state? Make the transformation visible.

---

### Issue: Generic Advice

Could appear in any tech blog.

**Signals**:
- No personal experience
- No specific tools or metrics
- Broad best practices
- Nothing unique to tacosdedatos voice

**Example - Bad**:
> "Es importante planificar antes de codear. Divide el trabajo en tareas pequeñas. Haz commits frecuentes."

**Example - Fixed**:
> "Mi regla: no escribo una línea hasta que puedo explicar el ticket en una oración. 'Actualizar el endpoint de usuarios para validar emails'—eso es claro. 'Mejorar la autenticación'—eso es una trampa. Lo segundo siempre me cuesta el doble."

**Fix Direction**: What's YOUR experience with this? What specific thing do YOU do?

---

### Issue: CTA Overload

Multiple competing calls to action.

**Example - Bad**:
> "Suscríbete al newsletter, sígueme en Twitter, únete al Discord, descarga la guía, y comparte este post con un amigo."

**Example - Fixed**:
> "Si quieres ver más de estos workflows en acción, el Discord es donde comparto los experimentos que no llegan al newsletter. Únete aquí."

**Fix Direction**: One primary CTA. Optional secondary for engagement (comments, sharing). No more.

---

## Quick Reference: Issue → Fix Direction

| Issue | Quick Fix |
|-------|-----------|
| AI-speak | Replace generic with specific experience |
| Empty antithesis | Delete the "No es X" part |
| Correlative monotony | One per section max, use simple conjunctions |
| False formality | Rewrite as if talking to a friend |
| Missing grounding | Add specific cultural reference |
| Missing vulnerability | Share what went wrong first |
| Buried lede | Move the interesting part to line 1 |
| Recap closing | End with new possibility, not summary |
| Dead zone | Add concrete example or personal stake |
| Missing transformation | Show before and after states |
| Generic advice | Add your specific experience |
| CTA overload | Pick one primary action |
