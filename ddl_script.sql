create table "user"
(
    user_id    integer     not null
        constraint user_pk
            primary key,
    first_name varchar(32) not null,
    last_name  varchar(32) not null,
    age        integer
);

alter table "user"
    owner to admin;

create index user_age_index
    on "user" (age);

create index user_last_name_index
    on "user" (last_name);

create table address_type
(
    address_type varchar(8) not null
        constraint address_type_pk
            primary key,
    description  varchar(32)
);

alter table address_type
    owner to admin;

create table address
(
    address_id     integer     not null
        constraint address_pk
            primary key,
    address_line_1 varchar(64) not null,
    address_line_2 varchar(64),
    city           varchar(32) not null,
    state          varchar(32) not null,
    country        varchar(32) not null,
    zip            integer     not null,
    user_id        integer     not null
        constraint address_user_id_fk
            references "user",
    address_type   varchar(8)  not null
        constraint address_address_type_fk
            references address_type,
    unique (user_id, address_type)
);

alter table address
    owner to admin;

create index address_city_index
    on address (city);

create index address_country_index
    on address (country);

create index address_state_index
    on address (state);

create index address_zip_index
    on address (zip);

create index address_user_id_index
    on address (user_id);