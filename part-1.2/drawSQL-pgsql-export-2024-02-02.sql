CREATE TABLE "users"(
    "id" BIGINT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "region_location_id" BIGINT NOT NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("id");
CREATE TABLE "categories"(
    "id" BIGINT NOT NULL,
    "category_name" TEXT NOT NULL,
    "category_description" TEXT NOT NULL
);
ALTER TABLE
    "categories" ADD PRIMARY KEY("id");
CREATE TABLE "regions"(
    "id" BIGINT NOT NULL,
    "region_name" TEXT NOT NULL
);
ALTER TABLE
    "regions" ADD PRIMARY KEY("id");
CREATE TABLE "posts"(
    "id" BIGINT NOT NULL,
    "post_title" TEXT NOT NULL,
    "post_text" TEXT NOT NULL,
    "post_location" TEXT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "region_id" BIGINT NOT NULL,
    "category_id" BIGINT NOT NULL
);
ALTER TABLE
    "posts" ADD PRIMARY KEY("id");
ALTER TABLE
    "posts" ADD CONSTRAINT "posts_region_id_foreign" FOREIGN KEY("region_id") REFERENCES "regions"("id");
ALTER TABLE
    "posts" ADD CONSTRAINT "posts_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("id");
ALTER TABLE
    "posts" ADD CONSTRAINT "posts_category_id_foreign" FOREIGN KEY("category_id") REFERENCES "categories"("id");