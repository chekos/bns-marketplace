# ELI5 Principle: Específico para Expertos, Accesible para Todos

## Principio Central

Cada pieza debe ser lo suficientemente específica para interesar a un usuario avanzado de IA y lo suficientemente descriptiva para que alguien inteligente pero nuevo al tema pueda seguirla sin hacer preguntas.

## Por Qué Importa

No estamos escribiendo para una audiencia — estamos escribiendo para múltiples niveles de experiencia simultáneamente. El developer con 10 años y el estudiante que empieza deben encontrar valor en el mismo párrafo.

## Los Patrones

### 1. Primera Vez = Contexto Inmediato

Cuando introduces un término o herramienta por primera vez, dale contexto en la misma oración o la siguiente.

**Ejemplos:**
- ✅ "Claude Code puede generar agentes especializados—como contratar contratistas para tareas específicas"
- ✅ "Los sub-agentes son archivos de texto en `.claude/agents/`. Edítalos directamente. No son código—son instrucciones"
- ❌ "Usa el Performance Oracle para optimizar" (¿qué es el Performance Oracle?)

### 2. Muestra el Proceso, No Solo el Resultado

No basta con decir qué hiciste. Muestra los pasos intermedios que alguien nuevo podría no inferir.

**Ejemplos:**
- ✅ "Abrí Claude Code desde la terminal y empecé a revisar lo que había hecho mi primo. Mi primo me mandó un screenshot del preview de Vercel con la página rota"
- ✅ "Escribe `/agents` en Claude Code. Describe lo que quieres. Eso es todo"
- ❌ "Implementé sub-agentes y funcionó" (¿cómo? ¿dónde? ¿con qué?)

### 3. Analogías Concretas, No Abstractas

Las comparaciones deben ser con cosas que todos conocen, no con otros conceptos técnicos.

**Funciona:**
- "Como contratar contratistas para tareas específicas"
- "Es como tener un interno brillante con amnesia"
- "Un restaurante que solo escucha a los que se quejan termina sin identidad"

**No funciona:**
- "Es como Kubernetes pero para prompts"
- "Piensa en ello como Redux para agentes"

### 4. Traduce Jerga a Acciones

Cuando uses términos técnicos, inmediatamente tradúcelos a lo que significan en práctica.

**Patrón efectivo:**
```
[Término técnico] — [lo que significa] — [lo que puedes hacer con eso]
```

**Ejemplos:**
- "Edge Functions (código que corre cerca del usuario, no en tu servidor) — significa que es más rápido"
- "Ventana de contexto (cuánto puede 'recordar' el modelo) — cada agente tiene la suya propia"

### 5. El Test del Nuevo Teammate

Escribe como si estuvieras onboarding a alguien inteligente pero completamente nuevo. No asumas conocimiento previo, pero sí capacidad de entender.

**Señales de que lo estás haciendo bien:**
- Defines términos en su primer uso
- Muestras ejemplos concretos
- Conectas conceptos nuevos con experiencias familiares
- Incluyes el "por qué" además del "qué"

## Preguntas de Auto-Evaluación

1. ¿Alguien que nunca ha usado esta herramienta podría seguir mis instrucciones?
2. ¿Definí cada término técnico en su primera aparición?
3. ¿Mis analogías requieren conocimiento técnico previo?
4. ¿Incluí los pasos intermedios que un experto daría por sentado?
5. ¿Podría mi primo que es ingeniero de hardware (no de software) entender esto?

## Señales de Alerta

**Si escribes:**
- Múltiples términos técnicos sin definir en un párrafo
- "Obviamente..." o "Simplemente..." (nada es obvio para todos)
- Referencias a herramientas sin explicar qué hacen
- Analogías con otros conceptos técnicos
- Instrucciones que asumen setup previo no mencionado

**Probablemente necesitas más contexto.**

## El Test Final

Lee tu párrafo y pregúntate: **"¿Podría alguien inteligente pero nuevo a IA seguir esto sin googlear nada?"**

Si la respuesta es no, agrega contexto. No dumbing down — adding context.

## Recordatorio

No estamos simplificando para el mínimo común denominador. Estamos siendo **completos**. La diferencia:
- Simplificar: "Los agentes son como asistentes"
- Ser completo: "Los agentes son programas especializados que ejecutan tareas específicas — como contratar un experto para un solo proyecto"

La segunda versión respeta la inteligencia del lector mientras asegura comprensión.

## Cuándo Aplicar

1. **Primera mención** de cualquier herramienta, término o concepto
2. **Describiendo procesos** de construcción, testing o debugging
3. **Explicando workflows** de cualquier tipo
4. **Narrando anécdotas** técnicas ("cómo llegué de A a B")
5. **Introduciendo abstracciones** o arquitecturas

La regla de oro: Si tuviste que aprenderlo, alguien más también. Comparte ese aprendizaje.
