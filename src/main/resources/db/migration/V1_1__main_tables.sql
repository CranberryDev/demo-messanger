create table if not exists "accounts" (
  id bigserial,
  name varchar,
  login varchar,
  password varchar,
  active boolean,

  constraint pk_account_id primary key (id),
  unique (login)
);

create table if not exists dialogs (
  id bigserial,
  owner_id bigint,
  member_id bigint,

  constraint pk_dialogs primary key (id),
  constraint fk_dialogs_owner_id foreign key (owner_id) references accounts (id),
  constraint fk_dialogs_member_id foreign key (member_id) references accounts (id)
);
create index idx_dialogs_owner_id on dialogs (owner_id);
create index idx_dialogs_member_id on dialogs (member_id);

create table if not exists messages (
  id bigserial,
  contact_id bigint,
  message varchar,
  "when" bigint,

  constraint pk_messages_id primary key (id),
  constraint fk_messages_contact_id foreign key (contact_id) references accounts (id)
);
create index idx_messages_contact_id on messages (contact_id);

create table if not exists sessions (
  id bigserial,
  account_id bigint,
  token varchar,

  constraint pk_session_id primary key (id),
  constraint fk_session_account_id foreign key (account_id) references accounts (id)
);
create index idx_session_account_id ON sessions (account_id);