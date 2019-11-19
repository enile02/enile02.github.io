CREATE TABLE frisor (
    frisorid serial primary key,
    fornavn text not null,
    etternavn text not null,
    mobil text
);

CREATE TABLE kunde (
    kundeid serial primary key,
    fornavn text not null,
    etternavn text not null,
    mobil text,
    kjonn text default 'f'
);

CREATE TABLE klipp (
    klippid serial primary key,
    dato text not null,
    betalt text not null,
    pris text,
    frisorid int references frisor (frisorid),
    kundeid int references kunde (kundeid)
);