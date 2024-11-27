
-- Создаём таблицу test_table с необходимыми столбцами


CREATE TABLE test_table (
    name VARCHAR(10) CHECK (LENGTH(name) >= 4),
    surname VARCHAR(100),
    city VARCHAR(100),
    age INTEGER CHECK (age > 0 AND age <= 150)
);

GRANT ALL PRIVILEGES ON DATABASE ozorninbd TO myuser;

-- Добавляем данные
INSERT INTO test_table (name, surname, city, age) VALUES
('Anna',    'Ivanova',    'Moscow',       28),
('Igor',    'Petrov',     'Kazan',        32),
('Elena',   'Sidorova',   'Minsk',        25),
('Alex',    'Fedorov',    'Sochi',        35),
('Maxim',     'Romanov',    'Kiev',       27),
('Nina',    'Kuznetsova', 'Tula',         41),
('Ivan',    'Smirnov',    'Omsk',         23),
('Oleg',    'Volkov',     'Perm',         36),
('Igor',    'Morozov',    'Tomsk',        33),
('Pavel',   'Kozlov',     'Samara',       29),
('Vera',    'Orlova',     'Kirov',        26),
('Lena',    'Lebedeva',   'Ufa',          37),
('Vadim',   'Zhukov',     'Novosibirsk',  34),
('Irina',   'Melnikova',  'Vladivostok',  31),
('Olga',    'Popova',     'Astrakhan',    28),
('Svetlana','Andreeva',   'Kaluga',       22),
('Dmitry',  'Tarasov',    'Voronezh',     40),
('Kira',    'Vlasova',    'Yaroslavl',    29),
('Roman',   'Sokolov',    'Chelyabinsk',  36),
('Sergey',  'Ivanov',     'Tyumen',       30);
