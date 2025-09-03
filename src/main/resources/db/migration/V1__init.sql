create table member (
    member_id bigint not null auto_increment,
    email varchar(255) not null,
    name varchar(255) not null,
    password varchar(255) not null,
    role enum ('ADMIN','MEMBER') not null,
    primary key (member_id)
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_unicode_ci;

create table reservation_time (
    start_at time(6) not null,
    time_id bigint not null auto_increment,
    primary key (time_id)
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_unicode_ci;

create table black_list (
    banned_since datetime(6),
    black_list_id bigint not null auto_increment,
    member_id bigint not null,
    reason varchar(255) not null,
    primary key (black_list_id),
    constraint unique_black_list_member_id
        unique (member_id),
    constraint fk_black_list_member_id
            foreign key (member_id)
            references member (member_id)
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_unicode_ci;

create table meeting_room (
    meeting_room_id bigint not null auto_increment,
    available_people_count bigint not null,
    name varchar(255) not null,
    reason varchar(255) not null,
    primary key (meeting_room_id)
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_unicode_ci;

create table reservation (
    date date not null,
    meeting_room_id bigint,
    member_id bigint,
    reservation_id bigint not null auto_increment,
    time_id bigint,
    primary key (reservation_id),
    constraint fk_reservation_meeting_room_id
        foreign key (meeting_room_id)
        references meeting_room (meeting_room_id),
    constraint fk_reservation_member_id
        foreign key (member_id)
        references member (member_id),
    constraint fk_reservation_time_id
        foreign key (time_id)
        references reservation_time (time_id)
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_unicode_ci;
