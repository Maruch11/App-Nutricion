# MediControl - Entrega Xojo Web IDE 2025r2

Esta entrega ahora incluye **salida en formato `.xojo_binary_project`** con la definición de UI móvil y flujo funcional solicitados.

## Entregables

- `MediControl.xojo_binary_project`: archivo de salida principal con estructura de app web móvil (Login, Scanner DNI, Mediciones), eventos, endpoints y build como servicio.
- `xojo_src/MainPageMethods.xojo_code`: métodos Xojo listos para copiar/pegar en `MainPage`.

## Features implementadas según referencia

1. **Vista Login**
   - Usuario + contraseña
   - Botón `Iniciar Sesión`
2. **Vista Scanner DNI**
   - Título, hint y estado de escaneo
   - Cambio de panel automático al detectar DNI
3. **Vista Mediciones**
   - Cabecera DNI + nombre del paciente
   - Grilla de variables antropométricas
   - Acción `Grabar` para persistencia

## Build a servicio (.exe)

En Xojo Web IDE 2025r2:

1. Abrir y validar controles/eventos.
2. Build target: **Windows x64**.
3. Generar `MediControl.exe`.
4. Instalar como servicio con NSSM:

```powershell
nssm install MediControlWeb "C:\apps\MediControl\MediControl.exe"
nssm set MediControlWeb AppDirectory "C:\apps\MediControl"
nssm set MediControlWeb AppParameters "--port=8080"
nssm start MediControlWeb
```
