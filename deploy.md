# 🚀 Deploy a GitHub Pages

## Requisitos

- Flutter SDK (con soporte web)
- Repositorio en GitHub
- Git configurado

---

## Opción 1: Manual (una sola vez)

```bash
# 1. Construye los archivos estáticos
flutter build web

# 2. Entra a la carpeta de salida
cd build/web

# 3. Inicializa un repo temporal y sube a gh-pages
git init
git add .
git commit -m "deploy: $(date)"
git remote add origin git@github.com:romeldev/flutter_application_1.git
git push -f origin HEAD:gh-pages
```

### En GitHub:

1. Ve a **Settings → Pages**
2. En **Source**, selecciona **Deploy from a branch**
3. Branch: `gh-pages` → `/ (root)`
4. Guardar

Tu app quedará disponible en:
```
https://romeldev.github.io/flutter_application_1
```

---

## Opción 2: Automático con GitHub Actions (recomendado)

### 1. Crea el archivo `.github/workflows/deploy.yml`

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: ["main"]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    permissions:
      contents: write

    steps:
      - uses: actions/checkout@v4

      - uses: subosito/flutter-action@v2
        with:
          channel: stable

      - run: flutter build web

      - uses: peaceiris/actions-gh-pages@v4
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./build/web
```

### 2. Haz push a `main`

```bash
git add .
git commit -m "chore: add github actions deploy"
git push origin main
```

### 3. En GitHub:

Ve a **Settings → Pages** y confirma que **Source** esté en **Deploy from a branch** → `gh-pages` → `/ (root)`.

A partir de ahora, cada `git push` a `main` despliega automáticamente.

---

## ⚠️ Notas importantes

- La URL será `https://romeldev.github.io/flutter_application_1/`
- Si tu app usa `Navigator` con rutas nombradas, agrega la propiedad `urlPathStrategy` para que funcione correctamente con rutas tipo `/#/buscar`
- El primer deploy puede tardar 1-2 minutos en aparecer
