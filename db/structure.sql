CREATE TABLE "authors" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "name" varchar(255), "birth" date, "address" text, "ctype" varchar(255), "photo" blob, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "authors_books" ("author_id" integer, "book_id" integer);
CREATE TABLE "books" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "isbn" varchar(255), "title" varchar(255), "price" integer, "publish" varchar(255), "published" date, "cd" boolean, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "fun_comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "author_no" integer, "name" varchar(255), "body" text, "deleted" boolean, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "reviews" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "book_id" integer, "user_id" integer, "body" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar(255), "password" varchar(255), "email" varchar(255), "dm" boolean, "roles" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_authors_books_on_author_id" ON "authors_books" ("author_id");
CREATE INDEX "index_authors_books_on_book_id" ON "authors_books" ("book_id");
CREATE INDEX "index_authors_on_user_id" ON "authors" ("user_id");
CREATE INDEX "index_reviews_on_book_id" ON "reviews" ("book_id");
CREATE INDEX "index_reviews_on_user_id" ON "reviews" ("user_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20120319130932');

INSERT INTO schema_migrations (version) VALUES ('20120322043954');

INSERT INTO schema_migrations (version) VALUES ('20120322044109');

INSERT INTO schema_migrations (version) VALUES ('20120322044244');

INSERT INTO schema_migrations (version) VALUES ('20120322044401');

INSERT INTO schema_migrations (version) VALUES ('20120322044507');