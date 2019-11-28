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
    klipptime date,
    betalt text not null,
    pris int default = 1200,
    frisorid int references frisor (frisorid),
    kundeid int references kunde (kundeid)
);




1. Slett alle kunder som er menn
	Delete from kunde where kjonn=‘m’;

2. Insert kundene «ole Olsen» og «Ane Brun»
	insert into kunde (fornavn, etternavn) values (‘Ole’, ‘Olsen’), (‘Ane’, ‘Brun’);

3. Select alle kunder som har navn som ligner på «kri»
	select * from kunde where fornavn ~ ’kri’;

4. Update alle klipp - pris = 200
	update klipp set pris = 200;

* betyr «alle felt». Kan heller skrive "select Fornavn, etternavn from" dersom vi bare vil ha fra de feltene




CREATE TABLE kunde(
    kundeid serial primary key,
    navn text not null,
    adresse text not null
);

CREATE TABLE vare(
    vareid serial primary key,
    navn text not null,
    pris int not null,
    vekt text not null
);

CREATE TABLE bestilling(
    bestillingid serial primary key,
    pris int not null,
    antall int not null,
    betalt text default 'nei',
    kundeid int references kunde (kundeid),
    vareid int references vare (vareid)
);


