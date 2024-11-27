import time
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

def create_connection():
    """
    Создаёт подключение к базе данных PostgreSQL с повторными попытками
    """
    for attempt in range(5):  # До 5 попыток подключения
        try:
            connection = psycopg2.connect(
                dbname="ozorninbd",
                user="myuser",
                password="mypassword",
                host="postgres",
                port="5432"
            )
            connection.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
            return connection
        except psycopg2.OperationalError as e:
            print(f"Попытка {attempt + 1} не удалась. Повтор через 5 секунд...")
            time.sleep(5)
    raise Exception("Не удалось подключиться к базе данных после 5 попыток.")

def main():
    """
    Выполняет запрос к таблице и выводит результаты
    """
    try:
        connection = create_connection()
        cursor = connection.cursor()

        # SQL-запрос
        query = """
        SELECT name, MIN(age) AS min_age, MAX(age) AS max_age
        FROM test_table
        WHERE LENGTH(name) < 6
        GROUP BY name;
        """
        cursor.execute(query)

        # Обработка результатов
        rows = cursor.fetchall()
        for row in rows:
            print(f"Имя: {row[0]}, Минимальный возраст: {row[1]}, Максимальный возраст: {row[2]}")

        # Закрытие соединения
        cursor.close()
        connection.close()

    except Exception as e:
        print(f"Ошибка выполнения скрипта: {e}")

if __name__ == '__main__':
    main()

