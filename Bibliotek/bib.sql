-- drop table bok, laaner, forfatter, eksemplar, utlaan cascade;


CREATE TABLE laaner(
    laanerid serial primary key,
    fornavn text not null,
    etternavn text not null,
    adresse text,
    epost text,
    tlf text not null,
    kjonn text
);

CREATE TABLE forfatter
(
    forfatterid serial primary key,
    fornavn text not null,
    etternavn text not null,
    fdato date,
    kjonn text check (
        kjonn = 'm'
        or kjonn = 'f'
    )
);

CREATE TABLE bok
(
    bokid serial primary key,
    tittel text not null,
    isbn text,
    antallSider int check (antallSider > 0),
    pdato date,
    spraak text,
    sjanger text,
    forfatterid int references forfatter (forfatterid)
);

CREATE TABLE eksemplar
(
    eksemplarid serial primary key,
    tilstand text not null,
    bokid int references bok (bokid)
);

CREATE TABLE utlaan
(
    utlaanid serial primary key,
    dato date not null,
    innlevert text default 'nei' check (
        innlevert = 'ja'
        or innlevert = 'nei'
    ),
    laanerid int references laaner (laanerid),
    eksemplarid int references eksemplar (eksemplarid)
);