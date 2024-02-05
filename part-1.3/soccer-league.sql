CREATE TABLE "matches"(
    "id" BIGINT NOT NULL,
    "home_team_id" BIGINT NOT NULL,
    "away_team_id" BIGINT NOT NULL,
    "location" TEXT NOT NULL,
    "date" DATE NOT NULL,
    "start_time" TIME(0) WITHOUT TIME ZONE NOT NULL,
    "season_id" BIGINT NOT NULL,
    "head_referee_id" BIGINT NOT NULL,
    "assistant_ref_id" BIGINT NOT NULL,
    "assistant_ref2_id" BIGINT NOT NULL
);
ALTER TABLE
    "matches" ADD PRIMARY KEY("id");
CREATE TABLE "results"(
    "id" BIGINT NOT NULL,
    "team_id" BIGINT NOT NULL,
    "match_id" BIGINT NOT NULL,
    "result (W, L, D)" TEXT NOT NULL
);
ALTER TABLE
    "results" ADD PRIMARY KEY("id");
CREATE TABLE "season"(
    "id" BIGINT NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL
);
ALTER TABLE
    "season" ADD PRIMARY KEY("id");
CREATE TABLE "goals"(
    "id" BIGINT NOT NULL,
    "player_id" BIGINT NOT NULL,
    "match_id" BIGINT NOT NULL
);
ALTER TABLE
    "goals" ADD PRIMARY KEY("id");
CREATE TABLE "teams"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "city" TEXT NOT NULL
);
ALTER TABLE
    "teams" ADD PRIMARY KEY("id");
CREATE TABLE "lineups"(
    "id" BIGINT NOT NULL,
    "player_id" BIGINT NOT NULL,
    "match_id" BIGINT NOT NULL,
    "team_id" BIGINT NOT NULL
);
ALTER TABLE
    "lineups" ADD PRIMARY KEY("id");
CREATE TABLE "players"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "birthday" DATE NOT NULL,
    "height" INTEGER NOT NULL,
    "current_team_id" INTEGER NOT NULL
);
ALTER TABLE
    "players" ADD PRIMARY KEY("id");
CREATE TABLE "referees"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "referees" ADD PRIMARY KEY("id");
ALTER TABLE
    "players" ADD CONSTRAINT "players_current_team_id_foreign" FOREIGN KEY("current_team_id") REFERENCES "teams"("id");
ALTER TABLE
    "matches" ADD CONSTRAINT "matches_head_referee_id_foreign" FOREIGN KEY("head_referee_id") REFERENCES "referees"("id");
ALTER TABLE
    "goals" ADD CONSTRAINT "goals_player_id_foreign" FOREIGN KEY("player_id") REFERENCES "players"("id");
ALTER TABLE
    "results" ADD CONSTRAINT "results_team_id_foreign" FOREIGN KEY("team_id") REFERENCES "teams"("id");
ALTER TABLE
    "matches" ADD CONSTRAINT "matches_season_id_foreign" FOREIGN KEY("season_id") REFERENCES "season"("id");
ALTER TABLE
    "matches" ADD CONSTRAINT "matches_assistant_ref_id_foreign" FOREIGN KEY("assistant_ref_id") REFERENCES "referees"("id");
ALTER TABLE
    "matches" ADD CONSTRAINT "matches_home_team_id_foreign" FOREIGN KEY("home_team_id") REFERENCES "teams"("id");
ALTER TABLE
    "goals" ADD CONSTRAINT "goals_match_id_foreign" FOREIGN KEY("match_id") REFERENCES "matches"("id");
ALTER TABLE
    "matches" ADD CONSTRAINT "matches_away_team_id_foreign" FOREIGN KEY("away_team_id") REFERENCES "teams"("id");
ALTER TABLE
    "lineups" ADD CONSTRAINT "lineups_player_id_foreign" FOREIGN KEY("player_id") REFERENCES "players"("id");
ALTER TABLE
    "results" ADD CONSTRAINT "results_match_id_foreign" FOREIGN KEY("match_id") REFERENCES "matches"("id");
ALTER TABLE
    "lineups" ADD CONSTRAINT "lineups_match_id_foreign" FOREIGN KEY("match_id") REFERENCES "matches"("id");
ALTER TABLE
    "lineups" ADD CONSTRAINT "lineups_team_id_foreign" FOREIGN KEY("team_id") REFERENCES "teams"("id");
ALTER TABLE
    "matches" ADD CONSTRAINT "matches_assistant_ref2_id_foreign" FOREIGN KEY("assistant_ref2_id") REFERENCES "referees"("id");