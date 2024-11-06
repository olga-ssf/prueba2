# Ejecución microservicios

* Status: proposed
* Date: 2024-11-06

## Context and Problem Statement

Para ejecutar los microservicios se necesita un software especial.

## Decision Drivers

* RF9-Ejecución de microservicios

## Considered Options

* Docker
* Kubernetes

## Decision Outcome

Chosen option: "Docker", because proporciona suficiente funcionalidad para desplegar y gestionar eficientemente el sistema descrito. Kubernetes sería beneficioso si se requiere una infraestructura de microservicios compleja, altamente escalable y distribuida.

### Positive Consequences

* Simplicidad y rapidez en el despliegue: Docker es ideal para entornos que no requieren orquestación avanzada, como la gestión de unos pocos microservicios donde la escalabilidad extrema y la tolerancia a fallos no son críticas.
* Desarrollo incremental: Para una arquitectura de microservicios aún en transición o que no demande un clúster complejo, Docker permite la separación y prueba de cada servicio de forma independiente, manteniendo la agilidad en el desarrollo.
* Costes y recursos optimizados: Docker no requiere una infraestructura tan compleja ni costosa como Kubernetes, lo que es ventajoso para sistemas en etapas iniciales de transformación o para empresas que buscan optimizar recursos y reducir costes.

### Negative Consequences

* Orquestación limitada: Docker solo gestiona contenedores individuales; su sistema de orquestación (Docker Swarm) es limitado en comparación con Kubernetes, lo que dificulta la administración de despliegues grandes y complejos.

## Pros and Cons of the Options

### Docker

Docker se utiliza principalmente para la construcción, el despliegue y la gestión de aplicaciones.

* Bueno, porque se caracteriza por su simplicidad y facilidad de uso. Docker es más sencillo de configurar y utilizar, ideal para entornos de desarrollo o para proyectos de microservicios en etapas iniciales.
* Bueno, porque los contenedores Docker pueden ejecutarse de manera consistente en distintas máquinas y entornos, facilitando el despliegue y pruebas.
* Bueno, porque consume menos recursos que una máquina virtual completa y permite empaquetar dependencias de forma ligera.
* Bueno, porque permite a los desarrolladores trabajar en contenedores independientes sin conflictos de dependencias, acelerando el ciclo de desarrollo.
* Malo, porque aunque permite alguna orquestación, no es tan robusto para sistemas que necesitan balanceo de carga complejo y alta disponibilidad.
* Malo, porque no ofrece herramientas avanzadas para la tolerancia a fallos y la recuperación automática que Kubernetes tiene incorporadas.

### Kubernetes

Kubernetes es una plataforma de orquestación de contenedores de código abierto que automatiza el despliegue, el escalado y la gestión de aplicaciones en contenedores.

* Bueno, porque tiene alta escalabilidad y orquestación avanzada. Kubernetes gestiona de manera efectiva la orquestación de miles de contenedores, permitiendo autoescalado y despliegues complejos.
* Bueno, porque tiene recuperación automática. Puede reiniciar contenedores automáticamente en caso de fallo, asignar recursos dinámicamente y realizar actualizaciones de manera controlada
* Bueno, porque permite despliegues y balanceo de carga robustos. Kubernetes permite manejar el tráfico de red y balanceo de carga de forma avanzada, adecuado para aplicaciones de alto rendimiento.
* Bueno, porque permite la gestión de configuración y secretos. Kubernetes tiene sistemas integrados para la gestión de secretos y configuración sensible de manera segura.
* Malo, porque tiene alta complejidad y curva de aprendizaje. Kubernetes tiene una configuración y administración complejas, lo que puede representar una curva de aprendizaje considerable.
* Malo, porque tiene un mayor uso de recursos. Los clústeres de Kubernetes pueden consumir muchos recursos, por lo que requieren infraestructura y administración adecuadas.
* Malo, porque tiene un alto coste operativo. Mantener Kubernetes puede ser costoso en términos de infraestructura y personal especializado.
