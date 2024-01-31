CREATE TABLE public.driver (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT NOT NULL
);

CREATE TABLE public.passenger (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT NOT NULL
);

CREATE TABLE public.ride (
    id INTEGER PRIMARY KEY,
    driver_id INTEGER NOT NULL,
    passenger_id INTEGER NOT NULL,
    distance TEXT NOT NULL
);