CREATE TABLE "{{DATABASE}}"."profile_hits" (
    profile_hit_id	serial NOT NULL,
    cds_id	int4,
    name	text,
    evalue	float8,
    bitscore	float8,
    seeds	int4,
    CONSTRAINT profile_hits_pkey PRIMARY KEY (profile_hit_id),
    CONSTRAINT profile_hits_cds_id_fkey FOREIGN KEY (cds_id) REFERENCES "{{DATABASE}}"."cdss" (cds_id) ON DELETE CASCADE,
    CONSTRAINT profile_hits_name_fkey FOREIGN KEY (name) REFERENCES "{{DATABASE}}"."profiles" (name)
);

COMMENT ON TABLE "{{DATABASE}}"."profile_hits" IS
  'A hit against one of the cluster detection profiles in a gene';

CREATE INDEX profile_hits_cds_id_idx ON "{{DATABASE}}"."profile_hits" (cds_id);
