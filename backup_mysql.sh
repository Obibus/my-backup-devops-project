
USER="root"
PASSWORD="my-secret-pw"
DATABASE="devops_practice"
BACKUP_DIR="/c/Folder/Other/учоба/5 курс/DevOps/практична 2/backups"

DATE=$(date +"%Y%m%d_%H%M%S")


mkdir -p "$BACKUP_DIR"

# Створення бекапу бази даних
docker exec my-mysql-container /usr/bin/mysqldump -u "$USER" --password="$PASSWORD" "$DATABASE" > "$BACKUP_DIR/backup_$DATE.sql"

# Перевірка, чи був бекап створений
if [ -f "$BACKUP_DIR/backup_$DATE.sql" ]; then
    echo "Бекап бази даних $DATABASE створено успішно і збережено в $BACKUP_DIR/backup_$DATE.sql"
else
    echo "Помилка під час створення бекапу бази даних"
fi
