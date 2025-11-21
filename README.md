# Gestion Notes API

Application Spring Boot pour gérer les notes des étudiants.

## Déploiement avec Docker

1. Construire l'application :
   ```bash
   mvn clean package -DskipTests
   ```

2. Lancer avec Docker Compose :
   ```bash
   docker compose up -d
   ```

3. L'application sera disponible sur http://localhost:8082

## Tester avec Postman

Importer le fichier `GestionNotes.postman_collection.json` dans Postman et lancer les requêtes.

### Endpoints

- GET /api/notes/semestre/{semestre}/{idEtudiant} : Notes d'un semestre
- GET /api/notes/annee/{annee}/{idEtudiant} : Notes d'une année

### Réponse

Format JSON :
```json
{
  "status": "success",
  "data": [...],
  "error": null
}
```

## Arrêter

```bash
docker compose down
```