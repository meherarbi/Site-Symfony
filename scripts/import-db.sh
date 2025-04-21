#!/bin/bash
# ./scripts/import-db.sh

# Nom du conteneur MySQL
CONTAINER_NAME=symfony_db

# Fichier .sql sur ton PC
SQL_FILE=u894582922_store.sql

# Chemin cible dans le conteneur
TARGET_PATH=/tmp/db.sql

echo "🚀 Import de la base de données..."

# Copier le fichier .sql dans le conteneur
docker cp "$SQL_FILE" "$CONTAINER_NAME":"$TARGET_PATH"

# Exécuter la commande d'import dans le conteneur
docker exec -i "$CONTAINER_NAME" sh -c "mysql -u root -proot symfony < $TARGET_PATH"

echo "✅ Import terminé avec succès !"
