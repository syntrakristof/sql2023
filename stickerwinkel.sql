create or replace table colors
(
    id   smallint    not null primary key,
    color_name varchar(45) not null,
    constraint name_UNIQUE unique (color_name)
);

create or replace table countries
(
    id   int auto_increment primary key,
    code varchar(3)  not null,
    country_name varchar(50) not null,
    constraint code_UNIQUE unique (code),
    constraint name_UNIQUE unique (country_name)
);

create or replace table customers
(
    id         int auto_increment primary key,
    customer_name       varchar(200) not null,
    email      varchar(255) not null,
    street     varchar(100) null,
    street_nr  varchar(12)  null,
    zip_code   varchar(10)  null,
    city       varchar(86)  null,
    country_id int          null,
    created    datetime     null,
    updated    datetime     null,
    constraint email_UNIQUE unique (email)
);

create or replace definer = root@`127.0.0.1` trigger trg__customers_before_insert
before insert on customers for each row
BEGIN
    SET new.created = NOW();
    SET new.updated = NOW();
END;

create or replace definer = root@`127.0.0.1` trigger trg__customers_before_update
before update on customers for each row
BEGIN
    SET new.updated = NOW();
END;

create or replace table sales
(
    id          int auto_increment primary key,
    customer_id varchar(45)    not null,
    street      varchar(12)    not null,
    street_nr   varchar(12)    not null,
    zip_code    varchar(10)    not null,
    city        varchar(86)    not null,
    price       decimal(10, 2) not null,
    created     datetime       null,
    updated     datetime       null
);

create or replace definer = root@`127.0.0.1` trigger trg__sales_before_insert
before insert on sales for each row
BEGIN
  SET new.created = NOW();
  SET new.updated = NOW();
END;

create or replace definer = root@`127.0.0.1` trigger trg__sales_before_update
before update on sales for each row
BEGIN
    SET new.updated = NOW();
END;

create or replace table sticker_types
(
    id   smallint  not null primary key,
    type_name varchar(45) not null,
    constraint name_UNIQUE unique (type_name)
);

create or replace table stickers
(
    id             int auto_increment primary key,
    description    varchar(45)    not null,
    color_id       smallint       not null,
    stickertype_id smallint       not null,
    price          decimal(10, 2) not null,
    created        datetime       null,
    updated        datetime       null,
    constraint fk_colortype_fk foreign key (color_id) references colors (id),
    constraint fk_stickertype_fk_fk foreign key (stickertype_id) references sticker_types (id)
);

create or replace table sales_detail
(
    id         int auto_increment primary key,
    sales_id   int            not null,
    sticker_id int            not null,
    quantity   int            not null,
    price      decimal(10, 2) not null,
    constraint FK_sales_detail_stickers foreign key (sticker_id) references stickers (id)
);

create or replace definer = root@`127.0.0.1` trigger trg__stickers_before_insert
before insert on stickers for each row
BEGIN
 SET new.created = NOW();
 SET new.updated = NOW();
END;

create or replace definer = root@`127.0.0.1` trigger trg__stickers_before_update
before update on stickers for each row
BEGIN
 SET new.updated = NOW();
END;

create or replace definer = root@`127.0.0.1` view view_salesreport as
select `s`.`created`                                AS `created`,
       sum(`d`.`price`)                             AS `totalprice`,
       group_concat(`d`.`sticker_id` separator ',') AS `itemssold`
from (`stickerwinkel`.`sales` `s` join `stickerwinkel`.`sales_detail` `d` on (`d`.`sales_id` = `s`.`id`))
order by `s`.`created` desc;

create or replace definer = root@`127.0.0.1` view view_sold_what_to_whom as
select `s`.`price` AS `price`, `c`.`customer_name` AS `name`, sum(`d`.`quantity`) AS `quantity`
from ((`stickerwinkel`.`sales` `s` join `stickerwinkel`.`customers` `c`
       on (`c`.`id` = `s`.`customer_id`)) join `stickerwinkel`.`sales_detail` `d` on (`d`.`sales_id` = `s`.`id`))
order by `s`.`price`;

create or replace definer = root@`127.0.0.1` view view_top_5_products_sold as
select `st`.`description` AS `productname`, sum(`d`.`quantity`) AS `quantity`, sum(`d`.`price`) AS `totalprice`
from ((`stickerwinkel`.`sales` `s` join `stickerwinkel`.`sales_detail` `d`
       on (`d`.`sales_id` = `s`.`id`)) join `stickerwinkel`.`stickers` `st` on (`d`.`sticker_id` = `st`.`id`))
group by `st`.`name`
order by sum(`d`.`quantity`) desc
limit 5;
